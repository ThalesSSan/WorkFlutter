import 'package:ads6/database/app_database.dart';
import 'package:ads6/models/tecnicos.dart';
import 'package:flutter/material.dart';

import 'formulario_tecnicos.dart';

const _tituloAppbar = 'Lista Tecnicos';

class ListaTecnicos extends StatefulWidget {
  @override
  State<ListaTecnicos> createState() => _ListaTecnicosState();
}

class _ListaTecnicosState extends State<ListaTecnicos> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(_tituloAppbar),
            Icon(Icons.person_add_alt),
          ],
        ),
      ),
      body: FutureBuilder(
        initialData: [],
        future: findTecnicos(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [CircularProgressIndicator(), Text('Loading')],
              ));
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              final List<Tecnicos> tecnico = snapshot.data as List<Tecnicos>;
              return ListView.builder(
                itemBuilder: (context, index) {
                  final Tecnicos tecnicos = tecnico[index];
                  return _ItemTecnicos(tecnicos);
                },
                itemCount: tecnico.length,
              );
          }
          return Text('Error');
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(
                MaterialPageRoute(
                  builder: (context) => FormularioTecnicos(),
                ),
              )
              .then(
                (value) => setState(() {}),
              );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class _ItemTecnicos extends StatelessWidget {
  final Tecnicos tecnicos;

  _ItemTecnicos(this.tecnicos);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: ListTile(
        title: Text(
          'ID' + tecnicos.id_tecnico.toString(),
          style: TextStyle(fontSize: 20.0),
        ),
        subtitle: Text(
          'Nome' +
              tecnicos.name.toString() +
              '\n' +
              'Funcao' +
              tecnicos.funcao.toString() +
              '\n' +
              'Equipe' +
              tecnicos.equipe.toString(),
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }
}
