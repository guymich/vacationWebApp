using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using WebApplication1.Models;

namespace WebApplication1.Controllers;

public class HomeController : Controller
{
         private readonly ILogger<AccountController> _logger; // Fix: Should refer to AccountController, not HomeController
        private readonly ApplicationDbContext _context;

        public HomeController(ApplicationDbContext context, ILogger<AccountController> logger) // Fix: Inject ILogger for AccountController
        {
            _context = context;
            _logger = logger;
        }

    public IActionResult Index()
    {
        return RedirectToAction("Index", "Vacation");
    }

    public IActionResult Privacy()
    {
        return View();
    }

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}
