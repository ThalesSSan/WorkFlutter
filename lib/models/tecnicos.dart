// ignore_for_file: non_constant_identifier_names

class Tecnicos {
  final int id_tecnico;
  final String name;
  final String funcao;
  final int equipe;

  Tecnicos(this.id_tecnico, this.name, this.funcao, this.equipe);

  @override
  String toString() {
    return 'Cidades{ id: $id_tecnico, name: $name, funcao: $funcao, equipe: $equipe}';
  }
}
