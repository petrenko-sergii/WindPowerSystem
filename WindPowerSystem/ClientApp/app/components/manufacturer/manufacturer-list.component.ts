import { Component, Inject } from '@angular/core';
import { Http } from '@angular/http';
import { Router } from "@angular/router";
import { AuthService } from '../../services/auth.service';

@Component({
	selector: 'manufacturer-list',
	templateUrl: './manufacturer-list.component.html',
	styleUrls: ['./manufacturer-list.component.css']
})

export class ManufacturerListComponent {
	public manufacturers: Manufacturer[];

	constructor(private http: Http,
		private router: Router,
		public auth: AuthService,
		@Inject('BASE_URL')  baseUrl: string) {
		http.get(baseUrl + 'api/Manufacturer').subscribe(result => {
			this.manufacturers = result.json() as Manufacturer[];
		}, error => console.error(error));
	}
}
