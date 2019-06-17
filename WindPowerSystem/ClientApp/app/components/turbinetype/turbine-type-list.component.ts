import { Component, Inject } from '@angular/core';
import { Http } from '@angular/http';

@Component({
	selector: 'turbine-type-list',
	templateUrl: './turbine-type-list.component.html',
	styleUrls: ['./turbine-type-list.component.css']
})

export class TurbineTypeListComponent {
	public turbineTypes: TurbineType[];

	constructor(http: Http, @Inject('BASE_URL') baseUrl: string) {
		http.get(baseUrl + 'api/TurbineType/GetTurbineTypeList').subscribe(result => {
			this.turbineTypes = result.json() as TurbineType[];
		}, error => console.error(error));
	}

	onDelete() {
		debugger;
		if (confirm("Do you really want to delete this turbineType?")) {
			//var url = this.baseUrl + "api/turbineType/" + this.turbineType.Id;
			//this.http
			//	.delete(url)
			//	.subscribe(result => {
			//		console.log("TurbineType " + this.turbineType.Id + " has been deleted.");
			//		this.router.navigate(["home"]);
			//	}, error => console.log(error));
		}
	}
}
