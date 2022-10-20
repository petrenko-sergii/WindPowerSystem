using Microsoft.EntityFrameworkCore.Migrations;

namespace WindPowerSystem.Data.Migrations
{
    public partial class AddManufacturerId : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "ManufacturerId",
                table: "TurbineType",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.CreateIndex(
                name: "IX_TurbineType_ManufacturerId",
                table: "TurbineType",
                column: "ManufacturerId");

            migrationBuilder.AddForeignKey(
                name: "FK_TurbineType_Manufacturer_ManufacturerId",
                table: "TurbineType",
                column: "ManufacturerId",
                principalTable: "Manufacturer",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_TurbineType_Manufacturer_ManufacturerId",
                table: "TurbineType");

            migrationBuilder.DropIndex(
                name: "IX_TurbineType_ManufacturerId",
                table: "TurbineType");

            migrationBuilder.DropColumn(
                name: "ManufacturerId",
                table: "TurbineType");
        }
    }
}
