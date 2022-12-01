import 'package:flutter/material.dart';

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
            Icon(Icons.person_add),
          ],
        ),
      ),
    );
  }
}
