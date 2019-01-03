/// 包含所有Actions

import 'package:study_redux_todo/model/model.dart';

class AddItemAction {
  static int _id = 0;
  final String item; // 思考这个item意味着啥

  AddItemAction(this.item) {
    _id++;
  }

  int get id => _id;
}

class RemoveItemAction {
  // int id; FIXME:另一种实现
  final Item item; // 思考这个item意味着啥

  RemoveItemAction(this.item);
}

class RemoveItemsAction {}
