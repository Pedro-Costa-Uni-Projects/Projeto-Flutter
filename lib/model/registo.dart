class Registo {
  double peso;
  bool alimentacao;
  int nota;
  String observacoes;
  DateTime data = DateTime.now();

  Registo(this.peso, this.alimentacao, this.nota, this.observacoes);

  @override
  String toString() {
    return 'Registo{peso: $peso, alimentacao: $alimentacao, nota: $nota, observacoes: $observacoes, data: $data}';
  }
}