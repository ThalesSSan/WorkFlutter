import 'package:flutter/material.dart';

import 'Cidades/lista_cidades.dart';
import 'Equipes/lista_equipe.dart';
import 'Jogadores/lista_jogador.dart';
import 'Jogos/lista_jogos.dart';
import 'Tecnicos/lista_tecnicos.dart';

const _tituloAppBar = 'Dashboard';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(_tituloAppBar),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image.network(
          //     'https://the-eshow.com/madrid19/wp-content/uploads/2017/10/logo-santander.jpg')
          Padding(
            padding: const EdgeInsets.all(8.0),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ListaCidades(),
                  ),
                );
              },
              child: Container(
                height: 100,
                width: 150,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.people,
                        size: 30,
                      ),
                      Text(
                        'Teste',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
