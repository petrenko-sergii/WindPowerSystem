import { Component, Inject } from "@angular/core";
import { ActivatedRoute, Router } from "@angular/router";
import { HttpClient } from "@angular/common/http";

@Component({
	selector: "turbine-type",
	templateUrl: './turbine-type.component.html',
	styleUrls: ['./turbine-type.component.css']
})
export class TurbineTypeComponent {
	turbineType: TurbineType;

	constructor(private activatedRoute: ActivatedRoute,
		private router: Router,
		private http: HttpClient,
		@Inject('BASE_URL') private baseUrl: string) {

		this.turbineType = <TurbineType>{};

		var id = +this.activatedRoute.snapshot.params["id"];
		console.log(id);

		if (id) {
			var url = this.baseUrl + "api/turbinetype/" + id;
			this.http.get<TurbineType>(url).subscribe(result => {
				this.turbineType = result;
			}, error => console.error(error));
		}
		else {
			console.log("Invalid id: routing back to home...");
			this.router.navigate(["home"]);
		}
	}
	onEdit() {
		this.router.navigate(["turbine-type/edit", this.turbineType.Id]);
	}

	onDelete() {
		if (confirm("Do you really want to delete this turbineType?")) {
			var url = this.baseUrl + "api/turbineType/" + this.turbineType.Id;
			this.http
				.delete(url)
				.subscribe(result => {
					console.log("TurbineType " + this.turbineType.Id + " has been deleted.");
					this.router.navigate(["home"]);
				}, error => console.log(error));
		}
	}
}