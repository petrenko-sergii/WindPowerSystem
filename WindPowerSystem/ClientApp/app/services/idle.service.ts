
import { Injectable, OnInit } from "@angular/core";
import { UserIdleService } from "angular-user-idle";
import { PageTitleService } from "./page-title.service";
import { AuthService } from "./auth.service";
import { Router } from "@angular/router";

@Injectable()
export class IdleService {
	private readonly _userIdle: UserIdleService;
	private pageTitleWasChanged = false;
	private timeToAutoLogOutMsg: string = 'until your session times out!';

	public constructor(
		private userIdle: UserIdleService,
		private pageTitleService: PageTitleService,
		private auth: AuthService,
		private router: Router
	) {
		this._userIdle = userIdle;

		this.pageTitleService.setInitialTitle();
	}

	public startIdleWatching(activate: boolean) {
		if (activate) {
			// Start watching for user inactivity.
			this._userIdle.startWatching();

			this.initListener();

			// Start watching when user idle is starting.
			this._userIdle.onTimerStart().subscribe(
				count => {

					const idleTimeout: number = this._userIdle.getConfigValue().timeout;
					const remainingTime: number = idleTimeout - count;
					const minutes: string = Math.floor(remainingTime / 60).toString();
					const secondsQty: number = remainingTime % 60;
					const seconds: string = secondsQty < 10 ? `0${secondsQty}` : `${secondsQty}`;

					this.pageTitleService.setTitleWithIdleTime(minutes, seconds);
					this.pageTitleWasChanged = true;
					console.log(`${minutes}:${seconds} ${this.timeToAutoLogOutMsg}`);
				}
			);

			// Start watch when time is up.
			this._userIdle.onTimeout().subscribe(
				async () => {
					await this.logout();
					this.startIdleWatching(false);
				}
			);
		}
		else {
			this._userIdle.stopTimer();
			this._userIdle.stopWatching();
			this.pageTitleService.setInitialTitle();
			this.auth.clearLoginPasswordFields();
		}
	}

	private initListener() {
		document.body.addEventListener("click", () => this.restart());
		document.body.addEventListener("mouseover", () => this.restart());
		document.body.addEventListener("mouseout", () => this.restart());
		document.body.addEventListener("keydown", () => this.restart());
		document.body.addEventListener("keyup", () => this.restart());
		document.body.addEventListener("keypress", () => this.restart());
	}

	private restart() {
		this._userIdle.resetTimer();

		if (this.pageTitleWasChanged) {
			this.pageTitleService.setInitialTitle();
			this.pageTitleWasChanged = false;
		}
	}

	logout(): boolean {
		// logs out the user, then redirects him to Home View.
		if (this.auth.logout()) {
			this.router.navigate(["login"]);
		}
		return false;
	}
}

