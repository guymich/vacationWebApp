using System.Diagnostics;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using WebApplication1.Models;
using WebApplication1.ViewModels;

namespace WebApplication1.Controllers
{
    public class AccountController : Controller
    {
        private readonly ILogger<AccountController> _logger; // Fix: Should refer to AccountController, not HomeController
        private readonly ApplicationDbContext _context;

        private readonly SignInManager<User> signInManager;
        private readonly UserManager<User> userManager;


        public AccountController(ApplicationDbContext context, ILogger<AccountController> logger,UserManager<User> userManager,SignInManager<User> signInManager ) // Fix: Inject ILogger for AccountController
        {
            _context = context;
            _logger = logger;

            this.signInManager = signInManager;
            this.userManager = userManager;
        }

        public IActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Login(LoginViewModel model)
        {
            if (ModelState.IsValid)
            {
                var user = await userManager.FindByEmailAsync(model.Email);
                if (user != null)
                {
                    var result = await signInManager.PasswordSignInAsync(user, model.Password, false, lockoutOnFailure: false);
                    
                    if (result.Succeeded)
                    {
                        // Login successful, redirect to homepage or another action
                        return RedirectToAction("Index", "Vacation");
                    }
                    else
                    {
                        // If login fails, display a message
                        ModelState.AddModelError(string.Empty, "Invalid login attempt.");
                    }
                }
                else
                {
                    // If user is not found, display an error message
                    ModelState.AddModelError(string.Empty, "User not found.");
                }
            }

            // If we got this far, something failed, redisplay form
            return View(model);
        }


        public IActionResult Register()
        {
            return View();
        }


        [HttpPost]
        public async Task<IActionResult> Register(RegisterViewModel model)
        {

            if(ModelState.IsValid)
            {
                var user = new User 
                {
                    FirstName = model.FirstName,
                    LastName = model.LastName,
                    UserName = model.Email,
                    Email = model.Email,
                    Role = 0
                };

                // Check if the email already exists
                var existingUser = await userManager.FindByEmailAsync(model.Email);
                if (existingUser != null)
                {
                    ModelState.AddModelError("Email", "האימייל כבר קיים במערכת.");
                    return View(model);
                }

                var result = await userManager.CreateAsync(user, model.Password);

                if(result.Succeeded)
                {
                    return RedirectToAction("Login", "Account");
                }
                else
                {
                    foreach (var error in result.Errors)
                    {
                        ModelState.AddModelError(string.Empty, error.Description);
                    }

                    return View(model);
                }
            }
                return View(model);
        }
        
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Logout()
        {
            await signInManager.SignOutAsync();
            return RedirectToAction("Index", "Home");
        }

    }
}
