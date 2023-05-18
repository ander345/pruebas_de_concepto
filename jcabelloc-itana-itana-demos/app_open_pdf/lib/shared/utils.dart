import 'dart:convert';
import 'dart:io';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';

class Utils {
  static Future<void> base64ToPdf(String base64String, String fileName, String formato) async {
    var bytes = base64Decode(base64String);
    final output = await getExternalStorageDirectory();
    final file = File("${output!.path}/$fileName.$formato");
    await file.writeAsBytes(bytes.buffer.asUint8List());
    await OpenFilex.open("${output!.path}/$fileName.$formato");
  }
}