import 'package:flutter/material.dart';

// Importação do http
import 'package:http/http.dart' as http;

// Importação do convert
import 'dart:convert';

// Importação da classe Pessoa
import 'package:crtech/produtos/produto.dart';

// Inicialização
void main() {
  runApp(const MyApp());
}

// Stateless
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blueGrey,
        ),
      ),
      home: const PaginaCadastroProdutos(),
    );
  }
}

// StatefulWidget
class PaginaCadastroProdutos extends StatefulWidget {
  const PaginaCadastroProdutos({super.key});

  @override
  State<StatefulWidget> createState() {
    return ConteudoPagina();
  }
}

// CADASTRAR UM NOVo PRODUTO NA API
Future<void> cadastrarProdutoGamer(String nome, String descricao, double preco,
    int quantidade, String imagem) async {
  // Realizar requisição
  await http.post(Uri.parse('http://localhost:3000/listaGamer'),
      headers: <String, String>{'Content-type': 'application/json'},
      body: jsonEncode(<String, dynamic>{
        'nome': nome,
        'descrição': descricao,
        'preço': preco,
        'quantidade': quantidade,
        'imagem': imagem
      }));
}

// CADASTRAR UM NOVo PRODUTO NA API
Future<void> cadastrarProdutoHardware(String nome, String descricao,
    double preco, int quantidade, String imagem) async {
  // Realizar requisição
  await http.post(Uri.parse('http://localhost:3000/listaDeHardware'),
      headers: <String, String>{'Content-type': 'application/json'},
      body: jsonEncode(<String, dynamic>{
        'nome': nome,
        'descrição': descricao,
        'preço': preco,
        'quantidade': quantidade,
        'imagem': imagem
      }));
}

// DELETAR PRODUTO DA API
Future<void> apagarProduto(int id) async {
  await http.delete(
    Uri.parse('http://localhost:3000/listaDeHardware/$id'),
    headers: <String, String>{'Content-type': 'application/json'},
  );
}

// // CADASTRAR UM NOVo PRODUTO NA API
Future<void> cadastrarProdutoRede(String nome, String descricao, double preco,
    int quantidade, String imagem) async {
  // Realizar requisição
  await http.post(Uri.parse('http://localhost:3000/listaDeRede'),
      headers: <String, String>{'Content-type': 'application/json'},
      body: jsonEncode(<String, dynamic>{
        'nome': nome,
        'descrição': descricao,
        'preço': preco,
        'quantidade': quantidade,
        'imagem': imagem
      }));
}

// SELECIONAR TODOS PRODUTOS GAMER
Future<List<Produto>> selecionarProdutosGamer() async {
  // Realizar a requisição
  var retorno = await http.get(Uri.parse('http://localhost:3000/listaGamer'));

  // Extrair o body do retorno
  var dados = jsonDecode(retorno.body);

  // Lista de pessoas
  List<Produto> produto = [];

  // Laço de repetição
  for (var obj in dados) {
    Produto p = Produto();
    p.id = obj["id"];
    p.nome = obj["nome"];
    p.descricao = obj["descricao"];
    p.preco = obj["preco"];
    p.quantidade = obj["quantidade"];
    p.imagem = obj["imagem"];

    produto.add(p);
  }

  // Retorno
  return produto;
}

// SELECIONAR TODOS PRODUTOS HARDWARE
Future<List<Produto>> selecionarProdutosHardware() async {
  // Realizar a requisição
  var retorno =
      await http.get(Uri.parse('http://localhost:3000/listaDeHardware'));

  // Extrair o body do retorno
  var dados = jsonDecode(retorno.body);

  // Lista de pessoas
  List<Produto> produto = [];

  // Laço de repetição
  for (var obj in dados) {
    Produto p = Produto();
    p.id = obj["id"];
    p.nome = obj["nome"];
    p.descricao = obj["descricao"];
    p.preco = obj["preco"];
    p.quantidade = obj["quantidade"];
    p.imagem = obj["imagem"];

    produto.add(p);
  }

  // Retorno
  return produto;
}

// SELECIONAR TODOS PRODUTOS HARDWARE
Future<List<Produto>> selecionarProdutosRede() async {
  // Realizar a requisição
  var retorno = await http.get(Uri.parse('http://localhost:3000/listaDeRede'));

  // Extrair o body do retorno
  var dados = jsonDecode(retorno.body);

  // Lista de pessoas
  List<Produto> produto = [];

  // Laço de repetição
  for (var obj in dados) {
    Produto p = Produto();
    p.id = obj["id"];
    p.nome = obj["nome"];
    p.descricao = obj["descricao"];
    p.preco = obj["preco"];
    p.quantidade = obj["quantidade"];
    p.imagem = obj["imagem"];

    produto.add(p);
  }

  // Retorno
  return produto;
}

// State
class ConteudoPagina extends State {
  // Variáveis
  String? nome;
  String? descricao;
  double? preco;
  int? quantidade;
  String? imagem;
  int? id;

