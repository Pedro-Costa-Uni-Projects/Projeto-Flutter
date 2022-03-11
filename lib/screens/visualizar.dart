import 'package:flutter/material.dart';
import '../alerts/pop_up_fail_delete_or_edit.dart';
import '../format/date_formatter.dart';
import '../data/datasource.dart';
import '../format/days_between.dart';
import 'editar.dart';

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
              Row(
                children: [
                  Text(
                    "Peso: ",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    _dataSource.getAll()[id].peso.toString() + " kg",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              Container(height: 1, width: MediaQuery.of(context).size.width, color: Colors.black87,),
              Row(
                children: [
                  Text(
                    "Alim. nas ultimas 3 horas: ",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    _dataSource.getAll()[id].alimentacao.toString(),
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              Container(height: 1, width: MediaQuery.of(context).size.width, color: Colors.black87,),
              Row(
                children: [
                  Text(
                    "Bem-estar: ",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    _dataSource.getAll()[id].nota.toString(),
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              Container(height: 1, width: MediaQuery.of(context).size.width, color: Colors.black87,),
              Text(
                "Observações:",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                _dataSource.getAll()[id].observacoes.toString(),
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Container(height: 1, width: MediaQuery.of(context).size.width, color: Colors.black87,),
              Row(
                children: [
                  Text(
                    "Data: ",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    formatter9000(_dataSource.getAll()[id].data),
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              Container(height: 1, width: MediaQuery.of(context).size.width, color: Colors.black87,),
            ],
          ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MaterialButton(
              minWidth: MediaQuery.of(context).size.width / 2,
              child: Text("Editar", style: TextStyle(color: Colors.white),),
              color: Colors.orange,
              onPressed: () {
                final dataRegisto = _dataSource.getAll()[id].data;
                final dataHoje = DateTime.now();
                final diferenca = daysBetween(dataRegisto, dataHoje);
                if(diferenca <= 7) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EditarScreen(id)),
                  );
                } else {
                  showDialog(context: context,
                    builder: (BuildContext context) => popUpFailDeleteOrEdit(context, "editados"),
                  );
                }
              },
            ),
          ],
         )
        ],
      ),
    );
  }
}