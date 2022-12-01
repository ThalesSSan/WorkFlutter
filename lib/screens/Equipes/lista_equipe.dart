import 'package:flutter/material.dart';

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
    );
  }
}
