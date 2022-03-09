import 'package:mini_projeto/model/registo.dart';

class DataSource {
  final List<Registo> _datasource = [];
  static DataSource _instance = DataSource._internal();

  DataSource._internal();

  static DataSource getInstance() {
    if(_instance == null) {
      _instance = DataSource._internal();
    }
    return _instance;
  }

  void insert(Registo registo) => _datasource.add(registo);

  List<Registo> getAll() => _datasource;

  void edit(id) {

  }

  void visualize(id) {

  }

}