  // Método de inicialização
  @override
  void initState() {
    // Super
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Text("Cadastro de Produtos"),
      ),
      body: Center(
        child: Column(
          children: [
            // FORMULÁRIO DE CADASTRO
            SizedBox(
              width: 300,
              child: Column(
                children: [
                  // Campo de nome
                  TextField(
                    decoration: const InputDecoration(
                      hintText: 'Digite um Nome',
                    ),
                    onChanged: (valor) {
                      setState(() {
                        nome = valor;
                      });
                    },
                  ),
                  // descrição
                  TextField(
                    decoration: const InputDecoration(
                      hintText: 'Digite uma Descrição',
                    ),
                    onChanged: (valor) {
                      setState(() {
                        descricao = valor;
                      });
                    },
                  ),
                  // preço
                  TextField(
                    decoration: const InputDecoration(
                      hintText: 'Digite um Preço',
                    ),
                    onChanged: (valor) {
                      setState(() {
                        preco = double.tryParse(valor);
                      });
                    },
                  ),
                  // quantidade
                  TextField(
                    decoration: const InputDecoration(
                      hintText: 'Digite uma Quantidade',
                    ),
                    onChanged: (valor) {
                      setState(() {
                        quantidade = int.tryParse(valor);
                      });
                    },
                  ),
                  // imagem
                  TextField(
                    decoration: const InputDecoration(
                      hintText: 'Digite o endereço de uma Imagem',
                    ),
                    onChanged: (valor) {
                      setState(() {
                        imagem = valor;
                      });
                    },
                  ),
                  TextField(
                    decoration: const InputDecoration(
                      hintText: 'Digite o ID',
                    ),
                    onChanged: (valor) {
                      setState(() {
                        id = int.tryParse(valor);
                      });
                    },
                  ),
                  const SizedBox(height: 5),
                  // Botão
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        // Executar o método de cadastro
                        cadastrarProdutoGamer(
                            nome!, descricao!, preco!, quantidade!, imagem!);
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.pink,
                        fixedSize: const Size(210, 20)),
                    child: const Text("Cadastrar Produto Gamer"),
                  ),
                  const SizedBox(height: 5),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        // Executar o método de cadastro
                        cadastrarProdutoRede(
                            nome!, descricao!, preco!, quantidade!, imagem!);
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.pink,
                        fixedSize: const Size(210, 20)),
                    child: const Text("Cadastrar Produto Rede"),
                  ),
                  const SizedBox(height: 5),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        // Executar o método de cadastro
                        cadastrarProdutoHardware(
                            nome!, descricao!, preco!, quantidade!, imagem!);
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.pink,
                        fixedSize: const Size(210, 20)),
                    child: const Text("Cadastrar Produto Hardware"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        // Executar o método de cadastro
                        apagarProduto(id!);
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.pink,
                        fixedSize: const Size(210, 20)),
                    child: const Text("Deletar Produto Hardware"),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),

            // LISTAGEM DE PESSOAS
            Expanded(
              child: FutureBuilder(
                future: selecionarProdutosGamer(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator(); // Mostra um indicador de carregamento enquanto aguarda a resposta da API.
                  }
                  if (snapshot.hasError) {
                    return Text('Erro: ${snapshot.error}');
                  }
                  return ListView.builder(
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          _mostrarDetalhesProduto(
                              context, snapshot.data![index]);
                        },
                        child: Card(
                          child: Column(
                            children: [
                              Text("ID: ${snapshot.data?[index].id}"),
                              Text("Nome: ${snapshot.data?[index].nome}"),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            // LISTAGEM DE REDE
            // LISTAGEM DE PESSOAS
            Expanded(
              child: FutureBuilder(
                future: selecionarProdutosRede(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator(); // Mostra um indicador de carregamento enquanto aguarda a resposta da API.
                  }
                  if (snapshot.hasError) {
                    return Text('Erro: ${snapshot.error}');
                  }
                  return ListView.builder(
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          _mostrarDetalhesProduto(
                              context, snapshot.data![index]);
                        },
                        child: Card(
                          child: Column(
                            children: [
                              Text("ID: ${snapshot.data?[index].id}"),
                              Text("Nome: ${snapshot.data?[index].nome}"),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            // LISTAGEM DE HARDWARE
            Expanded(
              child: FutureBuilder(
                future: selecionarProdutosHardware(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator(); // Mostra um indicador de carregamento enquanto aguarda a resposta da API.
                  }
                  if (snapshot.hasError) {
                    return Text('Erro: ${snapshot.error}');
                  }
                  return ListView.builder(
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          _mostrarDetalhesProduto(
                              context, snapshot.data![index]);
                        },
                        child: Card(
                          child: Column(
                            children: [
                              Text("ID: ${snapshot.data?[index].id}"),
                              Text("Nome: ${snapshot.data?[index].nome}"),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _mostrarDetalhesProduto(BuildContext context, Produto produto) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Detalhes do Produto"),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("ID: ${produto.id}"),
              Text("Nome: ${produto.nome}"),
              Text("Descrição: ${produto.descricao}"),
              Text("Preço: ${produto.preco?.toStringAsFixed(2)}"),
              Text("Quantidade: ${produto.quantidade}"),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Fechar"),
            ),
          ],
        );
      },
    );
  }
}

