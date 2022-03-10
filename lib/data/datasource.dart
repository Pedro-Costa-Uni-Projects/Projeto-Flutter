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

  bool edit(int id, double peso, String alimentacao, int nota, String observacoes ) {
    final dataRegisto = _datasource[id].data;
    final dataHoje = DateTime.now();
    final diferenca = _daysBetween(dataRegisto, dataHoje);
    if(diferenca <= 7) {
      _datasource[id].peso = peso;
      _datasource[id].alimentacao = alimentacao;
      _datasource[id].nota = nota;
      _datasource[id].observacoes = observacoes;
      return true;
    } else {
      return false;
    }
  }

  Registo visualize(int id) {
    return _datasource[id];
  }

  bool delete(int id) {
    final dataRegisto = _datasource[id].data;
    final dataHoje = DateTime.now();
    final diferenca = _daysBetween(dataRegisto, dataHoje);
    if(diferenca <= 7) {
      _datasource.removeAt(id);
      return true;
    } else {
      return false;
    }

  }

  //Ver diferança entre datas
  //Obrigado ao user @diegoveloper do site stackoverflow.com
  int _daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to
        .difference(from)
        .inHours / 24).round();
  }

}