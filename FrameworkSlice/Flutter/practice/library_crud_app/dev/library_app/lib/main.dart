import 'package:flutter/material.dart';

import 'app/model/dao/book_dao.dart';
import 'util/helper_log.dart';

void main() => runApp(LibraryApp());

class LibraryApp extends StatelessWidget {
  final BookDao bookController = BookDao();

  LibraryApp() {
    bookController
        .fetchAll()
        .then((_) => log(_.toString()))
        .whenComplete(() => log('ok'));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LibraryApp',
      theme: ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('图书馆管理系统'),
          centerTitle: true,
        ),
        body: Center(
          child: Text('首页'),
        ),
      ),
    );
  }
}
