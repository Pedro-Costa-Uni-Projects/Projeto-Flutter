import 'package:flutter_test/flutter_test.dart';
import 'package:mini_projeto/data/datasource.dart';
import 'package:mini_projeto/format/days_between.dart';
import 'package:mini_projeto/model/registo.dart';

void main() {
  //Testes Usando os Dados Pré Carregados
  DataSource _datasource = DataSource.getInstance();

  test("Tamanho Lista", () {
    var tamanhoLista = _datasource.getAll().length;

    expect(tamanhoLista, 15);
  });

  test("Inserir e Delete", () {
    Registo testeRegisto = Registo(230, "Sim", 5, "Teste Unitario");
    _datasource.insert(testeRegisto);
    var tamanhoLista = _datasource.getAll().length;

    expect(_datasource.getAll()[0].toString(), testeRegisto.toString());
    expect(tamanhoLista, 16);

    _datasource.delete(0);
    tamanhoLista = _datasource.getAll().length;

    expect(tamanhoLista, 15);

  });

  test("Visualizar", () {
    Registo registo = _datasource.visualize(0);

    expect(registo.peso, 100.0);
    expect(registo.alimentacao, "Sim");
    expect(registo.nota, 5);
    expect(registo.observacoes, "Pré Carregado 1");

  });

  test("Primeiro Registo de Peso", () {
    expect(_datasource.funFirstWeight(), "60.00");

  });

  test("Último Registo de Peso", () {
    expect(_datasource.funLastWeight(), "100.00");

  });

  test("Variação", () {
    final peso1e7Dias = double.parse(_datasource.funAverageWeight7Days());
    final peso8e15Dias;
    double total = 0.0;
    int count = 0;
    final dataHoje = DateTime.now();
    if(_datasource.getAll().isNotEmpty) {
      for(var object in _datasource.getAll()) {
        final diferenca = daysBetween(object.data, dataHoje);
        if(diferenca >= 7 && diferenca < 15 ) {
          count++;
          total += object.peso;
        }
      }
      peso8e15Dias = total / count;
    } else {
      peso8e15Dias = 0.0;
    }

    final match = (((peso8e15Dias - peso1e7Dias) / peso1e7Dias) * 100).toStringAsFixed(2);
    expect(_datasource.funAverageWeightChangeOverTheLast7Days(), match);

  });

  test("Dados Para o Gráfico", () {
    var tamanhoLista = _datasource.getAll().length;
    var tamanho = _datasource.funDataForGraphLast15().length;

    if(tamanhoLista <= 15) {
      expect(tamanho, tamanhoLista);
    } else {
      expect(tamanho, 15);
    }

  });

}

