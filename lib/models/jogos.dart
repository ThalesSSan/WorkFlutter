class Jogos {
  final int equipe_casa;
  final int equipe_visitante;
  final int pontos_casa;
  final int pontos_visitantes;
  final String data;

  Jogos(this.equipe_casa, this.equipe_visitante, this.pontos_casa,
      this.pontos_visitantes, this.data);

  @override
  String toString() {
    return 'Jogos{ casa: $equipe_casa, visitantes: $equipe_visitante, pontos casa: $pontos_casa, pontos visitante: $pontos_visitantes, data: $data}';
  }
}
