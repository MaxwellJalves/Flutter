import 'package:moduloDeAcesso/pessoa.dart';

class Porteiro {
  static int _identificacao = 9991000;
  int _matricula;
  Pessoa p;
  int _turno;
  Porteiro(Pessoa p1, int t) {
    p = p1;
    _matricula = _identificacao;
    _identificacao++;
    var i = (t ?? 0);
    if (i == 1 || i == 2) {
      _turno = i;
    }
  }

  Pessoa get pessoa => p;
  int get matricula => _matricula;

  void listardados() {
    print(' --[Escala Atual]--');
    print(' Nome : ${p.nome}');
    print(' Documento : ${p.documento}');
    print(' Idade : ${p.idade}');
    print(' Matricula : ${_matricula} ');
    print(
        ' turno : ${((_turno == 1) ? 'M' : 'E') == 'E' ? 'TARDE' : 'MANHÃ'} \n');
  }
}
