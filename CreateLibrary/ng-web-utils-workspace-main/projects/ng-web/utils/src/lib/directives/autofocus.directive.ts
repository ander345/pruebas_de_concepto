
import { Directive, ElementRef } from '@angular/core';

@Directive({
  selector: '[ngAutofocus]'
})
export class AutofocusDirective {
  constructor(private host: ElementRef) {}

  ngAfterViewInit() {
    this.host.nativeElement.focus();
  }
}

