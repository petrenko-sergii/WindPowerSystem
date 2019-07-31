import { Component, Inject } from "@angular/core";
import { ActivatedRoute, Router } from "@angular/router";
import { HttpClient } from "@angular/common/http";
import { AuthService } from '../../services/auth.service';

@Component({
	selector: "share",
	templateUrl: './share.component.html',
	styleUrls: ['./share.component.css']
})
export class ShareComponent {
	share: Share;

	constructor(private activatedRoute: ActivatedRoute,
		private router: Router,
		private http: HttpClient,
		public auth: AuthService,
		@Inject('BASE_URL') private baseUrl: string) {

		// create an empty object from the Share interface
		this.share = <Share>{};

		var id = +this.activatedRoute.snapshot.params["id"];
		console.log(id);

		if (id) {
			var url = this.baseUrl + "api/share/" + id;
			this.http.get<Share>(url).subscribe(result => {
				this.share = result;
			}, error => console.error(error));
		}
		else {
			console.log("Invalid id: routing back to home...");
			this.router.navigate(["home"]);
		}
	}

	onEdit() {
		this.router.navigate(["share/edit", this.share.Id]);
	}

	onDelete() {
		if (confirm("Do you really want to delete this share?")) {
			var url = this.baseUrl + "api/share/" + this.share.Id;
			this.http
				.delete(url)
				.subscribe(result => {
					console.log("Share " + this.share.Id + " has been deleted.");
					this.router.navigate(["share-list"]);
				}, error => console.log(error));
		}
	}
}