import { Component, Inject } from "@angular/core";
import { ActivatedRoute, Router } from "@angular/router";
import { HttpClient } from "@angular/common/http";
import { forEach } from "@angular/router/src/utils/collection";

@Component({
	selector: 'share-list',
	templateUrl: './share-list-for-turbine.component.html',
	styleUrls: ['./share-list-for-turbine.component.css']
})

export class ShareListForTurbineComponent {
	public shares: Share[];
	public turbineId: number;
	public totalPercentAndPrice: number[];

	constructor(private activatedRoute: ActivatedRoute,
		private router: Router,
		private http: HttpClient,
		@Inject('BASE_URL') private baseUrl: string) {

		var id = +this.activatedRoute.snapshot.params["id"];
		this.shares = [];
		this.totalPercentAndPrice = [];

		if (id) {
			var url = this.baseUrl + "api/Share/ShowSharesForTurbine/" + id;
			this.http.get<Share[]>(url).subscribe(result => {
				this.shares = result;
				this.turbineId = id;
				this.totalPercentAndPrice = this.calculateTotalPercentAndPrice(this.shares);

			}, error => console.error(error));
		}
		else {
			console.log("Invalid id: routing back to home...");
			this.router.navigate(["home"]);
		}
	}

	calculateTotalPercentAndPrice(shares: Share[]) {
		let totalPercentAndPrice: number[] = [0,0];

		for (let i = 0; i < shares.length; i++) {
			totalPercentAndPrice[0] += shares[i].Percent;
			totalPercentAndPrice[1] += shares[i].Price;
		}

		return totalPercentAndPrice;
	}

	hasPercentError() {
		let totalPercent = this.totalPercentAndPrice[0];

		if (typeof totalPercent !== "undefined" && totalPercent !== null && (totalPercent > 100 || totalPercent < 0))
			return true;
		else
			return false;
	}

	formatNumberBySpaces(num: string) {
		return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, " ");
	}
}
