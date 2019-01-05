import 'package:sqflite/sqflite.dart';

import 'package:library_app/app/model/service/app_database.dart';
import 'package:library_app/util/helper_db_functions.dart'
    show DBHelper, getTargetDBPath, importExistingSQLiteFile;
import 'package:library_app/app/model/entity/book.dart' show Book;

import 'dao.dart';

class BookDao implements Dao<Book> {
  AppDataBase dbHelper;

  @override
  Future<List<Book>> fetchAll() async {
    dbHelper = dbHelper ?? AppDataBase(await getTargetDBPath('library.db'));
    Database db = await dbHelper.getInstance();
    String sql = """
    SELECT * FROM book
    """;
    List<Map> rawBooks = await db.rawQuery(sql);
    await db.close();
    print("db closed");
    List<Book> books =
        rawBooks.map((book) => Book.fromMap(book)).toList() ?? [];
    return books;
  }

  @override
  Future<bool> modifyInfoById(
      int uniqueId, Map<String, dynamic> updatingInfo) async {
    dbHelper = dbHelper ?? AppDataBase(await getTargetDBPath('library.db'));
    Database db = await dbHelper.getInstance();

    int result = await db.update('book', updatingInfo);
    updatingInfo.forEach((k, v) => print("$k : $v"));

    await db.close();
    print("db closed");
    return result == 1;
  }

  @override
  Future<bool> removeById(int uniqueId) async {
    dbHelper = dbHelper ?? AppDataBase(await getTargetDBPath('library.db'));
    Database db = await dbHelper.getInstance();

    int result = await db.delete('book', where: 'id', whereArgs: [uniqueId]);

    await db.close();
    print("db closed");
    return result == 1;
  }
}
