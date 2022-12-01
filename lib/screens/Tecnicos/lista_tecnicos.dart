import 'package:flutter/material.dart';

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
    );
  }
}
