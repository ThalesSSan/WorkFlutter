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
      body: FutureBuilder(
        initialData: [],
        future: findCidade(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [CircularProgressIndicator(), Text('Loading')],
              ));
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              final List<Cidades> cidade = snapshot.data as List<Cidades>;
              return ListView.builder(
                itemBuilder: (context, index) {
                  final Cidades cidades = cidade[index];
                  return _ItemCidades(cidades);
                },
                itemCount: cidade.length,
              );
          }
          return Text('Error');
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(
                MaterialPageRoute(
                  builder: (context) => FormularioCidades(),
                ),
              )
              .then(
                (value) => setState(() {}),
              );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class _ItemCidades extends StatelessWidget {
  final Cidades cidades;

  _ItemCidades(this.cidades);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: ListTile(
        title: Text(
          'ID' + cidades.id_cidade.toString(),
          style: TextStyle(fontSize: 20.0),
        ),
        subtitle: Text(
          'Nome' +
              cidades.name.toString() +
              '\n' +
              'Time' +
              cidades.time.toString(),
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }
}
