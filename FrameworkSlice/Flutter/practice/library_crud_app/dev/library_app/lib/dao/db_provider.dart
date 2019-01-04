import 'package:sqflite/sqflite.dart';
import 'package:library_app/utils/helper_db_functions.dart' show DBHelper;

class DBProvider {
  DBHelper proxyDb;
  Database db;

  DBProvider(String path) {
    proxyDb = DBHelper(path);
    proxyDb.getDb().then((db) => this.db = db);
  }

  Future open(String path) async {
    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''建表''');
    });
  }

  Future close() async => db.close();
}
