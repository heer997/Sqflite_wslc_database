import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  var table = "note";
  var columnid = "note_id";
  var columntitle = "note_title";
  var columndesc = "note_desc";

  Future<Database> openDb() async {
    var directory = await getApplicationDocumentsDirectory();
    await directory.create(recursive: true);
    var path = directory.path + "notesdb.db";
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute(
            "create table $table ($columnid integer primary key autoincrement, $columntitle text, $columndesc text)");
      },
    );
  }

  addData(String title, String desc) async {
    var db = await openDb();
    db.insert(
      table,
      {
        columntitle: title,
        columndesc: desc,
      },
    );
  }
}
