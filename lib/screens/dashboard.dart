import 'package:ads6/screens/Equipes/lista_equipe.dart';
import 'package:ads6/screens/Cidades/lista_cidades.dart';
import 'package:ads6/screens/Jogadores/lista_jogador.dart';
import 'package:ads6/screens/Jogos/lista_jogos.dart';
import 'package:ads6/screens/Tecnicos/lista_tecnicos.dart';
import 'package:flutter/material.dart';

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
        children: [
          // Image.network(
          //     'https://the-eshow.com/madrid19/wp-content/uploads/2017/10/logo-santander.jpg')
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
                width: double.maxFinite,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.location_city,
                        size: 30,
                      ),
                      Text(
                        'Lista Cidades',
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ListaEquipes(),
                  ),
                );
              },
              child: Container(
                height: 100,
                width: double.maxFinite,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.person_add,
                        size: 30,
                      ),
                      Text(
                        'Lista Equipes',
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ListaJogadores(),
                  ),
                );
              },
              child: Container(
                height: 100,
                width: double.maxFinite,
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
                        'Lista Jogadores',
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ListaJogos(),
                  ),
                );
              },
              child: Container(
                height: 100,
                width: double.maxFinite,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.games,
                        size: 30,
                      ),
                      Text(
                        'Lista Jogos',
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ListaTecnicos(),
                  ),
                );
              },
              child: Container(
                height: 100,
                width: double.maxFinite,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.person,
                        size: 30,
                      ),
                      Text(
                        'Lista Tecnicos',
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
