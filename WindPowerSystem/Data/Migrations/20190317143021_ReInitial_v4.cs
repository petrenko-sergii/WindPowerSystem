using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;

namespace WindPowerSystem.Data.Migrations
{
    public partial class ReInitial_v4 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "TurbineTypeId",
                table: "Turbine",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.CreateTable(
                name: "StockShare",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn),
                    Percent = table.Column<decimal>(nullable: false),
                    Price = table.Column<decimal>(nullable: false),
                    TurbineId = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_StockShare", x => x.Id);
                    table.ForeignKey(
                        name: "FK_StockShare_Turbine_TurbineId",
                        column: x => x.TurbineId,
                        principalTable: "Turbine",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "TurbineType",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn),
                    Model = table.Column<string>(nullable: false),
                    Capacity = table.Column<float>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_TurbineType", x => x.Id);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Turbine_TurbineTypeId",
                table: "Turbine",
                column: "TurbineTypeId");

            migrationBuilder.CreateIndex(
                name: "IX_StockShare_TurbineId",
                table: "StockShare",
                column: "TurbineId");

            migrationBuilder.AddForeignKey(
                name: "FK_Turbine_TurbineType_TurbineTypeId",
                table: "Turbine",
                column: "TurbineTypeId",
                principalTable: "TurbineType",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Turbine_TurbineType_TurbineTypeId",
                table: "Turbine");

            migrationBuilder.DropTable(
                name: "StockShare");

            migrationBuilder.DropTable(
                name: "TurbineType");

            migrationBuilder.DropIndex(
                name: "IX_Turbine_TurbineTypeId",
                table: "Turbine");

            migrationBuilder.DropColumn(
                name: "TurbineTypeId",
                table: "Turbine");
        }
    }
}
