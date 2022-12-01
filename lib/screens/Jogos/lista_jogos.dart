import 'package:flutter/material.dart';

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
    );
  }
}
