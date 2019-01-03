import 'dart:async';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class HandleSQLiteDataWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HandleSQLiteDataWidgetState();
  }
}

class _HandleSQLiteDataWidgetState extends State<HandleSQLiteDataWidget> {
  String dbName = 'library.db';
  String dbPath;

  String sqlCreateTable = """
  create table book
(
  id           INTEGER not null
    constraint book_pk
      primary key autoincrement,
  isbn         INTEGER,
  title        TEXT,
  press        TEXT,
  author       TEXT,
  brief        TEXT,
  amount       TEXT,
  publish_time TEXT
);

create unique index book_isbn_uindex
  on book (isbn);
""";

  String sqlQueryCount = 'SELECT COUNT(*) FROM book';

  String sqlQuery = 'SELECT * FROM book';

  var _result;

  Future<String> _createNewDb(String dbName) async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    print(documentsDirectory);

    String path = join(documentsDirectory.path, dbName);

    if (await Directory(dirname(path)).exists()) {
      await deleteDatabase(path);
    } else {
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (e) {
        print(e);
      }
    }
    return path;
  }

  _create() async {
    dbPath = await _createNewDb(dbName);
    Database db = await openDatabase(dbPath);

    await db.execute(sqlCreateTable);
    await db.close();
    setState(() {
      _result = '创建library.db成功，创建book成功';
    });
  }

  _add() async {
    Database db = await openDatabase(dbPath);

    String sql = """
    INSERT INTO "book" ("isbn", "title", "press", "author", "brief", "amount")
VALUES (9787115439789, '第一行代码：Android(第2版)', '人民邮电出版社', '郭霖', '本书被广大Android 开发者誉为“Android 学习第一书”。全书系统全面、循序渐进地介绍了Android软件开发的必备知识、经验和技巧。

     第2版基于Android 7.0 对第1 版进行了全面更新，将所有知识点都在最新的Android 系统上进行重新适配，使用 全新的Android Studio 开发工具代替之前的Eclipse，并添加了对Material Design、运行时权限、Gradle、RecyclerView、百分比布局、OkHttp、Lambda 表达式等全新知识点的详细讲解。

     本书内容通俗易懂，由浅入深，既是Android 初学者的入门必备，也是Android 开发者的进阶首选。', '3');
    """; //TODO:
    await db.transaction((txn) async {
      int id = await txn.rawInsert(sql);
    });

    await db.close();

    setState(() {
      _result = ""; //TODO:
    });
  }

  _delete() async {
    Database db = await openDatabase(dbPath);

    String sql = "DELETE FROM user_table WHERE id = ?";

    int count = await db.rawDelete(sql, ['1']);

    await db.close();

    setState(() {
      if (count == 1) {
        _result = "删除成功，请查看";
      } else {
        _result = "删除失败，请看log";
      }
    });
  }

  _update() async {
    Database db = await openDatabase(dbPath);
    String sql = "UPDATE user_table SET pwd = ? WHERE id = ?";
    int count = await db.rawUpdate(sql, ["654321", '1']);
    print(count);
    await db.close();
    setState(() {
      _result = "更新数据成功，请查看";
    });
  }

  _queryNum() async {
    Database db = await openDatabase(dbPath);
    int count = Sqflite.firstIntValue(await db.rawQuery(sqlQueryCount));
    await db.close();
    setState(() {
      _result = "数据条数：$count";
    });
  }

  _query() async {
    Database db = await openDatabase(dbPath);
    List<Map> list = await db.rawQuery(sqlQuery);
    await db.close();
    setState(() {
      _result = "数据详情：$list";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: Text('sqflite用法'),
        ),
        Row(
          children: <Widget>[
            RaisedButton(
                textColor: Colors.black, child: Text('创建'), onPressed: _create),
            RaisedButton(
              textColor: Colors.black,
              child: Text('增'),
              onPressed: _add,
            ),
            RaisedButton(
                textColor: Colors.black, child: Text('删'), onPressed: _delete),
            RaisedButton(
                textColor: Colors.black, child: Text('改'), onPressed: _update),
          ],
        ),
        Row(
          children: <Widget>[
            RaisedButton(
                textColor: Colors.black,
                child: Text('查条数'),
                onPressed: _queryNum),
            RaisedButton(
                textColor: Colors.black, child: Text('查详情'), onPressed: _query),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: Text('结果：$_result'),
        ),
      ],
    );
  }
}
