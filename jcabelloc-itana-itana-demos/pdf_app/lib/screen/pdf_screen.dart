import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';

import 'package:pdf/widgets.dart' as pw;
import 'package:pdf_app/utils/constants.dart';
import 'package:flutter/services.dart';
import 'package:printing/printing.dart';

class PDFScreen extends StatefulWidget {
  static const String id = 'pdf_screen';
  @override
  _PDFScreenState createState() => _PDFScreenState();
}

class _PDFScreenState extends State<PDFScreen> {
  pw.Document pdf;
  PdfImage imagen;
  Uint8List archivoPdf;

  double sizeIcon1 = 45;
  double sizeIcon2 = 30;
  double sizeIcon3 = 30;

  @override
  void initState() {
    initPDF();
  }

  Future<void> initPDF() async {
    archivoPdf = await generarPdf1();
  }

  void iconoSeleccionado(int numero) {
    if (numero == 1) {
      sizeIcon1 = 45;
      sizeIcon2 = 30;
      sizeIcon3 = 30;
    } else if (numero == 2) {
      sizeIcon1 = 30;
      sizeIcon2 = 45;
      sizeIcon3 = 30;
    } else {
      sizeIcon1 = 30;
      sizeIcon2 = 30;
      sizeIcon3 = 45;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('PDF'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 400,
                width: double.maxFinite,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 25,
                  ),
                  child: PdfPreview(
                    build: (format) => archivoPdf,
                    useActions: false,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 50,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        archivoPdf = await generarPdf1();
                        setState(
                          () {
                            iconoSeleccionado(1);
                            archivoPdf = archivoPdf;
                          },
                        );
                      },
                      child: Icon(
                        Icons.picture_as_pdf,
                        size: sizeIcon1,
                        color: Colors.red,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(
                          () {
                            iconoSeleccionado(2);
                            archivoPdf = generarPdf2();
                          },
                        );
                      },
                      child: Icon(
                        Icons.picture_as_pdf,
                        size: sizeIcon2,
                        color: Colors.green,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(
                          () {
                            iconoSeleccionado(3);
                            archivoPdf = generarPdf3();
                          },
                        );
                      },
                      child: Icon(
                        Icons.picture_as_pdf,
                        size: sizeIcon3,
                        color: Colors.blue,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () async {
                  await Printing.sharePdf(
                      bytes: archivoPdf, filename: 'Documento.pdf');
                },
                child: Icon(
                  Icons.share,
                  color: Colors.grey,
                  size: 40,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<Uint8List> generarPdf1() async {
    pdf = pw.Document();

    imagen = PdfImage.file(
      pdf.document,
      bytes: (await rootBundle.load(kGoogleImagePath)).buffer.asUint8List(),
    );

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a5,
        margin: pw.EdgeInsets.zero,
        build: (context) => [
          pw.Padding(
            padding: pw.EdgeInsets.symmetric(vertical: 20),
            child: pw.Center(
              child: pw.Text(
                'Prueba Número 1',
                style: pw.TextStyle(
                  fontSize: 30,
                  color: PdfColors.blue,
                ),
                textAlign: pw.TextAlign.center,
              ),
            ),
          ),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
            children: [
              pw.Image(
                imagen,
                height: 70,
                width: 70,
              ),
              pw.Image(
                imagen,
                height: 70,
                width: 70,
              ),
              pw.Image(
                imagen,
                height: 70,
                width: 70,
              ),
            ],
          ),
          pw.SizedBox(
            height: 20,
          ),
          pw.Padding(
            padding: pw.EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 20,
            ),
            child: pw.Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
              style: pw.TextStyle(
                fontSize: 20,
              ),
              textAlign: pw.TextAlign.justify,
            ),
          ),
          pw.SizedBox(
            height: 70,
          ),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
            children: [
              pw.Image(
                imagen,
                height: 70,
                width: 70,
              ),
              pw.Image(
                imagen,
                height: 70,
                width: 70,
              ),
              pw.Image(
                imagen,
                height: 70,
                width: 70,
              ),
            ],
          ),
        ],
      ),
    );
    return pdf.save();
  }

  Uint8List generarPdf2() {
    pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a5,
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Column(
              children: [
                pw.Text(
                  'Prueba Número 2',
                  style: pw.TextStyle(
                    fontSize: 35,
                    color: PdfColors.blue,
                  ),
                ),
                pw.SizedBox(height: 20),
                pw.Text(
                  'Prueba Número 2',
                  style: pw.TextStyle(
                    fontSize: 35,
                    color: PdfColors.blue,
                  ),
                ),
                pw.SizedBox(height: 20),
                pw.Text(
                  'Prueba Número 2',
                  style: pw.TextStyle(
                    fontSize: 35,
                    color: PdfColors.blue,
                  ),
                ),
                pw.SizedBox(height: 20),
                pw.Text(
                  'Prueba Número 2',
                  style: pw.TextStyle(
                    fontSize: 35,
                    color: PdfColors.blue,
                  ),
                ),
                pw.SizedBox(height: 20),
                pw.Text(
                  'Prueba Número 2',
                  style: pw.TextStyle(
                    fontSize: 35,
                    color: PdfColors.red,
                  ),
                ),
                pw.SizedBox(height: 20),
                pw.Text(
                  'Prueba Número 2',
                  style: pw.TextStyle(
                    fontSize: 35,
                    color: PdfColors.blue,
                  ),
                ),
                pw.SizedBox(height: 20),
                pw.Text(
                  'Prueba Número 2',
                  style: pw.TextStyle(
                    fontSize: 35,
                    color: PdfColors.blue,
                  ),
                ),
                pw.SizedBox(height: 20),
                pw.Text(
                  'Prueba Número 2',
                  style: pw.TextStyle(
                    fontSize: 35,
                    color: PdfColors.blue,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
    return pdf.save();
  }

  Uint8List generarPdf3() {
    pdf = pw.Document();

    pdf.addPage(
      pw.MultiPage(
        header: _buildHeader,
        footer: _buildFooter,
        pageFormat: PdfPageFormat.a4,
        build: (context) => [
          pw.Padding(
            padding: pw.EdgeInsets.symmetric(vertical: 40),
            child: pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
              children: [
                pw.Container(
                  height: 100,
                  width: 100,
                  color: PdfColors.black,
                ),
                pw.SizedBox(
                  height: 50,
                ),
                pw.Container(
                  height: 100,
                  width: 100,
                  color: PdfColors.grey,
                ),
                pw.SizedBox(
                  height: 50,
                ),
                pw.Container(
                  height: 100,
                  width: 100,
                  color: PdfColors.black,
                ),
              ],
            ),
          ),
          pw.Padding(
            padding: pw.EdgeInsets.symmetric(vertical: 40),
            child: pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
              children: [
                pw.Container(
                  height: 100,
                  width: 100,
                  color: PdfColors.black,
                ),
                pw.SizedBox(
                  height: 50,
                ),
                pw.Container(
                  height: 100,
                  width: 100,
                  color: PdfColors.grey,
                ),
                pw.SizedBox(
                  height: 50,
                ),
                pw.Container(
                  height: 100,
                  width: 100,
                  color: PdfColors.black,
                ),
              ],
            ),
          ),
          pw.Padding(
            padding: pw.EdgeInsets.symmetric(vertical: 40),
            child: pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
              children: [
                pw.Container(
                  height: 100,
                  width: 100,
                  color: PdfColors.black,
                ),
                pw.SizedBox(
                  height: 50,
                ),
                pw.Container(
                  height: 100,
                  width: 100,
                  color: PdfColors.grey,
                ),
                pw.SizedBox(
                  height: 50,
                ),
                pw.Container(
                  height: 100,
                  width: 100,
                  color: PdfColors.black,
                ),
              ],
            ),
          ),
          pw.Padding(
            padding: pw.EdgeInsets.symmetric(vertical: 40),
            child: pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
              children: [
                pw.Container(
                  height: 100,
                  width: 100,
                  color: PdfColors.black,
                ),
                pw.SizedBox(
                  height: 50,
                ),
                pw.Container(
                  height: 100,
                  width: 100,
                  color: PdfColors.grey,
                ),
                pw.SizedBox(
                  height: 50,
                ),
                pw.Container(
                  height: 100,
                  width: 100,
                  color: PdfColors.black,
                ),
              ],
            ),
          ),
          pw.Padding(
            padding: pw.EdgeInsets.symmetric(vertical: 40),
            child: pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
              children: [
                pw.Container(
                  height: 100,
                  width: 100,
                  color: PdfColors.black,
                ),
                pw.SizedBox(
                  height: 50,
                ),
                pw.Container(
                  height: 100,
                  width: 100,
                  color: PdfColors.grey,
                ),
                pw.SizedBox(
                  height: 50,
                ),
                pw.Container(
                  height: 100,
                  width: 100,
                  color: PdfColors.black,
                ),
              ],
            ),
          ),
          pw.Padding(
            padding: pw.EdgeInsets.symmetric(vertical: 40),
            child: pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
              children: [
                pw.Container(
                  height: 100,
                  width: 100,
                  color: PdfColors.black,
                ),
                pw.SizedBox(
                  height: 50,
                ),
                pw.Container(
                  height: 100,
                  width: 100,
                  color: PdfColors.grey,
                ),
                pw.SizedBox(
                  height: 50,
                ),
                pw.Container(
                  height: 100,
                  width: 100,
                  color: PdfColors.black,
                ),
              ],
            ),
          ),
          pw.Padding(
            padding: pw.EdgeInsets.symmetric(vertical: 40),
            child: pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
              children: [
                pw.Container(
                  height: 100,
                  width: 100,
                  color: PdfColors.black,
                ),
                pw.SizedBox(
                  height: 50,
                ),
                pw.Container(
                  height: 100,
                  width: 100,
                  color: PdfColors.grey,
                ),
                pw.SizedBox(
                  height: 50,
                ),
                pw.Container(
                  height: 100,
                  width: 100,
                  color: PdfColors.black,
                ),
              ],
            ),
          ),
        ],
      ),
    );
    return pdf.save();
  }

  pw.Widget _buildHeader(pw.Context context) {
    return pw.Padding(
      padding: pw.EdgeInsets.symmetric(
        vertical: 5,
      ),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(
            'Prueba Número 3',
            style: pw.TextStyle(
              fontSize: 35,
              color: PdfColors.blue,
            ),
          ),
          pw.SizedBox(
            height: 4,
          ),
          pw.Container(
            height: 1,
            color: PdfColors.green,
          ),
          pw.SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  pw.Widget _buildFooter(pw.Context context) {
    return pw.Padding(
      padding: pw.EdgeInsets.symmetric(
        vertical: 5,
      ),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.end,
        children: [
          pw.Text(
            'Page ${context.pageNumber} of ${context.pagesCount}',
            style: pw.TextStyle(
              fontSize: 20,
              color: PdfColors.grey,
            ),
            textAlign: pw.TextAlign.right,
          ),
          pw.SizedBox(
            height: 4,
          ),
          pw.Container(
            height: 1,
            color: PdfColors.green,
          ),
        ],
      ),
    );
  }
}
