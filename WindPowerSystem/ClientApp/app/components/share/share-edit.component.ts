import { Component, Inject, OnInit } from "@angular/core";
import { ActivatedRoute, Router } from "@angular/router";
import { HttpClient } from "@angular/common/http";

@Component({
	selector: "share-edit",
	templateUrl: './share-edit.component.html',
	styleUrls: ['./share-edit.component.css']
})

export class ShareEditComponent {
	title: string;
	share: Share;

	editMode: boolean;

	constructor(private activatedRoute: ActivatedRoute,
		private router: Router,
		private http: HttpClient,
		@Inject('BASE_URL') private baseUrl: string) {

		this.share = <Share>{};

		var id = +this.activatedRoute.snapshot.params["id"];
		if (id) {
			this.editMode = true;

			var url = this.baseUrl + "api/share/" + id;
			this.http.get<Share>(url).subscribe(result => {
				this.share = result;
				this.title = "Edit - " + this.share.Id;
			}, error => console.error(error));
		}
		else {
			this.editMode = false;
			this.title = "Create a new Share";
		}
	}

	onSubmit(share: Share) {
		debugger;
		var url = this.baseUrl + "api/share";

		if (this.editMode) {
			this.http
				.post<Share>(url, share)
				.subscribe(result => {
					debugger;
					var v = result;
					console.log("Share " + v.Id + " has been updated.");
					this.router.navigate(["share-list"]);
				}, error => {
					debugger;
					console.log(error)
				});
		}
		else {
			debugger;
			this.http
				.put<Share>(url, share)
				.subscribe(result => {
					debugger;
					var v = result;
					console.log("Share " + v.Id + " has been created.");
					this.router.navigate(["share-list"]);
				}, error => {
					debugger;
					console.log(error)
				});
		}
	}

	onBack() {
		this.router.navigate(["home"]);
	}
}