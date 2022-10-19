import { Component, Inject } from "@angular/core";
import { ActivatedRoute, Router } from "@angular/router";
import { HttpClient } from "@angular/common/http";
import { AuthService } from '../../services/auth.service';

@Component({
	selector: "manufacturer",
	templateUrl: './manufacturer.component.html',
	styleUrls: ['./manufacturer.component.css']
})
export class ManufacturerComponent {
	manufacturer: Manufacturer;

	constructor(private activatedRoute: ActivatedRoute,
		private router: Router,
		private http: HttpClient,
		public auth: AuthService,
		@Inject('BASE_URL') private baseUrl: string) {

		this.manufacturer = <Manufacturer>{};

		var id = +this.activatedRoute.snapshot.params["id"];
		console.log(id);

		if (id) {
			var url = this.baseUrl + "api/manufacturer/" + id;
			this.http.get<Manufacturer>(url).subscribe(result => {
				this.manufacturer = result;
			}, error => console.error(error));
		}
		else {
			console.log("Invalid id: routing back to home...");
			this.router.navigate(["home"]);
		}
	}
	onEdit() {
		this.router.navigate(["manufacturer/edit", this.manufacturer.Id]);
	}

	onDelete() {
		if (confirm("Do you really want to delete this manufacturer?")) {
			var url = this.baseUrl + "api/manufacturer/" + this.manufacturer.Id;
			this.http
				.delete(url)
				.subscribe(result => {
					console.log("Manufacturer " + this.manufacturer.Id + " has been deleted.");
					this.router.navigate(["manufacturer-list"]);
				}, error => console.log(error));
		}
	}
}