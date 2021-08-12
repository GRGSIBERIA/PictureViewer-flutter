//import 'package:sqflite/sqflite.dart';

import 'dart:typed_data';

class Picture {
  final int id;
  final String digest;
  final int width;
  final int height;
  final int size_bytes;
  final int bytes;

  Picture(
      {required this.id,
      required this.digest,
      required this.width,
      required this.height,
      required this.size_bytes,
      required this.bytes});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'digest': digest,
      'width': width,
      'height': height,
      'size_bytes': size_bytes,
      'bytes': bytes
    };
  }

  @override
  String toString() {
    return 'Picture{id: $id, digest: $digest, width: $width, height: $height, size_bytes: $size_bytes}';
  }
}

class Thumbnail {
  final int picture_id;
  final String digest;
  final int width;
  final int height;
  final int size_bytes;
  final Uint8List bytes;

  Thumbnail(
      {required this.picture_id,
      required this.digest,
      required this.width,
      required this.height,
      required this.size_bytes,
      required this.bytes});

  Map<String, dynamic> toMap() {
    return {'picture_id': picture_id, 'bytes': bytes};
  }

  @override
  String toString() {
    return 'Thumbnail{picture_id: $picture_id, digest: $digest, size_bytes: $size_bytes}';
  }
}


/**
 * Futer<ByteData> Asset::getByteData()
 * ByteData().buffer.asUint8List()
 * Image.memory(Uint8List bytes)
 */