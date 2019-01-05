import 'package:sqflite/sqflite.dart';

import 'package:library_app/config/app_database.dart';
import 'package:library_app/util/helper_db_functions.dart'
    show DBHelper, getTargetDBPath, importExistingSQLiteFile;
import 'package:library_app/app/model/entity/book.dart' show Book;

import 'dao.dart';

class BookDao implements Dao<Book> {
  AppDataBase appDataBase;

  @override
  Future<List<Book>> fetchAll() async {
    appDataBase = AppDataBase(await getTargetDBPath('library.db'));
    Database db = await appDataBase.getInstance();
    String sql = """
    SELECT * FROM book
    """;
    List<Map> rawBooks = await db.rawQuery(sql);
    print(rawBooks);
    await db.close();
    print("db closed");
    List<Book> books =
        rawBooks.map((book) => Book.fromMap(book)).toList() ?? [];
    return books;
  }

  @override
  Future<bool> modifyInfoById(int uniqueId, Map<String, dynamic> updatingInfo) {
    // TODO: implement modifyInfoById
    return null;
  }

  @override
  Future<bool> removeById(int uniqueId) {
    // TODO: implement removeById
    return null;
  }
}
