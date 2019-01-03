import 'package:flutter/material.dart';

import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_dev_tools/redux_dev_tools.dart';
import 'package:flutter_redux_dev_tools/flutter_redux_dev_tools.dart';

import 'package:study_redux_todo/model/model.dart';
import 'package:study_redux_todo/redux/actions.dart';
import 'package:study_redux_todo/redux/reducer.dart';
import 'package:study_redux_todo/redux/middleware.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final Store<AppState> store = Store<AppState>(
    final DevToolsStore<AppState> store = DevToolsStore<AppState>(
      appStateReducer,
      initialState: AppState.initialState(),
      middleware: [appStateMiddleware],
    );

    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'Flutter Redux Demo',
        theme: ThemeData.dark(),
        home: StoreBuilder<AppState>(
          onInit: (store) => store.dispatch(GetItemsAction()),
          builder: (BuildContext context, Store<AppState> store) =>
              HomePage(store),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  // final Store<AppState> store;
  final DevToolsStore<AppState> store;

  HomePage(this.store);

  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo'),
      ),
      body: StoreConnector<AppState, _ViewModel>(
        // 这只是一个函数，它接受store然后将其转换为我们想要传递给降序小部件的视图模型
        converter: (Store<AppState> store) => _ViewModel.create(store),
        // it takes in whatever we returned from the converter which in the case is our view model type, we can then expose this view model to any of the children of this widget which in this case is a column.
        //第二个参数接收我们从转换器返回的任何内容，在这种情况下我们的视图模型类型，我们可以将此视图模型公开给此窗口小部件的任何子项，在本例中是一列。
        builder: (BuildContext innerContext, _ViewModel viewModel) => Column(
              children: <Widget>[
                AddItemWidget(viewModel),
                Expanded(
                  child: ItemListWidget(viewModel),
                ),
                RemoveAllItemsButton(viewModel),
              ],
            ),
      ),
      drawer: Container(
        child: ReduxDevTools(widget.store),
      ),
    );
  }
}

class RemoveAllItemsButton extends StatelessWidget {
  final _ViewModel viewModel;

  RemoveAllItemsButton(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text("删除所有事项"),
      onPressed: () => viewModel.onRemoveItems(),
    );
  }
}

class ItemListWidget extends StatelessWidget {
  final _ViewModel viewModel;

  ItemListWidget(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: viewModel.items
          .map(
            (Item item) => ListTile(
                  title: Text(item.body),
                  leading: IconButton(
                    icon: Icon(Icons.delete_forever),
                    onPressed: () => viewModel.onRemoveItem(item),
                  ),
                ),
          )
          .toList(),
    );
  }
}

class AddItemWidget extends StatefulWidget {
  final _ViewModel viewModel;

  AddItemWidget(this.viewModel);

  @override
  State<StatefulWidget> createState() => _AddItemWidgetState();
}

class _AddItemWidgetState extends State<AddItemWidget> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: '新事项',
      ),
      onSubmitted: (String s) {
        widget.viewModel.onAddItem(s);
        controller.text = '';
      },
    );
  }
}

/// 中间层 连接 UI(View) 和 Store(Model),
/// 在这个地方暴露我们所希望的从store或ui中的部分到这个app上
class _ViewModel {
  // 我们希望暴露我们的model给app
  final List<Item> items;

  // 给这个viewmodel提供操作接口
  final Function(String) onAddItem;
  final Function(Item) onRemoveItem;
  final Function() onRemoveItems;

  _ViewModel({
    this.items,
    this.onAddItem,
    this.onRemoveItem,
    this.onRemoveItems,
  });

  factory _ViewModel.create(Store<AppState> store) {
    _onAddItem(String body) {
      store.dispatch(AddItemAction(body));
    }

    _onRemoveItem(Item item) {
      store.dispatch(RemoveItemAction(item));
    }

    _onRemovesItem() {
      store.dispatch(RemoveItemsAction());
    }

    return _ViewModel(
      items: store.state.items,
      onAddItem: _onAddItem,
      onRemoveItem: _onRemoveItem,
      onRemoveItems: _onRemovesItem,
    );
  }
}
