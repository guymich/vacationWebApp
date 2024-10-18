using System.Diagnostics;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebApplication1.Models;
using WebApplication1.ViewModels;
using Newtonsoft.Json;
using Microsoft.AspNetCore.Components.Forms;
using System.Text;


namespace WebApplication1.Controllers
{
    public class VacationController : Controller
    {

        private readonly ILogger<AccountController> _logger; // Fix: Should refer to AccountController, not HomeController
        private readonly ApplicationDbContext _context;

        private readonly SignInManager<User> signInManager;
        private readonly UserManager<User> userManager;


        public VacationController(ApplicationDbContext context, ILogger<AccountController> logger,UserManager<User> userManager,SignInManager<User> signInManager ) // Fix: Inject ILogger for AccountController
        {
            _context = context;
            _logger = logger;

            this.signInManager = signInManager;
            this.userManager = userManager;
        }

       public async Task<IActionResult> IndexAsync(int p = 0, bool Followed = false, bool CurrentDate = false, bool Active = false )
        {
            var user = await userManager.GetUserAsync(User);

            if (user == null)
            {
                return RedirectToAction("Login", "Account");
            }

            int pageSize = 10;
            int skip = pageSize * p;
            ViewBag.PageNumber = p;
            
            DateTime? currentDateTime = null;
            ViewBag.Followed = Followed;
            ViewBag.CurrentDate = CurrentDate;
            ViewBag.Active = Active;

            if (CurrentDate)
            {
                currentDateTime = DateTime.Now;
            }
            if (Active)
            {
                CurrentDate = false;
                currentDateTime = DateTime.Now;

            }

            // Get followed vacation IDs if Followed is true
            List<int> followedVacationIds = new List<int>();
                followedVacationIds = await _context.Followers
                    .Where(f => f.UserId == user.Id)
                    .Select(f => f.VicationsId)
                    .ToListAsync();

            // Retrieve vacations based on Followed parameter and currentDate
            IQueryable<VacationViewModel> query = _context.Vications
                .Where(v => CurrentDate ? v.StartDate >= currentDateTime : true)
                .Where(v => Active ? v.StartDate >= currentDateTime && v.EndDate < currentDateTime : true) // Conditionally filter by current date
                .Where(v => Followed ? followedVacationIds.Contains(v.Id) : true) // Conditionally filter by followed vacations
                .Select(v => new VacationViewModel
                {
                    Vacation = v,
                    FollowerCount = _context.Followers.Count(f => f.VicationsId == v.Id),
                    IsFollowed = followedVacationIds.Contains(v.Id)
                });

            // Execute the paginated query
            var vacationsWithFollowerCounts = await query
                .OrderByDescending(v => v.Vacation.StartDate) // Order by StartDate descending
                .Skip(skip) // Skip for pagination
                .Take(pageSize) // Take the specified number of items per page
                .ToListAsync();

            // Get total count for pagination, filtering by Followed and currentDate
            int totalVacationsCount = Followed 
                ? followedVacationIds.Count
                : await _context.Vications
                    .CountAsync();

            // Store data for the view
            ViewBag.FollowedVacations = JsonConvert.SerializeObject(followedVacationIds);
            if(totalVacationsCount > 0){
                ViewBag.VacationCount = (int)Math.Ceiling(totalVacationsCount / (double)pageSize); // Total pages count
            }else{
                ViewBag.VacationCount = 0;
            }

            return View(vacationsWithFollowerCounts);
        }


        private object await(object value)
        {
            throw new NotImplementedException();
        }

