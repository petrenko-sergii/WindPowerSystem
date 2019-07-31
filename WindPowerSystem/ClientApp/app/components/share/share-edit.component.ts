import { Component, Inject, OnInit } from "@angular/core";
import { FormGroup, FormControl, FormBuilder, Validators } from '@angular/forms';
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
	form: FormGroup;
	turbines: Turbine[];

	editMode: boolean;

	constructor(private activatedRoute: ActivatedRoute,
		private router: Router,
		private http: HttpClient,
		private fb: FormBuilder,
		@Inject('BASE_URL') private baseUrl: string) {

		this.share = <Share>{};

		this.createForm();

		var id = +this.activatedRoute.snapshot.params["id"];
		if (id) {
			this.editMode = true;

			var url = this.baseUrl + "api/share/" + id;
			this.http.get<Share>(url).subscribe(result => {
				this.share = result;
				this.title = "Edit share: #" + this.share.Id + ":";
				this.turbines = this.share.Turbines;

				this.updateForm();
			}, error => console.error(error));
		}
		else {
			this.editMode = false;
			this.title = "Create a new Share";

			http.get<Share>(baseUrl + 'api/Share/GetTurbineList').subscribe(result => {
				this.turbines = result.Turbines as Turbine[];
			}, error => console.error(error));
		}
	}

	createForm() {
		this.form = this.fb.group({
			Percent: ['',
				[
					Validators.required,
					Validators.min(1),
					Validators.max(100)
				]
			],
			Price: ['',
				[
					Validators.required,
					Validators.pattern(/^\d*$/),
					Validators.min(1),
					Validators.max(999999999)
				]
			],
			TurbineId: ['',
				[
					Validators.required,
					Validators.min(1)
				]
			]
		});
	}

	updateForm() {
		this.form.setValue({
			Percent: this.share.Percent,
			Price: this.share.Price,
			TurbineId: this.share.TurbineId || 0
		});
	}

	onSubmit() {
		var tempShare = <Share>{};
		tempShare.Percent = this.form.value.Percent;
		tempShare.Price = this.form.value.Price;
		tempShare.TurbineId = this.form.value.TurbineId;

		var url = this.baseUrl + "api/share";

		if (this.editMode) {
			tempShare.Id = this.share.Id;

			this.http
				.post<Share>(url, tempShare)
				.subscribe(result => {
					var v = result;
					console.log("Share " + v.Id + " has been updated.");
					this.router.navigate(["share-list"]);
				}, error => {
					console.log(error)
				});
		}
		else {
			this.http
				.put<Share>(url, tempShare)
				.subscribe(result => {
					var v = result;
					console.log("Share " + v.Id + " has been created.");
					this.router.navigate(["share-list"]);
				}, error => {
					console.log(error)
				});
		}
	}

	onBack() {
		this.router.navigate(["home"]);
	}

	// retrieve a FormControl
	getFormControl(name: string) {
		return this.form.get(name);
	}

	// returns TRUE if the FormControl is valid
	isValid(name: string) {
		var e = this.getFormControl(name);
		return e && e.valid;
	}

	// returns TRUE if the FormControl has been changed
	isChanged(name: string) {
		var e = this.getFormControl(name);
		return e && (e.dirty || e.touched);
	}

	// returns TRUE if the FormControl is invalid after user changes
	hasError(name: string) {
		var e = this.getFormControl(name);
		return e && (e.dirty || e.touched) && !e.valid;
	}
}