import { Component, Inject } from '@angular/core';
import { Http } from '@angular/http';

@Component({
	selector: 'address-list',
	templateUrl: './address-list.component.html'
})

export class AddressListComponent {
	public countries: Country[];

	constructor(http: Http, @Inject('BASE_URL') baseUrl: string) {
		http.get(baseUrl + 'api/address/GetCountryList').subscribe(result => {
			this.countries = result.json() as Country[];
		}, error => console.error(error));
	}
}
