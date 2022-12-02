import 'dart:html';

import 'package:ads6/database/app_database.dart';
import 'package:ads6/models/jogos.dart';
import 'package:flutter/material.dart';

class FormularioJogos extends StatefulWidget {
  @override
  State<FormularioJogos> createState() => _FormularioJogos();
}

class _FormularioJogos extends State<FormularioJogos> {
  final TextEditingController _dataController = TextEditingController();
  final TextEditingController _equipecasaController = TextEditingController();
  final TextEditingController _equipevisitanteController =
      TextEditingController();
  final TextEditingController _pontoscasaController = TextEditingController();
  final TextEditingController _pontosvisitanteController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    const _tituloAppBar = 'Formulario Jogos';
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(_tituloAppBar),
            Icon(Icons.games),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _dataController,
              decoration: InputDecoration(labelText: 'Data'),
              style: TextStyle(fontSize: 20.0),
              keyboardType: TextInputType.text,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _equipecasaController,
              decoration: InputDecoration(labelText: 'Equipe Casa'),
              style: TextStyle(fontSize: 20.0),
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _equipevisitanteController,
              decoration: InputDecoration(labelText: 'Equipe Visitante'),
              style: TextStyle(fontSize: 20.0),
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _pontoscasaController,
              decoration: InputDecoration(labelText: 'Pontos Casa'),
              style: TextStyle(fontSize: 20.0),
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _pontosvisitanteController,
              decoration: InputDecoration(labelText: 'Pontos Visitante'),
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
                  final String data = _dataController.text;
                  final int? equipe_casa =
                      int.tryParse(_equipecasaController.text);
                  final int? equipe_visitante =
                      int.tryParse(_equipevisitanteController.text);
                  final int? pontos_casa =
                      int.tryParse(_pontoscasaController.text);
                  final int? pontos_visitantes =
                      int.tryParse(_pontosvisitanteController.text);
                  final Jogos newJogo = Jogos(equipe_casa!, equipe_visitante!,
                      pontos_casa!, pontos_visitantes!, data);
                  saveJogos(newJogo).then((id) => Navigator.pop(context));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
