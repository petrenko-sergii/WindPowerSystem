import { Component, Inject, OnInit } from '@angular/core';
import { Http } from '@angular/http';
import { CookieService } from 'ngx-cookie-service';
import { WebNotificationService } from '../../services/web-notification.service';

@Component({
	selector: 'cookie-using-notification',
	templateUrl: './cookie-using-notification.component.html',
	styleUrls: ['./cookie-using-notification.component.css']
})

export class CookieUsingNotificationComponent implements OnInit{
	showNotification: boolean;
	notificationText: string;
	notificationTextForLink: string;
	notificationButtonText: string;
	cookieWikiLink: string;

	constructor(
		private webNotificationService: WebNotificationService,
		private cookieService: CookieService
	) { }

	public async ngOnInit() {
		this.showNotification = this.checkShouldNotificationBeDisplayed();

	    this.notificationText = `This website uses cookies. The third part cookies used on this website are used to gather information 
                                 about how people navigate the site. If you continue to use our website, you accept the use of cookies. 
                                 Find out more about cookies`;
		this.notificationTextForLink = "here";
		this.notificationButtonText = "I agree";
		this.cookieWikiLink = "https://en.wikipedia.org/wiki/HTTP_cookie";
	}

	private async onHideNotification() {
		this.showNotification = false;
		await this.webNotificationService.saveCookiesThatUserGotNotification();
	}

	private checkShouldNotificationBeDisplayed(): boolean {
		return !(this.cookieService.get("CurrentUser" + "-NotificationWasGot") === "1");
	}
}
