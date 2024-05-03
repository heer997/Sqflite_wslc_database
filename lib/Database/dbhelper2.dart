import 'dart:io';
import "package:path/path.dart";
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:wslc_database/Model/dbmodel.dart';

class DbHelper2 {
  static final DbHelper2 dbHelper = DbHelper2();
  Database? database;
  static const Notetable = "notes";
  static const Note_id = "noteid";
  static const Note_title = "notetitle";
  static const Note_desc = "notedesc";

  Future<Database> getDb() async {
    if (database != null) {
      return database!;
    } else {
      return await initDb();
    }
  }

  Future<Database> initDb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    var dbpath = join(directory.path + "notesdb2.db");
    return openDatabase(
      dbpath,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
            "create table $Notetable ($Note_id integer primary key autoincrement,"
            " $Note_title text, $Note_desc text)");
      },
    );
  }

  Future<bool> addNotes(UserModel newuser) async {
    var db = await getDb();
    int inserteddata = await db.insert(Notetable, newuser.toMap());
    return inserteddata > 0;
  }
}
