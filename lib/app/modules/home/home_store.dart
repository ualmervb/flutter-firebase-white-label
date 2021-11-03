import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {

  @observable
  int page = 0;

  @action
  void setPage(int value) => page = value;
}