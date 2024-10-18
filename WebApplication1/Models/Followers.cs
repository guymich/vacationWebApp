using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
namespace WebApplication1.Models
{
   public class Followers
{
    [Key]
    public int Id { get; set; }

    // Foreign key for User
    public string? UserId { get; set; }
    public User? User { get; set; } // Navigation property

    // Foreign key for Vacation
    public int VicationsId { get; set; }
    public Vication? Vication { get; set; } // Navigation property
}

}
