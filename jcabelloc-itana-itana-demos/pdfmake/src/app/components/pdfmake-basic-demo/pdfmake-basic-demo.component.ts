import { Component, OnInit } from '@angular/core';
import pdfMake from 'pdfmake/build/pdfmake';
import pdfFonts from 'pdfmake/build/vfs_fonts';
pdfMake.vfs = pdfFonts.pdfMake.vfs;


@Component({
  selector: 'app-pdfmake-basic-demo',
  templateUrl: './pdfmake-basic-demo.component.html',
  styleUrls: ['./pdfmake-basic-demo.component.css']
})
export class PdfmakeBasicDemoComponent implements OnInit {

  constructor() { }

  ngOnInit(): void {
  }

  downloadPdf(){
    const documentDefinition = { content: 'This is an sample PDF printed with pdfMake' };
    pdfMake.createPdf(documentDefinition).download();
  }
  
  openPdf(){
    const documentDefinition = { content: 'This is an sample PDF printed with pdfMake' };
    pdfMake.createPdf(documentDefinition).open();
  }

  openSameWindowPdf(){
    const documentDefinition = { content: 'This is an sample PDF printed with pdfMake' };
    pdfMake.createPdf(documentDefinition).open({}, window);
  }

  printPdf(){
    const documentDefinition = { content: 'This is an sample PDF printed with pdfMake' };
    pdfMake.createPdf(documentDefinition).print();
  }
    

}
