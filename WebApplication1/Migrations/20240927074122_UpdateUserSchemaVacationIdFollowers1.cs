using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace WebApplication1.Migrations
{
    public partial class UpdateUserSchemaVacationIdFollowers1 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Followers_Vications_VicationId",
                table: "Followers");

            migrationBuilder.RenameColumn(
                name: "VicationId",
                table: "Followers",
                newName: "VicationsId");

            migrationBuilder.RenameIndex(
                name: "IX_Followers_VicationId",
                table: "Followers",
                newName: "IX_Followers_VicationsId");

            migrationBuilder.AddForeignKey(
                name: "FK_Followers_Vications_VicationsId",
                table: "Followers",
                column: "VicationsId",
                principalTable: "Vications",
                principalColumn: "Id");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Followers_Vications_VicationsId",
                table: "Followers");

            migrationBuilder.RenameColumn(
                name: "VicationsId",
                table: "Followers",
                newName: "VicationId");

            migrationBuilder.RenameIndex(
                name: "IX_Followers_VicationsId",
                table: "Followers",
                newName: "IX_Followers_VicationId");

            migrationBuilder.AddForeignKey(
                name: "FK_Followers_Vications_VicationId",
                table: "Followers",
                column: "VicationId",
                principalTable: "Vications",
                principalColumn: "Id");
        }
    }
}
