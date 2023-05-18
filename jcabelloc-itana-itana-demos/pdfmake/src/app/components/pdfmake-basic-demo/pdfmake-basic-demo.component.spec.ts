import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { PdfmakeBasicDemoComponent } from './pdfmake-basic-demo.component';

describe('PdfmakeBasicDemoComponent', () => {
  let component: PdfmakeBasicDemoComponent;
  let fixture: ComponentFixture<PdfmakeBasicDemoComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ PdfmakeBasicDemoComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(PdfmakeBasicDemoComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
