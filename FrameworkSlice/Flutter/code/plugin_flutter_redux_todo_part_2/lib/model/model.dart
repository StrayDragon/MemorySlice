import 'package:flutter/foundation.dart';

/// PODO
class Item {
  final int id;
  final String body;

  Item({
    @required this.id,
    @required this.body,
  });

  Item copyWith({int id, String body}) {
    return Item(
      id: id ?? this.id,
      body: body ?? this.body,
    );
  }

  Item.fromJSON(Map json)
      : id = json['id'],
        body = json['body'];

  Map toJSON() => {
        'id': id,
        'body': body,
      };
}

class AppState {
  final List<Item> items;

  AppState({
    @required this.items,
  });

  AppState.initialState() : items = List.unmodifiable(<Item>[]);

  AppState.fromJSON(Map json)
      : items = (json['items'] as List).map((i) => Item.fromJSON(i)).toList();

  Map<String, dynamic> toJSON() =>
      {'items': items.map((i) => i.toJSON()).toList()};
}
