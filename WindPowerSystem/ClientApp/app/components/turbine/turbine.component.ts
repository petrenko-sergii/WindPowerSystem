import { Component, Inject } from "@angular/core";
import { ActivatedRoute, Router } from "@angular/router";
import { HttpClient } from "@angular/common/http";

@Component({
	selector: "turbine",
	templateUrl: './turbine.component.html',
	styleUrls: ['./turbine.component.css']
})
export class TurbineComponent {
	turbine: Turbine;

	constructor(private activatedRoute: ActivatedRoute,
		private router: Router,
		private http: HttpClient,
		@Inject('BASE_URL') private baseUrl: string) {

		// create an empty object from the Turbine interface
		this.turbine = <Turbine>{};

		var id = +this.activatedRoute.snapshot.params["id"];
		console.log(id);

		if (id) {
			var url = this.baseUrl + "api/turbine/" + id;
			this.http.get<Turbine>(url).subscribe(result => {
				this.turbine = result;
			}, error => console.error(error));
		}
		else {
			console.log("Invalid id: routing back to home...");
			this.router.navigate(["home"]);
		}
	}
}