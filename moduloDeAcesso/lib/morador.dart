import 'package:moduloDeAcesso/pessoa.dart';
import 'package:moduloDeAcesso/services/formatdate.dart';

class Morador {
  Pessoa _morador;
  int _bloco;

  final _minutos = FormatDate.minutos(
      DateTime.now().minute.toString(), DateTime.now().minute.toString());

  String get minutos => _minutos;

  Morador(Pessoa p, int bloco, bool fluxo) {
    _morador = p;
    _bloco = bloco;
    // fluxo utilizado para saber se o morador saiu == true ou false se esta fora e quer entrar
    fluxo == true ? registrarSaida() : registrarEntrada();
  }

  int get bloco => _bloco;
  Pessoa get morador => _morador;

  String registrarEntrada() {
    return 'Evento de entrada registrado no dia : ${FormatDate.data()} as ${FormatDate.hora()}:${_minutos}';
  }

  String registrarSaida() {
    return 'Evento de saida registrado no dia : ${FormatDate.data()} as ${int.parse(FormatDate.hora()) - 2}:${_minutos}';
  }

  void informacaoMorador() {
    print('Morador : ${morador.nome} residente no bloco : ${bloco}');
  }
}
