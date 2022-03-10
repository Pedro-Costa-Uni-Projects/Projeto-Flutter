import 'package:flutter/material.dart';
import 'package:mini_projeto/screens/visualizar.dart';
import '../data/datasource.dart';
import 'package:intl/intl.dart';

class ListagemScreen extends StatefulWidget {
  const ListagemScreen({Key? key}) : super(key: key);

  final String title = "Listar Registos";

  @override
  State<ListagemScreen> createState() => _ListagemScreenState();
}

class _ListagemScreenState extends State<ListagemScreen> {
  DataSource _dataSource = DataSource.getInstance();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: _dataSource.getAll().length,
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              children: [
                ListTile(
                  title: Text("Peso: " + _dataSource.getAll()[index].peso.toString() + " kg"),
                  subtitle: Text("Bem-estar: " + _dataSource.getAll()[index].nota.toString()
                      + "\n" +
                      "Data: " + formatter9000(_dataSource.getAll()[index].data)),
                  isThreeLine: true,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => VisualizarScreen(index)),
                    );
                  },
                ),
              ],
            )
          );
        },
      ),
    );
  }
}

String formatter9000(DateTime data) {
  return DateFormat('dd/MM/yyyy - HH:mm').format(data);
}