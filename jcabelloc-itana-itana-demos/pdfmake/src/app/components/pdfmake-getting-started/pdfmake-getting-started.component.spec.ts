import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { PdfmakeGettingStartedComponent } from './pdfmake-getting-started.component';

describe('PdfmakeGettingStartedComponent', () => {
  let component: PdfmakeGettingStartedComponent;
  let fixture: ComponentFixture<PdfmakeGettingStartedComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ PdfmakeGettingStartedComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(PdfmakeGettingStartedComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
