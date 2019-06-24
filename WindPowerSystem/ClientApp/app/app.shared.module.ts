import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { HttpModule } from '@angular/http';
import { HttpClientModule } from '@angular/common/http';
import { RouterModule } from '@angular/router';

import { AppComponent } from './components/app/app.component';
import { NavMenuComponent } from './components/navmenu/navmenu.component';
import { HomeComponent } from './components/home/home.component';
import { FetchDataComponent } from './components/fetchdata/fetchdata.component';
import { CounterComponent } from './components/counter/counter.component';
import { AnswerListComponent } from './components/answer/answer-list.component';
import { AnswerEditComponent } from './components/answer/answer-edit.component';
import { QuizComponent } from './components/quiz/quiz.component';
import { QuizListComponent } from './components/quiz/quiz-list.component';
import { QuizEditComponent } from './components/quiz/quiz-edit.component';
import { QuizSearchComponent } from './components/quiz/quiz-search.component';
import { QuestionListComponent } from './components/question/question-list.component';
import { QuestionEditComponent } from './components/question/question-edit.component';
import { ResultListComponent } from './components/result/result-list.component';
import { ResultEditComponent } from './components/result/result-edit.component';
import { AboutComponent } from './components/about/about.component';
import { LoginComponent } from './components/login/login.component';
import { PageNotFoundComponent } from './components/pagenotfound/pagenotfound.component';
import { CountryComponent } from './components/address/country/country.component';
import { TurbineComponent } from './components/turbine/turbine.component';
import { TurbineListComponent } from './components/turbine/turbine-list.component';
import { CountryListComponent } from './components/address/country/country-list.component';
import { ShareComponent } from './components/share/share.component';
import { ShareListComponent } from './components/share/share-list.component';
import { ShareEditComponent } from './components/share/share-edit.component';
import { ShareListForTurbineComponent } from './components/share/share-list-for-turbine.component';
import { TownComponent } from './components/address/town/town.component';
import { TownListComponent } from './components/address/town/town-list.component';
import { TurbineTypeComponent } from './components/turbinetype/turbine-type.component';
import { TurbineTypeEditComponent } from './components/turbinetype/turbine-type-edit.component';
import { TurbineEditComponent } from './components/turbine/turbine-edit.component';
import { TurbineTypeListComponent } from './components/turbinetype/turbine-type-list.component';
import { AddressListComponent } from './components/address/address/address-list.component';


@NgModule({
    declarations: [
        AppComponent,
        NavMenuComponent,
        CounterComponent,
        FetchDataComponent,
		HomeComponent,
		AnswerListComponent,
		AnswerEditComponent,
		QuizListComponent,
		QuizComponent,
		QuizEditComponent,
		QuizSearchComponent,
		QuestionListComponent,
		QuestionEditComponent,
		ResultListComponent,
		ResultEditComponent,
		AboutComponent,
		LoginComponent,
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
		TownComponent,
		TownListComponent,
		TurbineTypeComponent,
		TurbineTypeListComponent,
		TurbineTypeEditComponent,
		TurbineEditComponent
    ],
    imports: [
		CommonModule,
		HttpClientModule,
        HttpModule,
		FormsModule,
		ReactiveFormsModule,
        RouterModule.forRoot([
            { path: '', redirectTo: 'home', pathMatch: 'full' },
            { path: 'home', component: HomeComponent },
            { path: 'counter', component: CounterComponent },
			{ path: 'fetch-data', component: FetchDataComponent },
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
			{ path: '**', component: PageNotFoundComponent } // should be the last router
            //{ path: '**', redirectTo: 'home' } -- redirect to home page
        ])
    ]
})

export class AppModuleShared {
}
