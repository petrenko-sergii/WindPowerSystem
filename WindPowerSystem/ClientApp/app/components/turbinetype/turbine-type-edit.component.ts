import { Component, Inject, OnInit } from "@angular/core";
import { FormGroup, FormControl, FormBuilder, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from "@angular/router";
import { HttpClient } from "@angular/common/http";

@Component({
	selector: "turbine-type-edit",
	templateUrl: './turbine-type-edit.component.html',
	styleUrls: ['./turbine-type-edit.component.css']
})

export class TurbineTypeEditComponent {
	title: string;
	turbineType: TurbineType;
	form: FormGroup;

	editMode: boolean;

	constructor(private activatedRoute: ActivatedRoute,
		private router: Router,
		private http: HttpClient,
		private fb: FormBuilder,
		@Inject('BASE_URL') private baseUrl: string) {

		this.turbineType = <TurbineType>{};

		this.createForm();

		var id = +this.activatedRoute.snapshot.params["id"];
		if (id) {
			this.editMode = true;

			var url = this.baseUrl + "api/turbinetype/" + id;
			this.http.get<TurbineType>(url).subscribe(result => {
				this.turbineType = result;
				this.title = "Edit - " + this.turbineType.Model;

				this.updateForm();
			}, error => console.error(error));
		}
		else {
			this.editMode = false;
			this.title = "Create a new TurbineType";
		}
	}

	createForm() {
		this.form = this.fb.group({
			Model: ['', Validators.required],
			Capacity: ['',
				[
					Validators.required,
					Validators.pattern(/^\d*$/),
					Validators.min(1),
					Validators.max(999999999)
				]
			]
		});
	}

	updateForm() {
		this.form.setValue({
			Model: this.turbineType.Model,
			Capacity: this.turbineType.Capacity
		});
	}

	onSubmit() {
		var tempTurbineType = <TurbineType>{};
		tempTurbineType.Model = this.form.value.Model;
		tempTurbineType.Capacity = this.form.value.Capacity;

		var url = this.baseUrl + "api/turbinetype";

		if (this.editMode) {
			tempTurbineType.Id = this.turbineType.Id;

			this.http
				.post<TurbineType>(url, tempTurbineType)
				.subscribe(result => {
					var v = result;
					console.log("TurbineType " + v.Id + " has been updated.");
					this.router.navigate(["turbine-type-list"]);
				}, error => {
					console.log(error)
				});
		}
		else {
			this.http
				.put<TurbineType>(url, tempTurbineType)
				.subscribe(result => {
					var v = result;
					console.log("TurbineType " + v.Id + " has been created.");
					this.router.navigate(["turbine-type-list"]);
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
		debugger;
		var test = this.form.get(name);
		return test;
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