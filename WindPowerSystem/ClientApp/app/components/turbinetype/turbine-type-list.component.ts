import { Component, Inject } from '@angular/core';
import { Http } from '@angular/http';

@Component({
	selector: 'turbine-type-list',
	templateUrl: './turbine-type-list.component.html'
})

export class TurbineTypeListComponent {
	public turbineTypes: TurbineType[];

	constructor(http: Http, @Inject('BASE_URL') baseUrl: string) {
		http.get(baseUrl + 'api/TurbineType/GetTurbineTypeList').subscribe(result => {
			this.turbineTypes = result.json() as TurbineType[];
		}, error => console.error(error));
	}
}
