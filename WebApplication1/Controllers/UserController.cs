using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Identity;
using WebApplication1.Models; // Ensure this namespace is used
using System.Threading.Tasks;

public class UserController : Controller
{
    private readonly ApplicationDbContext _context;
    private readonly SignInManager<User> _signInManager;
    private readonly UserManager<User> _userManager;

    public UserController(UserManager<User> userManager, ApplicationDbContext context, SignInManager<User> signInManager)
    {
        _context = context;
        _signInManager = signInManager;
        _userManager = userManager;
    }

    // GET: /User/Register
    public IActionResult Register()
    {
        return View();
    }

    // GET: /User/Login
    public IActionResult Login()
    {
        return View();
    }

    // POST: /User/Register
    [HttpPost]
    [ValidateAntiForgeryToken]
    public async Task<IActionResult> Register(User model) {

        var email = Request.Form["Email"];
        var firstName = Request.Form["FirstName"];
        var lastName = Request.Form["LastName"];
        var password = Request.Form["Password"];
    
        if (ModelState.IsValid){

            var user = new User {
                UserName = email,
                Email = email,
                FirstName = firstName,
                LastName = lastName 
            };

        var result = await _userManager.CreateAsync(user, password);

        if (result.Succeeded)
        {
            // Optionally sign in the user or redirect
            return RedirectToAction("Index", "Home");
        }
        foreach (var error in result.Errors)
        {
            ModelState.AddModelError(string.Empty, error.Description);
        }
    }

        return View(model);
    }

    [HttpPost]
    [ValidateAntiForgeryToken]
    public async Task<IActionResult> Login(User model)
    {

        var RememberMe = false;
        var password = "asdasd";
        var email = "asdasd";

        if (ModelState.IsValid)
        {
            // Attempt to sign in the user
            var result = await _signInManager.PasswordSignInAsync(email, password, RememberMe, lockoutOnFailure: false);

            if (result.Succeeded)
            {
                // Redirect to a secure page after successful login
                return RedirectToAction("Index", "Home");
            }
            else if (result.IsLockedOut)
            {
                // Handle user lockout scenario
                return View("Lockout");
            }
            else
            {
                // If login failed, redisplay the form with an error
                ModelState.AddModelError(string.Empty, "Invalid login attempt.");
            }
        }

        return View(model);
    }
}