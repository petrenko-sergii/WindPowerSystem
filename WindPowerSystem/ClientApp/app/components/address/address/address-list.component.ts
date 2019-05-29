import { Component, Inject, Input, OnChanges, SimpleChanges } from "@angular/core";
import { Router } from "@angular/router";
import { HttpClient } from "@angular/common/http";

@Component({
	selector: 'address-list',
	templateUrl: './address-list.component.html'
})

export class AddressListComponent implements OnChanges {
	public countries: Country[];
	public towns: Town[];
	public streets: Street[];
	
	selectedCountry = 0;
	selectedTown = 0;
	selectedStreet = 0;

	constructor(private http: HttpClient,
		@Inject('BASE_URL') private baseUrl: string,
		private router: Router) {
		http.get(baseUrl + 'api/address/GetCountryList').subscribe(result => {
			this.countries = result as Country[];
		}, error => console.error(error));
	}

	onSelectCountry(countryId: number) {
		debugger;
		this.selectedTown = 0;
		var url = this.baseUrl + "api/address/GetTownsForCountry/" + countryId;
		this.http.get<Town[]>(url).subscribe(result => {
			debugger;
			this.towns = result;
		}, error => console.error(error));
	}

	onSelectTown(townId: number) {
		debugger;
		this.selectedStreet = 0;
		var url = this.baseUrl + "api/street/GetStreetsForTown/" + townId;
		this.http.get<Street[]>(url).subscribe(result => {
			debugger;
			this.streets = result;
		}, error => console.error(error));
	}

	ngOnChanges(changes: SimpleChanges) {
		
	}
}
