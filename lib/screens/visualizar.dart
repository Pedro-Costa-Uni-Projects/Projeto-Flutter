import 'package:flutter/material.dart';

import '../data/datasource.dart';

class VisualizarScreen extends StatefulWidget {
  VisualizarScreen(this.id, {Key? key});
  final int id;
  final String title = "Visualizar Registo";

  @override
  State<VisualizarScreen> createState() => _VisualizarScreenState(this.id);
}

class _VisualizarScreenState extends State<VisualizarScreen> {
  _VisualizarScreenState(this.id);
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
      body: Center(
        child: Text(id.toString()),
      )
    );
  }
}