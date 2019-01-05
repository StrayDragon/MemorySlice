import 'dart:async';

abstract class Dao<M> {
  Future<List<M>> fetchAll();

  Future<bool> modifyInfoById(int uniqueId, Map<String, dynamic> updatingInfo);

  Future<bool> removeById(int uniqueId);
}
