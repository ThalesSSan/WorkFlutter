class Cidades {
  final int id_cidade;
  final String name;
  final int time;

  Cidades(this.id_cidade, this.name, this.time);

  @override
  String toString() {
    return 'Cidades{ id: $id_cidade, name: $name, time: $time}';
  }
}
