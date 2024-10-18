using System.ComponentModel.DataAnnotations;

namespace WebApplication1.ViewModels
{
    
    public class RegisterViewModel{

        [Required(ErrorMessage = "שם פרטי חובה")]
        public string? FirstName { get; set; }

        [Required(ErrorMessage = "שם משפחה חובה")]
        public string? LastName { get; set; }

        [Required(ErrorMessage = "אימייל חובה")]
        [EmailAddress(ErrorMessage = "האימייל שהוזן אינו תקין.")]
        public string? Email { get; set; }

        [Required(ErrorMessage = "סיסמה חובה")]
        [DataType(DataType.Password)]
        [StringLength(40, MinimumLength = 8) ]
        public string? Password { get; set; }

        public string? Role { get; set; }
    }
}