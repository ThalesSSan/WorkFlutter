import 'package:ads6/database/app_database.dart';
import 'package:ads6/models/equipes.dart';
import 'package:flutter/material.dart';

import 'formulario_equipe.dart';

const _tituloAppbar = "Lista Equipes";

class ListaEquipes extends StatefulWidget {
  @override
  State<ListaEquipes> createState() => _ListaEquipesState();
}

class _ListaEquipesState extends State<ListaEquipes> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(_tituloAppbar),
            Icon(Icons.person_add),
          ],
        ),
      ),
      body: FutureBuilder(
        initialData: [],
        future: findEquipes(),
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
              final List<Equipes> equipe = snapshot.data as List<Equipes>;
              return ListView.builder(
                itemBuilder: (context, index) {
                  final Equipes equipes = equipe[index];
                  return _ItemEquipes(equipes);
                },
                itemCount: equipe.length,
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
                  builder: (context) => FormularioEquipes(),
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

class _ItemEquipes extends StatelessWidget {
  final Equipes equipes;

  _ItemEquipes(this.equipes);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: ListTile(
        title: Text(
          'ID' + equipes.id_equipe.toString(),
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }
}
