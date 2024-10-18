using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using WebApplication1.Models;

public class ApplicationDbContext : IdentityDbContext<User> // If you're using a custom ApplicationUser class
{
    public DbSet<Followers> Followers { get; set; } = null!;
    public DbSet<Vication> Vications { get; set; } = null!;

    public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : base(options)
    {
    }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        base.OnModelCreating(modelBuilder);
    }
}
