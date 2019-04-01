import { Component, Inject } from '@angular/core';
import { Http } from '@angular/http';

@Component({
	selector: 'town-list',
	templateUrl: './town-list.component.html'
})

export class TownListComponent {
	public towns: Town[];

	constructor(http: Http, @Inject('BASE_URL') baseUrl: string) {
		http.get(baseUrl + 'api/Town/GetTownList').subscribe(result => {
			this.towns = result.json() as Town[];
		}, error => {
			console.error(error)
		});
	}
}
