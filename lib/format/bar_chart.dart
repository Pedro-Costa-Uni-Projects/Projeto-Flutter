import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import '../data/datasource.dart';
import '../model/registo.dart';

class BarChart extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    List<charts.Series<Registo, String>> series = [
      charts.Series(
        id: "pezo",
        data: DataSource.getInstance().funDataForGraphLast15(),
        domainFn: (Registo registo, _) => (registo.data.day.toString() + "\n/\n" + registo.data.month.toString()),
        measureFn: (Registo registo, _) => registo.peso,
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
      )
    ];
    return Container(
      height: 300,
      width: MediaQuery.of(context).size.width,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(9.0),
          child: Column(
            children: <Widget>[
              Text(
                "Útimos 15 registos de peso",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              Expanded(
                child: charts.BarChart(series, animate: true),
              )
            ],
          ),
        ),
      ),
    );
  }

}