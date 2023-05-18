import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/services.dart';

class Utils {
  static Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    final codec = await instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    final frameInfo = await codec.getNextFrame();
    return (await frameInfo.image.toByteData(format: ImageByteFormat.png))
        .buffer
        .asUint8List();
  }
}
