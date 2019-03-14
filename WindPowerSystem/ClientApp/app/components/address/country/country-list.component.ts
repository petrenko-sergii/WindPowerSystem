import { Component, Inject } from '@angular/core';
import { Http } from '@angular/http';

@Component({
	selector: 'country-list',
	templateUrl: './country-list.component.html'
})

export class CountryListComponent {
	public countries: Country[];

	constructor(http: Http, @Inject('BASE_URL') baseUrl: string) {
		http.get(baseUrl + 'api/Country/GetCountryList').subscribe(result => {
			this.countries = result.json() as Country[];
		}, error => console.error(error));
	}
}
