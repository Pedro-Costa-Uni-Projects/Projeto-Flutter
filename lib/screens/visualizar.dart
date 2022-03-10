import 'package:flutter/material.dart';
import '../format/date_formatter.dart';
import '../data/datasource.dart';

class VisualizarScreen extends StatefulWidget {
  VisualizarScreen(this.id, {Key? key});

  //Ver Melhor Forma de Fazer
  final int id;
  final String title = "Visualizar Registo";

  @override
  State<VisualizarScreen> createState() => _VisualizarScreenState(this.id);
}

class _VisualizarScreenState extends State<VisualizarScreen> {
  _VisualizarScreenState(this.id);

  //Ver Melhor Forma de Fazer
  final int id;
  DataSource _dataSource = DataSource.getInstance();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(15),
            children: [
              Text(
                "Peso:",
                style: TextStyle(
                  fontSize: 25,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                _dataSource.getAll()[id].peso.toString() + " kg",
                style: TextStyle(
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                "Alim. nas ultimas 3 horas?:",
                style: TextStyle(
                  fontSize: 25,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                _dataSource.getAll()[id].alimentacao.toString(),
                style: TextStyle(
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                "Bem-estar:",
                style: TextStyle(
                  fontSize: 25,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                _dataSource.getAll()[id].nota.toString(),
                style: TextStyle(
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                "Observações:",
                style: TextStyle(
                  fontSize: 25,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                _dataSource.getAll()[id].observacoes.toString(),
                style: TextStyle(
                  fontSize: 20,
                ),
                textAlign: TextAlign.left,
              ),
              Text(
                "Data:",
                style: TextStyle(
                  fontSize: 25,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                formatter9000(_dataSource.getAll()[id].data),
                style: TextStyle(
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ],
      ),
    );
  }
}