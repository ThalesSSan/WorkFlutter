import 'package:ads6/database/app_database.dart';
import 'package:flutter/material.dart';

import '../../models/jogos.dart';
import 'formulario_jogos.dart';

const _tituloAppbar = 'Lista Jogos';

class ListaJogos extends StatefulWidget {
  @override
  State<ListaJogos> createState() => _ListaJogosState();
}

class _ListaJogosState extends State<ListaJogos> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(_tituloAppbar),
            Icon(Icons.games),
          ],
        ),
      ),
      body: FutureBuilder(
        initialData: [],
        future: findJogos(),
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
              final List<Jogos> jogo = snapshot.data as List<Jogos>;
              return ListView.builder(
                itemBuilder: (context, index) {
                  final Jogos jogos = jogo[index];
                  return _ItemJogos(jogos);
                },
                itemCount: jogo.length,
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
                  builder: (context) => FormularioJogos(),
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

class _ItemJogos extends StatelessWidget {
  final Jogos jogos;

  _ItemJogos(this.jogos);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: ListTile(
        title: Text(
          'data' + jogos.data.toString(),
          style: TextStyle(fontSize: 20.0),
        ),
        subtitle: Text(
          'Equipe Casa' +
              jogos.equipe_casa.toString() +
              '\n' +
              'Equipe Visitante' +
              jogos.equipe_visitante.toString() +
              '\n' +
              'Pontos Casa' +
              jogos.pontos_casa.toString() +
              '\n' +
              'Pontos Visitante' +
              jogos.pontos_visitantes.toString(),
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }
}
