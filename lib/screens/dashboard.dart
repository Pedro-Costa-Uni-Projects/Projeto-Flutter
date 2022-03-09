import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  final String title = "Mini-Projeto CD - Mudar nome";

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  @override
  Widget build(BuildContext context) {
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
                leading: Icon(Icons.add),
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
                title: Text('Listar Registos'),
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