        // GET: Vacation/Create
        [HttpGet]
        public async Task<IActionResult> CreateAsync()
        {
            var user = await userManager.GetUserAsync(User);

            if(user?.Role == 1)
            {
                
                return View();
            }
            else
            {
                return RedirectToAction("Index", "Home");
            }
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Filter()
        {
            var followed = Request.Form["followed"].ToString();
            var currentDate = Request.Form["currentDate"].ToString();
            var active = Request.Form["active"].ToString();

            // Parameters object to pass to RedirectToAction
            var queryParams = new Dictionary<string, string>();

            if (!string.IsNullOrEmpty(followed) && bool.TryParse(followed, out bool isFollowed) && isFollowed)
            {
                queryParams["Followed"] = "true";
            }
            if (!string.IsNullOrEmpty(currentDate) && bool.TryParse(currentDate, out bool isCurrentDate) && isCurrentDate)
            {
                queryParams["CurrentDate"] = "true";
            }
            if (!string.IsNullOrEmpty(active) && bool.TryParse(active, out bool isActive) && isActive)
            {
                queryParams["Active"] = "true";
            }

            // Redirect to the Index action with the built query parameters
            return RedirectToAction(nameof(Index), queryParams);
        }


       // POST: Vacation/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Create(Vication vacation, IFormFile? imageFile)
        {
            if (ModelState.IsValid)
            {
                if(vacation.StartDate <= DateTime.Now)
                {
                     ModelState.AddModelError("StartDate", "Date cant be past date");
                }
                if (vacation.EndDate <= vacation.StartDate)
                {
                    ModelState.AddModelError("EndDate", "end date must be bigger the start date");
                }
                // Handle image upload
                if (imageFile != null && imageFile.Length > 0)
                {
                    var filePath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot/images", imageFile.FileName);
                    using (var stream = new FileStream(filePath, FileMode.Create))
                    {
                        imageFile.CopyTo(stream);
                    }
                    vacation.ImagePath = "/images/" + imageFile.FileName;
                }

                _context.Vications.Add(vacation);
                _context.SaveChanges();

                TempData["Message"] = "Vacation added sucssesfully!";
                return RedirectToAction("Index");
            }

            return View(vacation);
        }

        public class FollowRequest
        {
            public int Id { get; set; }
            public bool Active { get; set; }
            // Add other properties as necessary
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Follow(Followers follow)
        {
            string body;
            using (var reader = new StreamReader(HttpContext.Request.Body))
            {
                body = await reader.ReadToEndAsync();
                _logger.LogInformation("Raw request body: {Body}", body);
            }

            // Deserialize the body to your FollowRequest DTO
            var request = JsonConvert.DeserializeObject<FollowRequest>(body);
            int vacationId = request.Id;
            bool isActive = request.Active;

            var user = await userManager.GetUserAsync(User);

            if (ModelState.IsValid)
            {
                if(isActive)
                {
                    var followToRemove = await _context.Followers
                        .FirstOrDefaultAsync(f => f.VicationsId == vacationId && f.UserId == user.Id);

                    if (followToRemove != null)
                    {
                        _context.Followers.Remove(followToRemove);
                        await _context.SaveChangesAsync(); // Save changes asynchronously
                        return Json(new { active = false, success = true, message = "Vacation removed successfully!" });
                    }
                }else{

                    // Check if the combination of VicationsId and UserId already exists
                    var existingFollow = await _context.Followers
                    .FirstOrDefaultAsync(f => f.VicationsId == vacationId && f.UserId == user.Id);

                    if (existingFollow != null)
                    {
                        return Json(new { active = false,  success = false, message = "You are already following this vacation!" });
                    }

                    // If it doesn't exist, proceed with the save
                    follow.VicationsId = vacationId;
                    follow.UserId = user.Id;

                    _context.Followers.Add(follow);
                    _context.SaveChanges();

                    return Json(new { active = true, success = true, message = "Vacation added successfully!" });

                }
            }

            // If the model state is not valid, return the view with the model
            return Json(new { active = false, success = false, message = "Invalid data submitted." });
        }

        [HttpGet]
        public IActionResult Edit(int id)
        {
            var vacation = _context.Vications.FirstOrDefault(v => v.Id == id);
            if (vacation == null)
            {
                return NotFound();
            }

            return View(vacation);
        }
        
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Edit(int id, Vication vacation, IFormFile? imageFile)
        {
            if (ModelState.IsValid)
            {
                // Ensure the EndDate is after the StartDate
                if (vacation.EndDate <= vacation.StartDate)
                {
                    ModelState.AddModelError("EndDate", "end date must be bigger the start date");
                }

                // Handle image upload
                if (imageFile != null && imageFile.Length > 0)
                {
                    // A new image is uploaded, so replace the old one
                    var filePath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot/images", imageFile.FileName);
                    using (var stream = new FileStream(filePath, FileMode.Create))
                    {
                        imageFile.CopyTo(stream);
                    }
                    vacation.ImagePath = "/images/" + imageFile.FileName;
                }
                else
                {
                    // No new image uploaded, so keep the existing image
                    var existingVacation = _context.Vications.AsNoTracking().FirstOrDefault(v => v.Id == vacation.Id);
                    if (existingVacation != null)
                    {
                        vacation.ImagePath = existingVacation.ImagePath;
                    }
                }

                // Update vacation details if no validation errors
                if (ModelState.ErrorCount == 0)
                {
                    _context.Vications.Update(vacation);
                    _context.SaveChanges();
                    TempData["Message"] = "Vacation updated successfully!";
                    return RedirectToAction("Index");
                }
            }

            return View(vacation);
        }

        // POST: Vacation/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Delete(int id)
        {
            var vacation = await _context.Vications.FindAsync(id);
            if (vacation != null)
            {
                // Delete the image file from the server if it exists
                if (!string.IsNullOrEmpty(vacation.ImagePath))
                {
                    var filePath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot" + vacation.ImagePath);
                    if (System.IO.File.Exists(filePath))
                    {
                        System.IO.File.Delete(filePath);
                    }
                }

                _context.Vications.Remove(vacation);
                await _context.SaveChangesAsync();
            }
            
            TempData["Message"] = "Deleted sucssesfully!";
            return RedirectToAction("Index", "Vacation");
        }

        public IActionResult ExportVacationsToCsv()
        {
            var vacationFollowers = _context.Vications
            .Select(v => new
            {
                VacationName = v.Destination,
                FollowersCount = _context.Followers.Count(f => f.VicationsId == v.Id)
            })
            .ToList();

            // Build the CSV content
            var csvBuilder = new StringBuilder();
            csvBuilder.AppendLine("Destination,Followers");

            foreach (var item in vacationFollowers)
            {
                csvBuilder.AppendLine($"{item.VacationName},{item.FollowersCount}");
            }

            // Convert the string to a byte array and return as a file
            var bytes = Encoding.UTF8.GetBytes(csvBuilder.ToString());
            var output = new FileContentResult(bytes, "text/csv")
            {
                FileDownloadName = "vacation_followers.csv"
            };

            return output;
        }

        [HttpGet]
        public IActionResult ExportVacations()
        {
            return ExportVacationsToCsv();
        }

       public IActionResult Summary()
        {
            var vacationFollowers = _context.Vications
                .Select(v => new VacationSummaryViewModel
                {
                    VacationName = v.Destination,
                    FollowersCount = _context.Followers.Count(f => f.VicationsId == v.Id)
                })
                .ToList();
                
                var maxFollowersCount = vacationFollowers.Max(v => v.FollowersCount);
                ViewBag.MaxFollowersCount = maxFollowersCount;


            return View(vacationFollowers);
        }

    }
}