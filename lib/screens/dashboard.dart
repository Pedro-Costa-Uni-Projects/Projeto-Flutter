import 'package:flutter/material.dart';
import 'package:mini_projeto/screens/adicionar.dart';
import 'package:mini_projeto/screens/listagem.dart';
import 'package:mini_projeto/data/datasource.dart';
import 'package:mini_projeto/format/bar_chart.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  final String title = "Dashboard";

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  DataSource _dataSource = DataSource.getInstance();

  @override
  Widget build(BuildContext context) {
    String averageWeight7Days = _dataSource.funAverageWeight7Days();
    String averageWeight30Days = _dataSource.funAverageWeight30Days();
    String averageWeightChangeOverTheLast7days =_dataSource.funAverageWeightChangeOverTheLast7Days();
    String averageNote7Days = _dataSource.funAverageNote7days();
    String averageNote30Days = _dataSource.funAverageNote30days();
    String firstWeight = _dataSource.funFirstWeight();
    String lastWeight = _dataSource.funLastWeight();

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: DefaultTextStyle(
        style: Theme.of(context).textTheme.bodyText2!,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                  minWidth: viewportConstraints.maxWidth,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  //mainAxisAlignment:  MainAxisAlignment.spaceAround,
                  children: [

                    //Media Peso Titulo
                    Card(
                      color: Color.fromARGB(255, 17, 113, 128),
                      child: Container(
                        height: 40.0,
                        alignment: Alignment.center,
                        child: Text("Média Peso",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                          ),
                        )
                      ),
                    ),

                    // Media Peso 7 e 30 dias
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Card(
                            color: Color.fromARGB(255, 27, 127, 125),
                            child: Container(
                                height: 80.0,
                                alignment: Alignment.center,
                                child: Column(
                                  mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text("Últimos 7 dias",
                                      style: TextStyle(
                                          fontSize: 19,
                                          color: Colors.white
                                      ),
                                    ),
                                    Text(averageWeight7Days + " Kg",
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.white
                                      ),
                                    )
                                  ],
                                )
                            ),
                          ),
                        ),
                        Flexible(
                          child: Card(
                            color: Color.fromARGB(255, 27, 127, 125),
                            child: Container(
                                height: 80.0,
                                alignment: Alignment.center,
                                child: Column(
                                  mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text("Últimos 30 dias",
                                      style: TextStyle(
                                          fontSize: 19,
                                          color: Colors.white
                                      ),
                                    ),
                                    Text(averageWeight30Days + " Kg",
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.white
                                      ),
                                    )
                                  ],
                                )
                            ),
                          ),
                        ),
                      ],
                    ),

                    //Media Variação
                    Card(
                      color: Color.fromARGB(255, 41, 148, 121),
                      child: Container(
                          height: 30.0,
                          alignment: Alignment.center,
                          child: Text("Variação: " + averageWeightChangeOverTheLast7days + " %",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),
                          )
                      ),
                    ),

                    //Espaço
                    const SizedBox(
                      height: 20,
                    ),

                    Card(
                      color: Color.fromARGB(255, 53, 165, 118),
                      child: Container(
                          height: 40.0,
                          alignment: Alignment.center,
                          child: Text("Média Bem-Estar",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),
                          )
                      ),
                    ),

                    // Media Nota 7 e 30 dias
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Card(
                            color: Color.fromARGB(255, 123, 190, 127),
                            child: Container(
                                height: 80.0,
                                alignment: Alignment.center,
                                child: Column(
                                  mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text("Últimos 7 dias",
                                      style: TextStyle(
                                          fontSize: 19,
                                          color: Colors.white
                                      ),
                                    ),
                                    Text(averageNote7Days,
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.white
                                      ),
                                    )
                                  ],
                                )
                            ),
                          ),
                        ),
                        Flexible(
                          child: Card(
                            color: Color.fromARGB(255, 123, 190, 127),
                            child: Container(
                                height: 80.0,
                                alignment: Alignment.center,
                                child: Column(
                                  mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text("Últimos 30 dias",
                                      style: TextStyle(
                                          fontSize: 19,
                                          color: Colors.white
                                      ),
                                    ),
                                    Text(averageNote30Days,
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.white
                                      ),
                                    )
                                  ],
                                )
                            ),
                          ),
                        ),
                      ],
                    ),

                    //Espaço
                    const SizedBox(
                      height: 20,
                    ),

                    Card(
                      color: Color.fromARGB(255, 130, 186, 94),
                      child: Container(
                          height: 40.0,
                          alignment: Alignment.center,
                          child: Text("Mudança",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),
                          )
                      ),
                    ),

                    // Primeiro e Ultimo Peso
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Card(
                            color: Color.fromARGB(255, 158, 202, 131),
                            child: Container(
                                height: 80.0,
                                alignment: Alignment.center,
                                child: Column(
                                  mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text("Primeiro Registo",
                                      style: TextStyle(
                                          fontSize: 19,
                                          color: Colors.white
                                      ),
                                    ),
                                    Text(firstWeight + " Kg",
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.white
                                      ),
                                    )
                                  ],
                                )
                            ),
                          ),
                        ),
                        Flexible(
                          child: Card(
                            color: Color.fromARGB(255, 158, 202, 131),
                            child: Container(
                                height: 80.0,
                                alignment: Alignment.center,
                                child: Column(
                                  mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text("Útimo Registo",
                                      style: TextStyle(
                                          fontSize: 19,
                                          color: Colors.white
                                      ),
                                    ),
                                    Text(lastWeight + " Kg",
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.white
                                      ),
                                    )
                                  ],
                                )
                            ),
                          ),
                        ),
                      ],
                    ),

                    //Espaço
                    const SizedBox(
                      height: 20,
                    ),

                    //gráfico
                    BarChart(),

                  ],
                ),
              ),
            );
          }
        ),
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: Center(
                child: Image.asset('lib/assets/drawer_logo.png'),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.home),
                title: const Text('Dashboard'),
                //subtitle: Text('Subtitulo Item 1'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Dashboard()),
                  );
                  //Navigator.pop(context);
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.add),
                title: Text('Adicionar Registo'),
                //subtitle: Text('Subtitulo Item 2'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AdicionarScreen()),
                  );
                  //Navigator.pop(context);
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.list),
                title: Text('Listar Registos'),
                //subtitle: Text('Subtitulo Item 3'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ListagemScreen()),
                  );
                  //Navigator.pop(context);
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}