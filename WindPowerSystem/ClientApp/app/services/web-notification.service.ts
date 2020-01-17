import { Injectable } from "@angular/core";
import { CookieService } from "ngx-cookie-service";

@Injectable()
export class WebNotificationService {
	private readonly _cookieService: CookieService;

  public constructor(
    cookieService: CookieService) {
	  this._cookieService = cookieService;
    }

  public async saveCookiesThatUserGotNotification()
    : Promise<void> {
    const cookieKey = "CurrentUser" + "-NotificationWasGot";
    this._cookieService.set(cookieKey, "1");
  }
}
