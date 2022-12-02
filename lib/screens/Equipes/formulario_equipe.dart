import 'dart:html';

import 'package:ads6/database/app_database.dart';
import 'package:ads6/models/equipes.dart';
import 'package:flutter/material.dart';

class FormularioEquipes extends StatefulWidget {
  @override
  State<FormularioEquipes> createState() => _FormularioEquipes();
}

class _FormularioEquipes extends State<FormularioEquipes> {
  final TextEditingController _idController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    const _tituloAppBar = 'Formulario Equipes';
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(_tituloAppBar),
            Icon(Icons.person_add),
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
            child: SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                child: Text(
                  'Adicionar',
                  style: TextStyle(fontSize: 15.0),
                ),
                onPressed: () {
                  final int? id_equipe = int.tryParse(_idController.text);
                  final Equipes newEquipe = Equipes(id_equipe!);
                  saveEquipe(newEquipe).then((id) => Navigator.pop(context));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
