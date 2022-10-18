import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { HttpModule } from '@angular/http';
import { HttpClientModule, HTTP_INTERCEPTORS} from '@angular/common/http';
import { RouterModule } from '@angular/router';
import { CookieService } from "ngx-cookie-service";
import { UserIdleModule } from "angular-user-idle";

import { AuthService } from './services/auth.service';
import { AuthInterceptor } from './services/auth.interceptor';
import { AuthResponseInterceptor } from './services/auth.response.interceptor';
import { WebNotificationService } from './services/web-notification.service';

import { AppComponent } from './components/app/app.component';
import { NavMenuComponent } from './components/navmenu/navmenu.component';
import { HomeComponent } from './components/home/home.component';
import { AnswerListComponent } from './components/answer/answer-list.component';
import { AnswerEditComponent } from './components/answer/answer-edit.component';
import { QuizComponent } from './components/quiz/quiz.component';
import { QuizListComponent } from './components/quiz/quiz-list.component';
import { QuizEditComponent } from './components/quiz/quiz-edit.component';
import { QuestionListComponent } from './components/question/question-list.component';
import { QuestionEditComponent } from './components/question/question-edit.component';
import { ResultListComponent } from './components/result/result-list.component';
import { ResultEditComponent } from './components/result/result-edit.component';
import { AboutComponent } from './components/about/about.component';
import { LoginComponent } from './components/login/login.component';
import { LoginExternalProvidersComponent } from './components/login/login.externalproviders.component';
import { RegisterComponent } from './components/user/register.component';
import { PageNotFoundComponent } from './components/pagenotfound/pagenotfound.component';

import { CountryComponent } from './components/address/country/country.component';
import { TurbineComponent } from './components/turbine/turbine.component';
import { TurbineListComponent } from './components/turbine/turbine-list.component';
import { CountryListComponent } from './components/address/country/country-list.component';
import { ShareComponent } from './components/share/share.component';
import { ShareListComponent } from './components/share/share-list.component';
import { ManufacturerListComponent } from './components/manufacturer/manufacturer-list.component';
import { ShareEditComponent } from './components/share/share-edit.component';
import { ShareListForTurbineComponent } from './components/share/share-list-for-turbine.component';
import { TownComponent } from './components/address/town/town.component';
import { TownListComponent } from './components/address/town/town-list.component';
import { TurbineTypeComponent } from './components/turbinetype/turbine-type.component';
import { TurbineTypeEditComponent } from './components/turbinetype/turbine-type-edit.component';
import { TurbineEditComponent } from './components/turbine/turbine-edit.component';
import { TurbineTypeListComponent } from './components/turbinetype/turbine-type-list.component';
import { AddressListComponent } from './components/address/address/address-list.component';
import { CookieUsingNotificationComponent } from './components/cookieUsingNotification/cookie-using-notification.component';
import { IdleService } from './services/idle.service';
import { PageTitleService } from './services/page-title.service';
import { Title } from '@angular/platform-browser';


@NgModule({
    declarations: [
        AppComponent,
        NavMenuComponent,
		HomeComponent,
		AnswerListComponent,
		AnswerEditComponent,
		QuizListComponent,
		QuizComponent,
		QuizEditComponent,
		QuestionListComponent,
		QuestionEditComponent,
		ResultListComponent,
		ResultEditComponent,
		AboutComponent,
		LoginComponent,
		LoginExternalProvidersComponent,
		RegisterComponent,
		PageNotFoundComponent,
		CountryComponent,
		TurbineComponent,
		TurbineListComponent,
		AddressListComponent,
		CountryListComponent,
		ShareComponent,
		ShareEditComponent,
		ShareListComponent,
		ShareListForTurbineComponent,
		ManufacturerListComponent,
		TownComponent,
		TownListComponent,
		TurbineTypeComponent,
		TurbineTypeListComponent,
		TurbineTypeEditComponent,
		TurbineEditComponent,
		CookieUsingNotificationComponent
    ],
    imports: [
		CommonModule,
		HttpClientModule,
		HttpModule,
		FormsModule,
		ReactiveFormsModule,
		UserIdleModule.forRoot({ idle: 3600, timeout: 3600, ping: 3600 }),
        RouterModule.forRoot([
            { path: '', redirectTo: 'home', pathMatch: 'full' },
            { path: 'home', component: HomeComponent },
			{ path: 'answer/create/:id', component: AnswerEditComponent },
			{ path: 'answer/edit/:id', component: AnswerEditComponent },
			{ path: 'quiz/create', component: QuizEditComponent }, // quiz/create should be upper then quiz/:id
			{ path: 'quiz/edit/:id', component: QuizEditComponent },
			{ path: 'quiz/:id', component: QuizComponent },
			{ path: 'question/create/:id', component: QuestionEditComponent },  // we need id to know QuizId (parentId)
			{ path: 'question/edit/:id', component: QuestionEditComponent },
			{ path: 'result/create/:id', component: ResultEditComponent },
			{ path: 'result/edit/:id', component: ResultEditComponent },
			{ path: 'about', component: AboutComponent },
			{ path: 'login', component: LoginComponent },
			{ path: 'register', component: RegisterComponent },
			{ path: 'country/:id', component: CountryComponent },
			{ path: 'turbine/create', component: TurbineEditComponent },   // we need to insert before     "path: 'turbine/:id'"
			{ path: 'turbine/edit/:id', component: TurbineEditComponent }, // we need to insert before     "path: 'turbine/:id'"
			{ path: 'turbine/:id', component: TurbineComponent },
			{ path: 'turbine-type/create', component: TurbineTypeEditComponent },
			{ path: 'turbine-type/edit/:id', component: TurbineTypeEditComponent },
			{ path: 'turbine-type/:id', component: TurbineTypeComponent },
			{ path: 'address-list', component: AddressListComponent },
			{ path: 'country-list', component: CountryListComponent },
			{ path: 'town/:id', component: TownComponent },
			{ path: 'town-list', component: TownListComponent },
			{ path: 'turbine-list', component: TurbineListComponent },
			{ path: 'share/create', component: ShareEditComponent },
			{ path: 'share/edit/:id', component: ShareEditComponent },
			{ path: 'share/:id', component: ShareComponent },
			{ path: 'share-list', component: ShareListComponent },
			{ path: 'share-list-for-turbine/:id', component: ShareListForTurbineComponent },
			{ path: 'turbine-type-list', component: TurbineTypeListComponent },
			{ path: 'manufacturer-list', component: ManufacturerListComponent },
			{ path: '**', component: PageNotFoundComponent } // should be the last router
            //{ path: '**', redirectTo: 'home' } -- redirect to home page
        ])
	],
	providers: [
		AuthService,
		CookieService,
		{
			provide: HTTP_INTERCEPTORS,
			useClass: AuthInterceptor,
			multi: true
		},
		{
			provide: HTTP_INTERCEPTORS,
			useClass: AuthResponseInterceptor,
			multi: true
		},
		WebNotificationService,
		IdleService,
		Title,
		PageTitleService
	]
})

export class AppModuleShared {
}
