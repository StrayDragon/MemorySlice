import 'dart:async';
import 'dart:convert' show json;

import 'package:redux/redux.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:study_redux_todo/model/model.dart';
import 'package:study_redux_todo/redux/actions.dart';

void saveToSharedPrefs(AppState state) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  String jsonStr = json.encode(state.toJSON());
  await sharedPreferences.setString('itemsState', jsonStr);
}

Future<AppState> loadFromSharedPrefs() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  String jsonStr = sharedPreferences.getString('itemsState');

  if (jsonStr != null) {
    // 里面没有东西 情况:第一次启动...
    Map jsonObj = json.decode(jsonStr);
    return AppState.fromJSON(jsonObj);
  }
  return AppState.initialState();
}

void appStateMiddleware(
    Store<AppState> store, action, NextDispatcher next) async {
  // NextDispatcher next
  // 是一个函数我们可以用来调用一整条链上的middleware到下一个middleware(如果有的话)或者传给reducer
  next(action);
  if (action is AddItemAction ||
      action is RemoveItemAction ||
      action is RemoveItemsAction) {
    saveToSharedPrefs(store.state);
  }

  if (action is GetItemsAction) {
    await loadFromSharedPrefs()
        .then((state) => store.dispatch(LoadedItemsAction(state.items)));
  }
}
