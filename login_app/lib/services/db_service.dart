import 'package:login_app/models/absence_presence.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DbService {
  sql.Database db;

  Future<void> open() async {
    final dbPath = await sql.getDatabasesPath();
    final myDBpath = path.join(dbPath, 'login.db');
//    await sql.deleteDatabase(myDBpath);
    db = await sql.openDatabase(
      myDBpath,
      onCreate: (db, version) async {
        db.execute(
          "CREATE TABLE absence(id TEXT PRIMARY KEY, title TEXT, description TEXT)",
        );
      },
      version: 1,
    );
  }

  addAbsence(AbsencePresence absence) async {
    await open();
    await db.insert('absence', absence.toMap());
    return absence;
  }

  getAbsence() async {
    await open();
    List<Map> list = await db.rawQuery('SELECT * FROM absence');
    return List.generate(list.length, (i) {
      return AbsencePresence(
          id: list[i]['id'],
          title: list[i]['title'],
          description: list[i]['description']);
    });
  }
}
