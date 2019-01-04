import 'package:sqflite/sqflite.dart';

import 'package:library_app/dao/dao.dart';
import 'package:library_app/model/book.dart' show Book;
import 'package:library_app/utils/helper_db_functions.dart'
    show DBHelper, getTargetDBPath;

class BookDao implements Dao<Book> {
  static DBHelper dbHelper;

  Database db;

  BookDao() {
    String path;
    getTargetDBPath('library.sqlite').then((s) => path = s);
    dbHelper = DBHelper(path);
    dbHelper.getDb().then((db) => this.db = db);
  }

  @override
  List<Book> fetchAll() {
    String sql = """
    SELECT * FROM book
    """;
    List<Map> rawBooks;
    db.rawQuery(sql).then((_) => rawBooks = _).whenComplete(() {
      db.close();
    });
    List<Book> books = [];
    if (rawBooks != null) {
      books = rawBooks.map((book) => Book.fromMap(book)).toList();
    }

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
