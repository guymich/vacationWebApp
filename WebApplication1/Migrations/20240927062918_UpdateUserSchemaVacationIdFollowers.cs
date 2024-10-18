using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace WebApplication1.Migrations
{
    public partial class UpdateUserSchemaVacationIdFollowers : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "VicationId",
                table: "Followers",
                type: "varchar(255)",
                nullable: true)
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateIndex(
                name: "IX_Followers_VicationId",
                table: "Followers",
                column: "VicationId");

            migrationBuilder.AddForeignKey(
                name: "FK_Followers_AspNetUsers_VicationId",
                table: "Followers",
                column: "VicationId",
                principalTable: "AspNetUsers",
                principalColumn: "Id");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Followers_AspNetUsers_VicationId",
                table: "Followers");

            migrationBuilder.DropIndex(
                name: "IX_Followers_VicationId",
                table: "Followers");

            migrationBuilder.DropColumn(
                name: "VicationId",
                table: "Followers");
        }
    }
}
