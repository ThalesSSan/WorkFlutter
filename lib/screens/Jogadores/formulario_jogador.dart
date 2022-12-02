import 'dart:html';

import 'package:ads6/database/app_database.dart';
import 'package:ads6/models/jogadores.dart';
import 'package:flutter/material.dart';

class FormularioJogadores extends StatefulWidget {
  @override
  State<FormularioJogadores> createState() => _FormularioJogadores();
}

class _FormularioJogadores extends State<FormularioJogadores> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _equipeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    const _tituloAppBar = 'Formulario Jogadores';
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(_tituloAppBar),
            Icon(Icons.person),
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
              controller: _equipeController,
              decoration: InputDecoration(labelText: 'Equipe'),
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
                  final int? id_jogador = int.tryParse(_idController.text);
                  final String name = _nameController.text;
                  final int? equipe = int.tryParse(_equipeController.text);
                  final Jogador newJogador =
                      Jogador(id_jogador!, name, equipe!);
                  saveJogador(newJogador).then((id) => Navigator.pop(context));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
