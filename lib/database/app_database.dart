import 'package:ads6/models/cidades.dart';
import 'package:ads6/models/equipes.dart';
import 'package:ads6/models/jogadores.dart';
import 'package:ads6/models/jogos.dart';
import 'package:ads6/models/tecnicos.dart';
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
            'data TEXT)');
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

Future<int> saveJogos(Jogos jogos) {
  return createDatabase().then((db) {
    final Map<String, dynamic> jogosMap = Map();
    jogosMap['equipe_casa'] = jogos.equipe_casa;
    jogosMap['equipe_visitante'] = jogos.equipe_visitante;
    jogosMap['pontos_casa'] = jogos.pontos_casa;
    jogosMap['pontos_visitantes'] = jogos.pontos_visitantes;
    jogosMap['data'] = jogos.data;
    return db.insert('jogos', jogosMap);
  });
}

Future<int> saveEquipe(Equipes equipes) {
  return createDatabase().then((db) {
    final Map<String, dynamic> equipesMap = Map();
    equipesMap['id_equipe'] = equipes.id_equipe;
    return db.insert('equipes', equipesMap);
  });
}

Future<int> saveJogador(Jogador jogador) {
  return createDatabase().then((db) {
    final Map<String, dynamic> jogadorMap = Map();
    jogadorMap['id_jogador'] = jogador.id_jogador;
    jogadorMap['name'] = jogador.name;
    jogadorMap['equipe'] = jogador.equipe;
    return db.insert('jogador', jogadorMap);
  });
}

Future<int> saveCidade(Cidades cidades) {
  return createDatabase().then((db) {
    final Map<String, dynamic> cidadesMap = Map();
    cidadesMap['id_cidade'] = cidades.id_cidade;
    cidadesMap['name'] = cidades.name;
    cidadesMap['time'] = cidades.time;
    return db.insert('cidade', cidadesMap);
  });
}

Future<int> saveTecnico(Tecnicos tecnicos) {
  return createDatabase().then((db) {
    final Map<String, dynamic> tecnicosMap = Map();
    tecnicosMap['id_tecnico'] = tecnicos.id_tecnico;
    tecnicosMap['name'] = tecnicos.name;
    tecnicosMap['funcao'] = tecnicos.funcao;
    tecnicosMap['equipe'] = tecnicos.equipe;
    return db.insert('tecnico', tecnicosMap);
  });
}

Future<List<Jogos>> findJogos() {
  return createDatabase().then(
    (db) {
      return db.query('Jogos').then(
        (maps) {
          final List<Jogos> jogos = [];
          for (Map<String, dynamic> map in maps) {
            final Jogos jogos = Jogos(
              map['equipe_casa'],
              map['equipe_visitante'],
              map['pontos_casa'],
              map['pontos_visitantes'],
              map['data'],
            );
            jogos.add(jogos);
          }
          return jogos;
        },
      );
    },
  );
}

Future<List<Equipes>> findEquipes() {
  return createDatabase().then(
    (db) {
      return db.query('equipes').then(
        (maps) {
          final List<Equipes> equipes = [];
          for (Map<String, dynamic> map in maps) {
            final Equipes equipes = Equipes(
              map['id_equipe'],
            );
            equipes.add(equipes);
          }
          return equipes;
        },
      );
    },
  );
}

Future<List<Jogador>> findJogador() {
  return createDatabase().then(
    (db) {
      return db.query('Jogador').then(
        (maps) {
          final List<Jogador> jogador = [];
          for (Map<String, dynamic> map in maps) {
            final Jogador jogador = Jogador(
              map['id_jogador'],
              map['name'],
              map['equipe'],
            );
            jogador.add(jogador);
          }
          return jogador;
        },
      );
    },
  );
}

Future<List<Cidades>> findCidade() {
  return createDatabase().then(
    (db) {
      return db.query('Cidades').then(
        (maps) {
          final List<Cidades> cidades = [];
          for (Map<String, dynamic> map in maps) {
            final Cidades cidades = Cidades(
              map['id_cidade'],
              map['name'],
              map['time'],
            );
            cidades.add(cidades);
          }
          return cidades;
        },
      );
    },
  );
}

Future<List<Tecnicos>> findTecnicos() {
  return createDatabase().then(
    (db) {
      return db.query('Tecnicos').then(
        (maps) {
          final List<Tecnicos> tecnicos = [];
          for (Map<String, dynamic> map in maps) {
            final Tecnicos tecnicos = Tecnicos(
              map['id_tecnico'],
              map['name'],
              map['funcao'],
              map['equipe'],
            );
            tecnicos.add(tecnicos);
          }
          return tecnicos;
        },
      );
    },
  );
}
