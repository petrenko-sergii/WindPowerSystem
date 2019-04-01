import { Component, Inject, OnInit } from "@angular/core";
import { ActivatedRoute, Router } from "@angular/router";
import { HttpClient } from "@angular/common/http";

@Component({
	selector: "turbine-type-edit",
	templateUrl: './turbine-type-edit.component.html',
	styleUrls: ['./turbine-type-edit.component.css']
})

export class TurbineTypeEditComponent {
	title: string;
	turbineType: TurbineType;

	editMode: boolean;

	constructor(private activatedRoute: ActivatedRoute,
		private router: Router,
		private http: HttpClient,
		@Inject('BASE_URL') private baseUrl: string) {

		this.turbineType = <TurbineType>{};

		var id = +this.activatedRoute.snapshot.params["id"];
		if (id) {
			this.editMode = true;

			var url = this.baseUrl + "api/turbinetype/" + id;
			this.http.get<TurbineType>(url).subscribe(result => {
				this.turbineType = result;
				this.title = "Edit - " + this.turbineType.Model;
			}, error => console.error(error));
		}
		else {
			this.editMode = false;
			this.title = "Create a new TurbineType";
		}
	}

	onSubmit(turbineType: TurbineType) {
		var url = this.baseUrl + "api/turbinetype";

		if (this.editMode) {
			this.http
				.post<TurbineType>(url, turbineType)
				.subscribe(result => {
					var v = result;
					console.log("TurbineType " + v.Id + " has been updated.");
					this.router.navigate(["turbine-type-list"]);
				}, error => {
					console.log(error)
				});
		}
		else {
			this.http
				.put<TurbineType>(url, turbineType)
				.subscribe(result => {
					var v = result;
					console.log("TurbineType " + v.Id + " has been created.");
					this.router.navigate(["turbine-type-list"]);
				}, error => {
					console.log(error)
				});
		}
	}

	onBack() {
		this.router.navigate(["home"]);
	}
}