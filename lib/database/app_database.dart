import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> createDatabase() {
  return getDatabasesPath().then(
    (dbPath) {
      final String path = join(dbPath, 'JCBC.db');
      return openDatabase(path, onCreate: ((db, version) {
        db.execute('CREATE TABLE jogo('
            'equipe_casa INTEGER PRIMARY KEY, '
            'equipe_visitante INTEGER PRIMARY KEY, '
            'pontos_casa INTEGER, '
            'pontos_visitantes INTEGER, '
            'data DATE)');
        db.execute('CREATE TABLE equipes('
            'id_equipe INTEGER PRIMARY KEY)');
        db.execute('CREATE TABLE jogador('
            'id_jogador INTEGER PRIMARY KEY, '
            'name TEXT, '
            'equipe INTEGER'
            'FOREIGN KEY (equipe) REFERENCES equipes(id_equipe))');
        db.execute('CREATE TABLE cidades('
            'id_cidade INTEGER PRIMARY KEY, '
            'name TEXT, '
            'time INTEGER'
            'FOREIGN KEY (time) REFERENCES equipes(id_equipe))');
        db.execute('CREATE TABLE tecnicos('
            'id_tecnico INTEGER PRIMARY KEY, '
            'name TEXT, '
            'funcao TEXT'
            'equipe INTEGER'
            'FOREIGN KEY (equipe) REFERENCES equipes(id_equipe))');
      }), version: 1);
    },
  );
}
