import 'package:flutter/material.dart';

void main() => runApp(const Main());

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const Dashboard(title: 'Mini-Projeto CD - Mudar nome'),
    );
  }
}

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Text("Teste"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: Center(
                child: Text("Teste - Meter Aqui Logo"),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.add),
                title: Text('Item 1'),
                //subtitle: Text('Subtitulo Item 1'),
                onTap: () {
                  /*
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HistoricScreen()),
                  );
                  */
                  Navigator.pop(context);
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.add),
                title: Text('Item 2'),
                //subtitle: Text('Subtitulo Item 2'),
                onTap: () {
                  /*
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HistoricScreen()),
                );
                */
                  Navigator.pop(context);
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.add),
                title: Text('Item 3'),
                //subtitle: Text('Subtitulo Item 3'),
                onTap: () {
                  /*
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HistoricScreen()),
                  );
                  */
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
