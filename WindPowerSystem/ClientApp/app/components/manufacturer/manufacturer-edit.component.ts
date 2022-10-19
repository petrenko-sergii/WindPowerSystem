import { Component, Inject, OnInit } from "@angular/core";
import { FormGroup, FormControl, FormBuilder, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from "@angular/router";
import { HttpClient } from "@angular/common/http";

@Component({
	selector: "manufacturer-edit",
	templateUrl: './manufacturer-edit.component.html',
	styleUrls: ['./manufacturer-edit.component.css']
})

export class ManufacturerEditComponent {
	title: string;
	manufacturer: Manufacturer;
	form: FormGroup;

	editMode: boolean;

	constructor(private activatedRoute: ActivatedRoute,
		private router: Router,
		private http: HttpClient,
		private fb: FormBuilder,
		@Inject('BASE_URL') private baseUrl: string) {

		this.manufacturer = <Manufacturer>{};

		this.createForm();

		var id = +this.activatedRoute.snapshot.params["id"];

		if (id) {
			this.editMode = true;

			var url = this.baseUrl + "api/manufacturer/" + id;
			this.http.get<Manufacturer>(url).subscribe(result => {
				this.manufacturer = result;
				this.title = "Edit manufacturer: " + this.manufacturer.Name;

				this.updateForm();
			}, error => console.error(error));
		}
		else {
			this.editMode = false;
			this.title = "Create a new manufacturer";
		}
	}

	createForm() {
		this.form = this.fb.group({
			Name: ['', Validators.required],
			Website: ['', Validators.required],
			Phone: ['', Validators.required],
			Email: ['', Validators.required]
		});
	}

	updateForm() {
		this.form.setValue({
			Name: this.manufacturer.Name,
			Website: this.manufacturer.Website,
			Phone: this.manufacturer.Phone,
			Email: this.manufacturer.Email
		});
	}

	onSubmit() {
		var tempManufacturer = <Manufacturer>{};
		tempManufacturer.Name = this.form.value.Name;
		tempManufacturer.Website = this.form.value.Website;
		tempManufacturer.Phone = this.form.value.Phone;
		tempManufacturer.Email = this.form.value.Email;

		var url = this.baseUrl + "api/manufacturer";

		if (this.editMode) {
			tempManufacturer.Id = this.manufacturer.Id;

			this.http
				.put<Manufacturer>(url, tempManufacturer)
				.subscribe(result => {
					var v = result;
					console.log("Manufacturer " + v.Id + " has been updated.");
					this.router.navigate(["manufacturer-list"]);
				}, error => {
					console.log(error)
				});
		}
		else {
			this.http
				.post<Manufacturer>(url, tempManufacturer)
				.subscribe(result => {
					var v = result;
					console.log("Manufacturer " + v.Id + " has been created.");
					this.router.navigate(["manufacturer-list"]);
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