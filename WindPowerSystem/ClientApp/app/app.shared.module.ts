import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
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
		CountryListComponent
    ],
    imports: [
		CommonModule,
		HttpClientModule,
        HttpModule,
        FormsModule,
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
			{ path: 'turbine/:id', component: TurbineComponent },
			{ path: 'country-list', component: CountryListComponent },
			{ path: 'turbine-list', component: TurbineListComponent },
			{ path: '**', component: PageNotFoundComponent } // should be the last router
            //{ path: '**', redirectTo: 'home' } -- redirect to home page
        ])
    ]
})

export class AppModuleShared {
}
