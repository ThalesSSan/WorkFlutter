import 'dart:html';

import 'package:ads6/database/app_database.dart';
import 'package:ads6/models/cidades.dart';
import 'package:flutter/material.dart';

class FormularioCidades extends StatefulWidget {
  @override
  State<FormularioCidades> createState() => _FormularioCidades();
}

class _FormularioCidades extends State<FormularioCidades> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    const _tituloAppBar = 'Formulario Cidades';
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(_tituloAppBar),
            Icon(Icons.location_city),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _idController,
              decoration: InputDecoration(labelText: 'ID'),
              style: TextStyle(fontSize: 20.0),
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Nome'),
              style: TextStyle(fontSize: 20.0),
              keyboardType: TextInputType.text,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _timeController,
              decoration: InputDecoration(labelText: 'Time'),
              style: TextStyle(fontSize: 20.0),
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                child: Text(
                  'Adicionar',
                  style: TextStyle(fontSize: 15.0),
                ),
                onPressed: () {
                  final int? id_cidade = int.tryParse(_idController.text);
                  final String name = _nameController.text;
                  final int? time = int.tryParse(_timeController.text);
                  final Cidades newCidade = Cidades(id_cidade!, name, time!);
                  saveCidade(newCidade).then((id) => Navigator.pop(context));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
