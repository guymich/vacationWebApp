using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace WebApplication1.Migrations
{
    public partial class UpdateUserSchemaFollowVication : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Followers_AspNetUsers_VicationId",
                table: "Followers");

            migrationBuilder.AlterColumn<int>(
                name: "VicationId",
                table: "Followers",
                type: "int",
                nullable: true,
                oldClrType: typeof(string),
                oldType: "varchar(255)",
                oldNullable: true)
                .OldAnnotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.AddForeignKey(
                name: "FK_Followers_Vications_VicationId",
                table: "Followers",
                column: "VicationId",
                principalTable: "Vications",
                principalColumn: "Id");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Followers_Vications_VicationId",
                table: "Followers");

            migrationBuilder.AlterColumn<string>(
                name: "VicationId",
                table: "Followers",
                type: "varchar(255)",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true)
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.AddForeignKey(
                name: "FK_Followers_AspNetUsers_VicationId",
                table: "Followers",
                column: "VicationId",
                principalTable: "AspNetUsers",
                principalColumn: "Id");
        }
    }
}
