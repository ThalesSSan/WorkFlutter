import 'package:ads6/database/app_database.dart';
import 'package:ads6/models/cidades.dart';
import 'package:flutter/material.dart';
import 'formulario_cidades.dart';

const _tituloAppbar = 'Lista Cidades';

class ListaCidades extends StatefulWidget {
  @override
  State<ListaCidades> createState() => _ListaCidadesState();
}

class _ListaCidadesState extends State<ListaCidades> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(_tituloAppbar),
            Icon(Icons.location_city),
          ],
        ),
      ),
      body: FutureBuilder(
        initialData: [],
        future: findCidade(),
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
              final List<Cidades> cidade = snapshot.data as List<Cidades>;
              return ListView.builder(
                itemBuilder: (context, index) {
                  final Cidades cidades = cidade[index];
                  return _ItemCidades(cidades);
                },
                itemCount: cidade.length,
              );
          }
          return Text('Error');
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.of(context)
            .push(
              MaterialPageRoute(
                builder: (context) => FormularioCidades(),
              ),
            )
            .then(
              (value) => setState(() {}),
            );
      }),
    );
  }
}

class _ItemCidades extends StatelessWidget {
  final Cidades cidades;

  _ItemCidades(this.cidades);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: ListTile(
        title: Text(
          'ID' + cidades.id_cidade.toString(),
          style: TextStyle(fontSize: 20.0),
        ),
        subtitle: Text(
          'Nome' +
              cidades.name.toString() +
              '\n' +
              'Time' +
              cidades.time.toString(),
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }
}
