using System.ComponentModel.DataAnnotations;
using WebApplication1.Models;

namespace WebApplication1.ViewModels
{
    
   public class VacationViewModel
    {
        public Vication Vacation { get; set; }
        public int FollowerCount { get; set; }
        public bool IsFollowed { get; set; }
    }

}