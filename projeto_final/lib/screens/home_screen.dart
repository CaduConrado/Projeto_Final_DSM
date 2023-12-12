import 'package:flutter/material.dart';
import 'package:projeto_final/components/produto_card.dart';
import 'package:projeto_final/helpers/produto_helper.dart';
import 'package:projeto_final/screens/cadastro_produto.dart';
import 'package:projeto_final/services/produto_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ProdutoService _produtoService = ProdutoService();

  final ProdutoHelper _produtoHelper = ProdutoHelper();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade700,
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: FutureBuilder(
        future: _produtoService.getProdutos(),
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          if (snapshot.hasData) {
            List produtos = snapshot.data!;
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 1, mainAxisSpacing: 1),
              itemCount: produtos.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  child: ProdutoCard(produto: produtos[index]),
                  onLongPress: () async {
                    final logado = await _produtoService.deleteProduto(
                      _produtoHelper.getProdutoId(produtos[index]),
                    );
                    setState(() {});
                    if (logado == true) {
                      final snackBar = SnackBar(
                        content: Text(
                          'O produto ${_produtoHelper.getProdutoId(produtos[index])} foi removido com sucesso!',
                        ),
                        backgroundColor: Colors.red,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CadastroProduto(),
              ));
          setState(() {});
        },
      ),
    );
  }
}
