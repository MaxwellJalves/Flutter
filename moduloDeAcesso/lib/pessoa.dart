class Pessoa {
  Pessoa(String n, String d, int anoNascimento) {
    _nome = n;
    _documento = d;
    _anonascimento = (DateTime.now().year.toInt() - anoNascimento);
  }

  String _nome;
  String _documento;
  int _anonascimento;
  String _tpsexo;

  dynamic get nome => _nome;
  String get documento => _documento;
  int get idade => _anonascimento;
  String get sexo => _tpsexo;
}
