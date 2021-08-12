import 'dart:io';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> getDB() async {
  var dbdir = await getDatabasesPath();
  final String dbpath = join(dbdir, '~www/picture-viewer.db');

  if (!(await databaseExists(dbpath))) {
    // dbが存在しない場合は適当なデータベースを作成して保存する
    try {
      await Directory(dirname(dbpath)).create(recursive: true);
    } catch (_) {}

    var data = await rootBundle.load(join('assets', 'picture-viewer.db'));
    List<int> bytes =
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

    await File(dbpath).writeAsBytes(bytes, flush: true);
  }

  return await openDatabase(dbpath);
}

// closeは
// await db.close();