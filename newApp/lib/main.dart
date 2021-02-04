import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //  widget Raiz da aplicação
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Cash pick'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Contato> contato = [];

  @override
  void initState() {
    super.initState();
    contato.add(new Contato(
        nome: "Maxwell Costa",
        telefone: "81985306018",
        tipo: ContatoType.CASA));

    contato.add(new Contato(
        nome: "Avohay Mv", telefone: "993898923", tipo: ContatoType.TRABALHO));
    contato.add(new Contato(
        nome: "Elias  MV", telefone: "998477384", tipo: ContatoType.TRABALHO));
    contato.add(new Contato(
        nome: "Dellanio MV", telefone: "34343434", tipo: ContatoType.TRABALHO));
    contato.add(new Contato(
        nome: "Rafael MV", telefone: "983894859", tipo: ContatoType.TRABALHO));
    contato.add(new Contato(
        nome: "Adriando", telefone: "985658845", tipo: ContatoType.CELULAR));
    contato.add(new Contato(
        nome: "Andreza", telefone: "985658845", tipo: ContatoType.CELULAR));
    contato.add(new Contato(
        nome: "Ana Beatriz",
        telefone: "985658845",
        tipo: ContatoType.FAVORITO));
    contato.add(new Contato(
        nome: "Sophia ", telefone: "985658845", tipo: ContatoType.FAVORITO));
    //Ordenando contatos por ordem alfabetica
    contato.sort((a, b) => a.nome.compareTo(b.nome));
  }

  /**
   * Este método é reexecutado sempre que o Estado definido é chamado, por exemplo,
   *  como feito pelo método _incrementCounter acima.
   * A estrutura flutter foi otimizada para fazer métodos de construção de reprise
   * rápido, para que você possa apenas reconstruir qualquer coisa que precisa de atualização bastante
  * do que ter que mudar individualmente instâncias de widgets.
  */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //Item count necessita de uma lista
        body: ListView.separated(
            itemBuilder: (context, index) {
              var contatos = contato[index];
              return ListTile(
                  //Incluindo um icone a esquerda
                  leading: CircleAvatar(
                    child: ContatoHelper.getIconByContatoType(contatos.tipo),
                    backgroundColor: Colors.purple[900],
                  ),
                  title: Text(contatos.nome),
                  subtitle: Text(contatos.telefone),
                  trailing: IconButton(
                      icon: Icon(Icons.call, color: Colors.green[600]),
                      onPressed: () => {}));
              //Container(child: Text(contato.length.toString()));
            },
            separatorBuilder: (context, index) => Divider(),
            itemCount: contato.length));
  }
}

class Contato {
  final String nome;
  final String telefone;
  final ContatoType tipo;

  Contato({@required this.nome, @required this.telefone, @required this.tipo});
}

enum ContatoType { CELULAR, TRABALHO, FAVORITO, CASA }

class ContatoHelper {
  static Icon getIconByContatoType(ContatoType tipo) {
    switch (tipo) {
      case ContatoType.CASA:
        return Icon(Icons.home, color: Colors.orange[200]);
      case ContatoType.TRABALHO:
        return Icon(Icons.work, color: Colors.teal[300]);
      case ContatoType.CELULAR:
        return Icon(Icons.phone, color: Colors.green[50]);
      case ContatoType.FAVORITO:
        return Icon(Icons.favorite, color: Colors.yellow[600]);
    }
  }
}
