import 'package:mini_projeto/model/registo.dart';
import 'package:mini_projeto/format/days_between.dart';

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
    final diferenca = daysBetween(dataRegisto, dataHoje);
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
    final diferenca = daysBetween(dataRegisto, dataHoje);
    if(diferenca <= 7) {
      _datasource.removeAt(id);
      return true;
    } else {
      return false;
    }

  }

  double averageWeight7Days() {
    double total = 0.0;
    int count = 0;
    final dataHoje = DateTime.now();
    if(_datasource.isNotEmpty) {
      for(var object in _datasource) {
        final diferenca = daysBetween(object.data, dataHoje);
        if(diferenca <= 7) {
          count++;
          total += object.peso;
        }
      }
      return total / count;
    } else {
      return 0.0;
    }
  }

  double averageWeight30Days() {
    double total = 0.0;
    int count = 0;
    final dataHoje = DateTime.now();
    if(_datasource.isNotEmpty) {
      for(var object in _datasource) {
        final diferenca = daysBetween(object.data, dataHoje);
        if(diferenca <= 30) {
          count++;
          total += object.peso;
        }
      }
      return total / count;
    } else {
      return 0.0;
    }
  }

  double _averageWeight1and7Days() {
    double total = 0.0;
    int count = 0;
    final dataHoje = DateTime.now();
    if(_datasource.isNotEmpty) {
      for(var object in _datasource) {
        final diferenca = daysBetween(object.data, dataHoje);
        if(diferenca >= 0 && diferenca <= 7 ) {
          count++;
          total += object.peso;
        }
      }
      return total / count;
    } else {
      return 0.0;
    }
  }

  double _averageWeight8and15Days() {
    double total = 0.0;
    int count = 0;
    final dataHoje = DateTime.now();
    if(_datasource.isNotEmpty) {
      for(var object in _datasource) {
        final diferenca = daysBetween(object.data, dataHoje);
        if(diferenca >= 8 && diferenca <= 15 ) {
          count++;
          total += object.peso;
        }
      }
      return total / count;
    } else {
      return 0.0;
    }
  }

  double averageWeightChangeOverTheLast7Days() {
    final Vfinal = _averageWeight8and15Days();
    final Vinicial = _averageWeight1and7Days();

    return double.parse((((Vfinal - Vinicial) / Vinicial) * 100).toStringAsFixed(2));
  }

  double averageNote7days() {
    double total = 0.0;
    int count = 0;
    final dataHoje = DateTime.now();
    if(_datasource.isNotEmpty) {
      for(var object in _datasource) {
        final diferenca = daysBetween(object.data, dataHoje);
        if(diferenca <= 7) {
          count++;
          total += object.nota.toDouble();
        }
      }
      return total / count;
    } else {
      return 0.0;
    }
  }

  double averageNote30days() {
    double total = 0.0;
    int count = 0;
    final dataHoje = DateTime.now();
    if(_datasource.isNotEmpty) {
      for(var object in _datasource) {
        final diferenca = daysBetween(object.data, dataHoje);
        if(diferenca <= 30) {
          count++;
          total += object.nota.toDouble();
        }
      }
      return total / count;
    } else {
      return 0.0;
    }
  }

  double firstWeight() {
    if(_datasource.isNotEmpty) {
      return _datasource[0].peso;
    } else {
      return 0.0;
    }
  }

  double lastWeight() {
    if(_datasource.isNotEmpty) {
      return _datasource[_datasource.length - 1].peso;
    } else {
      return 0.0;
    }
  }

  List<Registo> dataForGraphLast15() {
    List<Registo> toReturn = [];
    if(_datasource.isNotEmpty) {
      int size = _datasource.length;
      if(size <= 15) {
        toReturn = _datasource;
      } else {
        toReturn = _datasource.sublist(size - 15, size -1);
      }
    }
    return toReturn;
  }

}