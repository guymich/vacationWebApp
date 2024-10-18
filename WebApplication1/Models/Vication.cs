using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace WebApplication1.Models
{
public class Vication
    {
        [Key]
        public int Id { get; set; }

        [Required]
        public string? Destination { get; set; }

        public string? Description { get; set; }

        [Required]
        [DataType(DataType.Date)]  
        public DateTime? StartDate { get; set; } 
        
        [Required]
        [DataType(DataType.Date)]  
        public DateTime? EndDate { get; set; } 

        public decimal Price { get; set; }

        public string? ImagePath { get; set; }

        public static implicit operator Vication(int v)
        {
            throw new NotImplementedException();
        }
    }
}