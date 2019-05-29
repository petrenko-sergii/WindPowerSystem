﻿import { Component, Inject } from '@angular/core';
import { Http } from '@angular/http';

@Component({
	selector: 'share-list',
	templateUrl: './share-list.component.html'
})

export class ShareListComponent {
	public shares: Share[];

	constructor(http: Http, @Inject('BASE_URL') baseUrl: string) {
		http.get(baseUrl + 'api/Share/ShowAllShares').subscribe(result => {
			this.shares = result.json() as Share[];
		}, error => console.error(error));
	}
}