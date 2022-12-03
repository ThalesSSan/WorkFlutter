import 'dart:html';

import 'package:ads6/database/app_database.dart';
import 'package:ads6/models/tecnicos.dart';
import 'package:flutter/material.dart';

class FormularioTecnicos extends StatefulWidget {
  @override
  State<FormularioTecnicos> createState() => _FormularioTecnicos();
}

class _FormularioTecnicos extends State<FormularioTecnicos> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _funcaoController = TextEditingController();
  final TextEditingController _equipeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    const _tituloAppBar = 'Formulario Tecnicos';
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(_tituloAppBar),
            Icon(Icons.person_add_alt),
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
              controller: _funcaoController,
              decoration: InputDecoration(labelText: 'Funcao'),
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
                  final int? id_tecnico = int.tryParse(_idController.text);
                  final String name = _nameController.text;
                  final String funcao = _funcaoController.text;
                  final int? equipe = int.tryParse(_equipeController.text);
                  final Tecnicos newTecnico =
                      Tecnicos(id_tecnico!, name, funcao, equipe!);
                  saveTecnico(newTecnico).then((id) => Navigator.pop(context));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
