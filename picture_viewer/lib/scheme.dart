//import 'package:sqflite/sqflite.dart';

import 'dart:typed_data';

class Picture {
  final int id;
  final String digest;
  final int width;
  final int height;
  final int size_bytes;

  Picture(
      {required this.id,
      required this.digest,
      required this.width,
      required this.height,
      required this.size_bytes});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'digest': digest,
      'width': width,
      'height': height,
      'size_bytes': size_bytes
    };
  }

  @override
  String toString() {
    return 'Picture{id: $id, digest: $digest, width: $width, height: $height, size_bytes: $size_bytes}';
  }
}

class Thumbnail {
  final int picture_id;
  final Uint8List bytes;

  Thumbnail({required this.picture_id, required this.bytes});

  Map<String, dynamic> toMap() {
    return {'picture_id': picture_id, 'data': bytes};
  }
}

/**
 * Futer<ByteData> Asset::getByteData()
 * ByteData().buffer.asUint8List()
 * Image.memory(Uint8List bytes)
 */