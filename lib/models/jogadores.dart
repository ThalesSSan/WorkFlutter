class Jogador {
  // ignore: non_constant_identifier_names
  final int id_jogador;
  final String name;
  final int equipe;

  Jogador(this.id_jogador, this.name, this.equipe);

  @override
  String toString() {
    return 'Jogador{ id: $id_jogador, name: $name, equipe: $equipe}';
  }
}
