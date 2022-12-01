// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

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
    );
  }
}
