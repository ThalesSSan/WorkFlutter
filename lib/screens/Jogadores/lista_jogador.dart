import 'package:ads6/database/app_database.dart';
import 'package:ads6/models/jogadores.dart';
import 'package:flutter/material.dart';

import 'formulario_jogador.dart';

const _tituloAppbar = 'Lista Jogadores';

class ListaJogadores extends StatefulWidget {
  @override
  State<ListaJogadores> createState() => _ListaJogadoresState();
}

class _ListaJogadoresState extends State<ListaJogadores> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(_tituloAppbar),
            Icon(Icons.people),
          ],
        ),
      ),
      body: FutureBuilder(
        initialData: [],
        future: findJogador(),
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
              final List<Jogador> jogador = snapshot.data as List<Jogador>;
              return ListView.builder(
                itemBuilder: (context, index) {
                  final Jogador jogadores = jogador[index];
                  return _ItemJogadores(jogadores);
                },
                itemCount: jogador.length,
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
                  builder: (context) => FormularioJogadores(),
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

class _ItemJogadores extends StatelessWidget {
  final Jogador jogadores;

  _ItemJogadores(this.jogadores);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: ListTile(
        title: Text(
          'ID' + jogadores.id_jogador.toString(),
          style: TextStyle(fontSize: 20.0),
        ),
        subtitle: Text(
          'Nome' +
              jogadores.name.toString() +
              '\n' +
              'Equipe' +
              jogadores.equipe.toString(),
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }
}
