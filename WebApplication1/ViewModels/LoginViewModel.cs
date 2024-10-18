using System.ComponentModel.DataAnnotations;

namespace WebApplication1.ViewModels
{
    
    public class LoginViewModel{

        [Required(ErrorMessage = "אימייל חובה")]
        [EmailAddress]
        public string? Email { get; set; }

        [Required(ErrorMessage = "סיסמה חובה")]
        [DataType(DataType.Password)]
        public string? Password { get; set; }
    }
}