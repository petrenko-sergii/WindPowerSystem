import { Component, OnInit } from '@angular/core';
import { IdleService } from '../../services/idle.service';
import { AuthService } from '../../services/auth.service';

@Component({
    selector: 'app',
    templateUrl: './app.component.html',
    styleUrls: ['./app.component.css']
})
export class AppComponent implements OnInit {
	private readonly _idleService: IdleService;
	private readonly _authService: AuthService;

	constructor(idleService: IdleService,
		public authService: AuthService
	) {
		this._idleService = idleService;
		this._authService = authService;
	}

	public async ngOnInit(): Promise<void> {
		if (this._authService.isLoggedIn()) {
			this._idleService.startIdleWatching(true);
		}
	}
}
