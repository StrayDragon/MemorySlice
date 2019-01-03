/// 各种应用与状态的纯函数,使得状态的改变
import 'package:study_redux_todo/model/model.dart';
import 'actions.dart';

AppState appStateReducer(AppState state, action) {
  return AppState(items: itemReducer(state.items, action));
}

List<Item> itemReducer(List<Item> state, action) {
  if (action is AddItemAction) {
    return []
      ..addAll(state)
      ..add(Item(id: action.id, body: action.item));
  }

  if (action is RemoveItemAction) {
    return List.unmodifiable(List.from(state)..remove(action.item));
  }

  if (action is RemoveItemsAction) {
    return List.unmodifiable([]);
  }

  if (action is LoadedItemsAction) {
    return action.items;
  }

  return state;
}
