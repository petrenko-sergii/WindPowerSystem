import { Injectable } from "@angular/core";
import { Title } from "@angular/platform-browser";


@Injectable()
export class PageTitleService {
	private appTitle: string = 'Wind Power System';
	private initialPageTitle: string = this.appTitle;
	private timeToAutoLogOutMsg: string = 'until your session times out!';

	public constructor(
		private titleService: Title
	) {
		this.titleService.setTitle(this.initialPageTitle);
	}

	public setTitleWithIdleTime(minutes: string, seconds: string) {
		if (minutes === "0" && seconds === "00") {
			this.titleService.setTitle(this.initialPageTitle);
		}
		else {
			this.titleService.setTitle(`${minutes}:${seconds} ${this.timeToAutoLogOutMsg}`);
		}
	}

	public setTitle(title: string) {
		this.titleService.setTitle(title);
	}

	public setInitialTitle() {
		this.initialPageTitle = this.appTitle;

		this.titleService.setTitle(this.initialPageTitle);
	}
}