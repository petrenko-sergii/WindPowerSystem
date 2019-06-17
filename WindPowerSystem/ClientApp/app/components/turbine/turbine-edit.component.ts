import { Component, Inject, OnInit } from "@angular/core";
import { FormGroup, FormControl, FormBuilder, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from "@angular/router";
import { HttpClient } from "@angular/common/http";

@Component({
	selector: "turbine-edit",
	templateUrl: './turbine-edit.component.html',
	styleUrls: ['./turbine-edit.component.css']
})

export class TurbineEditComponent {
	title: string;
	turbine: Turbine;
	form: FormGroup;

	editMode: boolean;

	constructor(private activatedRoute: ActivatedRoute,
		private router: Router,
		private http: HttpClient,
		private fb: FormBuilder,
		@Inject('BASE_URL') private baseUrl: string) {

		this.turbine = <Turbine>{};

		this.createForm();

		var id = +this.activatedRoute.snapshot.params["id"];
		if (id) {
			this.editMode = true;

			var url = this.baseUrl + "api/turbine/" + id;
			this.http.get<Turbine>(url).subscribe(result => {
				this.turbine = result;
				this.title = "Edit - Turbine " + this.turbine.SerialNumber;

				this.updateForm();
			}, error => console.error(error));
		}
		else {
			this.editMode = false;
			this.title = "Create a new Turbine";
		}
	}

	createForm() {
		this.form = this.fb.group({
			SerialNumber: ['', Validators.required],
			TurbineTypeId: ['',
				[Validators.required,
				Validators.min(1)]
			]
		});
	}

	updateForm() {
		this.form.setValue({
			SerialNumber: this.turbine.SerialNumber,
			TurbineTypeId: this.turbine.TurbineTypeId || 0
		});
	}

	onSubmit() {
		debugger;

		var tempTurbine = <Turbine>{};
		tempTurbine.SerialNumber = this.form.value.SerialNumber;
		tempTurbine.TurbineTypeId = this.form.value.TurbineTypeId;

		var url = this.baseUrl + "api/turbine";

		if (this.editMode) {
			tempTurbine.Id = this.turbine.Id;

			this.http
				.post<Turbine>(url, tempTurbine)
				.subscribe(result => {
					debugger;
					var v = result;
					console.log("Turbine " + v.Id + " has been updated.");
					this.router.navigate(["turbine-list"]);
				}, error => {
					debugger;
					console.log(error)
				});
		}
		else {
			debugger;
			this.http
				.put<Turbine>(url, tempTurbine)
				.subscribe(result => {
					debugger;
					var v = result;
					console.log("Turbine " + v.Id + " has been created.");
					this.router.navigate(["turbine-list"]);
				}, error => {
					debugger;
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