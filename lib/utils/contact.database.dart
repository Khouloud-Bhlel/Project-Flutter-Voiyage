import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../model/contact.model.dart';

abstract class ContactDatabase {
  static Database? _db;

  static int get _version => 1;

  static Future<void> getdb() async {
    if (_db == null) await initDB();
  }

  static Future<void> initDB() async {
    String databasePath = await getDatabasesPath();
    String _path = join(databasePath, 'voyage.db');
    _db = await openDatabase(_path, version: _version, onCreate: _onCreate);
  }

  static _onCreate(Database db, int version) async {
    String sql =
        'CREATE TABLE contact (id INTEGER PRIMARY KEY AUTOINCREMENT, nom STRING, tel STRING)';
    await db.execute(sql);
  }

  static Future<List<Map<String, dynamic>>> recuperer() async {
    await getdb();
    return _db!.query(Contact.table);
  }

  static Future<int> inserer(Contact contact) async {
    await getdb();
    return _db!.insert(Contact.table, contact.toJson());
  }

  static Future<int> modifier(Contact contact) async {
    await getdb();
    return _db!.update(Contact.table, contact.toJson(),
        where: 'id = ?', whereArgs: [contact.id]);
  }

  static Future<int> supprimer(Contact contact) async {
    await getdb();
    return _db!.delete(Contact.table, where: 'id = ?', whereArgs: [contact.id]);
  }
}
