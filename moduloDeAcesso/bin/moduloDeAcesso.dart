import 'package:moduloDeAcesso/morador.dart';
import 'package:moduloDeAcesso/pessoa.dart';
import 'package:moduloDeAcesso/porteiro.dart';

void main() {
  var p1 = Pessoa('Maxwell', 'RG', 1990);
  var porteiro1 = Porteiro(p1, 1);

  var p2 = Pessoa('Jose Ribeiro', 'CPF', 1960);
  var porteiro2 = Porteiro(p2, null);

  var morador1 = Pessoa('Ana Beatriz', 'CPF', 1992);
  var condomino = Morador(morador1, 24, false);

  var morador2 = Pessoa('Maria Cicera', 'RG', 1070);
  var entradaCondominio = Morador(morador2, 12, false);
  /*
  print('-----------------');
  porteiro1.listardados();
  porteiro2.listardados();
  print('-----------------');
  condomino.informacaoMorador();
  print(condomino.registrarEntrada());
  print(condomino.registrarSaida());
  print('-----------------');
  entradaCondominio.informacaoMorador();
  print(entradaCondominio.registrarEntrada());
  print(entradaCondominio.registrarSaida());
  */
  var moradores = List<Pessoa>();
  moradores.add(Pessoa('JOSE ALBERTO', 'CPF', 1930));
  moradores.add(Pessoa('MARIA  CECILIA', 'CPF', 1987));
  moradores.add(Pessoa('DEIVON LINS', 'RG', 2011));
  moradores.add(Pessoa('ANTONIO GOES', 'CPF', 2002));
  moradores.forEach((v) => print('Moradores Localizados : ${v.nome}'));

  var entrada = List<Morador>();
  entrada.add(Morador(moradores[0], 20, true));
  entrada.add(Morador(moradores[1], 21, true));
  entrada.add(Morador(moradores[2], 20, true));
  entrada.add(Morador(moradores[3], 21, true));
  entrada[0].informacaoMorador();

  for (Morador m in entrada) {
    if (m.morador.nome.toString().contains('JOSE ALBERTO')) {
      print('Verificamos que existe uma entrega para você.');
      print('finalizando ocorrencia...');
    }
    if (m.morador.nome.toString().contains('DEIVON LINS')) {
      print(
          'Prezado! ${m.morador.nome} \ninformamos que existe um boleto do condominio em aberto.');
    }
    if (m.bloco == 21) {
      print(
          'Sr.ª  ${m.morador.nome} - Lembramos que no dia 03 teremos reunião com todos do seu bloco');
    }
  }
}
