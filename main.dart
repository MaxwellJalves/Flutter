import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(appHome());
}

class appHome extends StatelessWidget {
  final String _titulo = 'Banco Digital';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _titulo,
      home: FormPrincipal(),
      //FormTransacoes(),
      //FormPrincipal(),
      debugShowCheckedModeBanner: false,
      //Adicionado o builder dentro do Material para resolver o problema do retorno das transações para o usuario , dessa forma
      // as mensagens são menos custosas para aplicação
      builder: (context, child) {
        return Scaffold(
          body: child,
        );
      },
    );
  }
}

class FormPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Transações Realizadas')),
        leading: Icon(Icons.monetization_on_outlined),
        backgroundColor: Colors.purple,
      ),
      body: Column(
        children: <Widget>[
          ListaDeItems(
            cliente: 'Antonio Silveira',
            valorTransferencia: 250.12,
          ),
          ListaDeItems(
            cliente: 'Bernardo Fonseca',
            valorTransferencia: 345.20,
          ),
          ListaDeItems(
            cliente: 'Ana Beatriz ',
            valorTransferencia: 456.12,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        child: Icon(Icons.add_box_rounded),
        onPressed: () {
          final Future<ListaDeItems> futuro = Navigator.push(context,
              MaterialPageRoute(builder: (context) => FormTransacoes()));
          futuro.then((lista) {
            Scaffold.of(context).showSnackBar(SnackBar(content: lista));
          });
        },
      ),
    );
  }
}

class FormTransacoes extends StatelessWidget {
  final TextEditingController campo1 = TextEditingController();
  final TextEditingController _saldo = TextEditingController();
  final TextEditingController _saque = TextEditingController();
  EditorDeTexto ed = EditorDeTexto();

  @override
  Widget build(BuildContext context) {
    const String _limite = '600.00';
    const String _saldoDisp = '200.00';
    const String _saqueInicial = '000.00';

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Conta Digital')),

        //leading: Icon(Icons.account_balance_wallet_rounded),
        backgroundColor: Colors.purple,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: EditorDeTexto(
              dica: 'Limite de Saque diario',
              valordocampo: _limite,
              icone: Icons.monetization_on,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(40.0, 20.0, 40.0, 8.0),
            child: Column(
              children: [
                EditorDeTexto(
                  controladorEdit: _saldo,
                  dica: 'Saldo Disponivel',
                  valordocampo: _saldoDisp,
                  icone: Icons.monetization_on,
                ),
                EditorDeTexto(
                  controladorEdit: _saque,
                  dica: 'Inform o valor para saque.',
                  valordocampo: _saqueInicial,
                  icone: Icons.monetization_on,
                ),
              ],
            ),
          ),
          RaisedButton(
            child: Text('Confirmar'),
            onPressed: () {
              FncRecebeTransacao(_saldo.text, _saque.text);
              String w = FncRecebeTransacao(_saldo.text, _saque.text);
              final retorno = ListaDeItems(
                  cliente: 'novo',
                  valorTransferencia: (double.tryParse(_saldo.text) -
                      double.tryParse(_saque.text)));
              debugPrint('retorno = ${retorno.toString()}');
              Navigator.pop(context, retorno);
              // Scaffold.of(context).showSnackBar(
              //   SnackBar(
              //     content: Text('Retorno $w'),
              //   ),
              // );
            },
            color: Colors.purple,
            textColor: Colors.white,
          )
        ],
      ),
    );
  }
}

String FncRecebeTransacao(String psaldo, String pvalor) {
//  final snack = GlobalKey<ScaffoldState>();
  double sd = double.tryParse(psaldo);
  double vl = double.tryParse(pvalor);

  String condicao = (vl > sd)
      ? 'Você não possue esse valor na conta.'
      : ' Saldo : $psaldo   Valor do Saque $pvalor  Saldo Atual :RS ${sd - vl}';
  return condicao;
}

class ListaDeItems extends StatelessWidget {
  var cliente = 'Cliente';
  var valorTransferencia = 150.20;

  ListaDeItems({this.cliente, this.valorTransferencia});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text('Titular da Conta :   ${cliente}'),
        subtitle: Text(
            'Valor Transferido:RS  ${valorTransferencia.toString().length <= 5 ? valorTransferencia.toString() + '0' : valorTransferencia}  '),
        //${cliente.conta}   ${cliente.saldo}
      ),
    );
  }
}

class EditorDeTexto extends StatelessWidget {
  final String valordocampo;
  final String dica;
  final IconData icone;
  final TextEditingController controladorEdit;

  EditorDeTexto(
      {this.controladorEdit, this.valordocampo, this.dica, this.icone});

  get valorInformaco => valordocampo;

  get con => controladorEdit.text;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controladorEdit,
      decoration: InputDecoration(
        icon: Icon(icone != null ? Icons.monetization_on_outlined : null),
        hintText: valordocampo,
        helperText: dica,
      ),
      keyboardType: TextInputType.number,
    );
  }
}
