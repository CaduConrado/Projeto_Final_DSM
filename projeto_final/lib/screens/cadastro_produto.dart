import 'package:flutter/material.dart';
import 'package:projeto_final/helpers/user_helper.dart';
import 'package:projeto_final/models/produto.dart';
import 'package:projeto_final/services/produto_service.dart';

class CadastroProduto extends StatefulWidget {
  const CadastroProduto({super.key});

  @override
  State<CadastroProduto> createState() => _CadastroProdutoState();
}

class _CadastroProdutoState extends State<CadastroProduto> {
  final TextEditingController _nomeProdutoController = TextEditingController();
  final TextEditingController _descricaoProdutoController =
      TextEditingController();
  final TextEditingController _precoProdutoController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final ProdutoService _produtoService = ProdutoService();
  final UserHelper _userHelper = UserHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16.0),
        color: Colors.grey.shade700,
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Icon(
                      Icons.local_fire_department_rounded,
                      color: Colors.amber.shade900,
                      size: 100,
                    ),
                  ),
                  // Adicionando o campo de entrada de usuário
                  const SizedBox(height: 16.0),

                  // Adicionando o campo de entrada de senha
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextFormField(
                      controller: _nomeProdutoController,
                      decoration: InputDecoration(
                        labelText: 'Título do Produto',
                        filled: true,
                        fillColor: Colors.grey.shade700,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide(
                            color: Colors.amber.shade900,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Preenchimento obrigatório';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextFormField(
                      controller: _descricaoProdutoController,
                      decoration: InputDecoration(
                        labelText: 'Descrição do Produto',
                        filled: true,
                        fillColor: Colors.grey.shade700,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide(
                            color: Colors.amber.shade900,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Preenchimento obrigatório';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextFormField(
                      controller: _precoProdutoController,
                      decoration: InputDecoration(
                        labelText: 'Preço do Produto',
                        filled: true,
                        fillColor: Colors.grey.shade700,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide(
                            color: Colors.amber.shade900,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Preenchimento obrigatório';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 24.0),

                  // Adicionando o botão de login
                  ElevatedButton(
                    onPressed: () async {
                      FocusScope.of(context).unfocus();
                      if (_formKey.currentState!.validate()) {
                        await _produtoService.novoProduto(
                          Produto(
                            titulo: _nomeProdutoController.text,
                            descricao: _descricaoProdutoController.text,
                            preco: int.parse(_precoProdutoController.text),
                            usuarioId: await _userHelper.getUser(),
                          ),
                        );
                        print('Deu bão');
                        Navigator.pop(context);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          // const Color(0xFFD4AF37), // Cor dourada mais suave
                          Colors.amber.shade900,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      elevation: 8.0, // Grau de profundidade
                    ),
                    child: const Text('Cadastrar'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
