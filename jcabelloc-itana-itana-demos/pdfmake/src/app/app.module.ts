import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppComponent } from './app.component';
import { PdfmakeBasicDemoComponent } from './components/pdfmake-basic-demo/pdfmake-basic-demo.component';
import { PdfmakeGettingStartedComponent } from './components/pdfmake-getting-started/pdfmake-getting-started.component';

@NgModule({
  declarations: [
    AppComponent,
    PdfmakeBasicDemoComponent,
    PdfmakeGettingStartedComponent
  ],
  imports: [
    BrowserModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
