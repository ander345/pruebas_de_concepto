import 'package:app_open_pdf/models/Archivo.dart';
import 'package:app_open_pdf/shared/app_constants.dart';
import 'package:app_open_pdf/shared/utils.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Archivo> archivos = [
    Archivo(id: 1, fileName: "Informe 01", mimeType: "application/pdf", datos: AppConstants.pdfBase64),
    Archivo(id: 2, fileName: "Informe 02", mimeType: "application/pdf", datos: AppConstants.pdfBase64),
    Archivo(id: 3, fileName: "Informe 03", mimeType: "application/pdf", datos: AppConstants.pdfBase64),
    Archivo(id: 4, fileName: "Informe 04", mimeType: "application/pdf", datos: AppConstants.pdfBase64),
    Archivo(id: 5, fileName: "Informe 05", mimeType: "application/pdf", datos: AppConstants.pdfBase64),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 50.0,
          ),
          const Text(
            "Selecciona un archivo pdf para su visualizacion",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20.0),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Expanded(
            child: GridView.count(
                padding: const EdgeInsets.only(right: 50.0, left: 50.0, top: 20.0),
                crossAxisCount: 2,
                childAspectRatio: 1,
                children: List.generate(archivos.length, (index) {
                  return TextButton(
                    onPressed: () {
                      Utils.base64ToPdf(archivos[index].datos, archivos[index].fileName, 'pdf');
                    },
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                      const CircleBorder(
                        side: BorderSide(color: Colors.white54, width: 5),
                      ),
                    )),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 100.0,
                          child: Image.asset('assets/pdf-icon.png'),
                        ),
                        Text(archivos[index].fileName,
                            style: Theme.of(context).textTheme.bodySmall)
                      ],
                    ),
                  );
                }).toList()),
          ),
        ],
      ),
    );
  }
}
