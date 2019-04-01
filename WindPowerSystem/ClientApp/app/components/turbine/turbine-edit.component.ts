import { Component, Inject, OnInit } from "@angular/core";
import { ActivatedRoute, Router } from "@angular/router";
import { HttpClient } from "@angular/common/http";

@Component({
	selector: "turbine-edit",
	templateUrl: './turbine-edit.component.html',
	styleUrls: ['./turbine-edit.component.css']
})

export class TurbineEditComponent {
	title: string;
	turbine: Turbine;

	editMode: boolean;

	constructor(private activatedRoute: ActivatedRoute,
		private router: Router,
		private http: HttpClient,
		@Inject('BASE_URL') private baseUrl: string) {

		this.turbine = <Turbine>{};

		var id = +this.activatedRoute.snapshot.params["id"];
		if (id) {
			this.editMode = true;

			var url = this.baseUrl + "api/turbine/" + id;
			this.http.get<Turbine>(url).subscribe(result => {
				this.turbine = result;
				this.title = "Edit - " + this.turbine.SerialNumber;
			}, error => console.error(error));
		}
		else {
			this.editMode = false;
			this.title = "Create a new Turbine";
		}
	}

	onSubmit(turbine: Turbine) {
		debugger;
		var url = this.baseUrl + "api/turbine";

		if (this.editMode) {
			this.http
				.post<Turbine>(url, turbine)
				.subscribe(result => {
					debugger;
					var v = result;
					console.log("Turbine " + v.Id + " has been updated.");
					this.router.navigate(["turbine-list"]);
				}, error => {
					debugger;
					console.log(error)
				});
		}
		else {
			debugger;
			this.http
				.put<Turbine>(url, turbine)
				.subscribe(result => {
					debugger;
					var v = result;
					console.log("Turbine " + v.Id + " has been created.");
					this.router.navigate(["turbine-list"]);
				}, error => {
					debugger;
					console.log(error)
				});
		}
	}

	onBack() {
		this.router.navigate(["home"]);
	}
}