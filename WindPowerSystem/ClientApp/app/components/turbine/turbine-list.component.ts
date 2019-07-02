import { Component, Inject } from '@angular/core';
import { Http } from '@angular/http';

@Component({
	selector: 'turbine-list',
	templateUrl: './turbine-list.component.html',
	styleUrls: ['./turbine-list.component.css']
})

export class TurbineListComponent {
	public turbines: Turbine[];

	constructor(http: Http, @Inject('BASE_URL') baseUrl: string) {
		http.get(baseUrl + 'api/Turbine/GetTurbineList').subscribe(result => {
			debugger;
			this.turbines = result.json() as Turbine[];
			debugger;
		}, error => console.error(error));
	}
}
