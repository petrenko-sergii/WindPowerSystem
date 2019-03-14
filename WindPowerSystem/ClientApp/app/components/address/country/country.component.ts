import { Component, Inject } from "@angular/core";
import { ActivatedRoute, Router } from "@angular/router";
import { HttpClient } from "@angular/common/http";

@Component({
	selector: "country",
	templateUrl: './country.component.html',
	styleUrls: ['./country.component.css']
})

export class CountryComponent {
	country: Country;

	constructor(private activatedRoute: ActivatedRoute,
		private router: Router,
		private http: HttpClient,
		@Inject('BASE_URL') private baseUrl: string) {

		// create an empty object from the Country interface
		this.country = <Country>{};

		var id = +this.activatedRoute.snapshot.params["id"];
		console.log(id);

		if (id) {
			var url = this.baseUrl + "api/country/" + id;
			this.http.get<Country>(url).subscribe(result => {
				this.country = result;
			}, error => console.error(error));
		}
		else {
			console.log("Invalid id: routing back to home...");
			this.router.navigate(["home"]);
		}
	}
}