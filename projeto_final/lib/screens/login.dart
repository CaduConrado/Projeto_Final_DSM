import 'package:flutter/material.dart';
import 'package:projeto_final/screens/cadastro_user.dart';
import 'package:projeto_final/screens/home_screen.dart';
import 'package:projeto_final/services/user_service.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final UserService _service = UserService();
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
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'E-mail',
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
                          return 'Preenchimento obrigatório!';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 16.0),

                  // Adicionando o campo de entrada de senha
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        labelText: 'Senha',
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
                      obscureText: true, // Para ocultar a senha
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
                      if (_formKey.currentState!.validate()) {
                        // User? user = await _helper.login(
                        //     _emailController.text, _passwordController.text);
                        // if (user != null) {
                        //   Navigator.pushReplacement(
                        //       context,
                        //       MaterialPageRoute(
                        //         builder: (context) => const HomeScreen(),
                        //       ));
                        // } else {
                        //   const snackBar = SnackBar(
                        //     content: Text('Usuário não encontrado!'),
                        //     backgroundColor: Colors.red,
                        //   );
                        //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        // }
                        final logado = await _service.loginUser(
                            _emailController.text, _passwordController.text);
                        if (logado == true) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
                            ),
                          );
                        } else {
                          const snackBar = SnackBar(
                            content: Text('Usuário não encontrado!'),
                            backgroundColor: Colors.red,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
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
                    child: const Text('Login'),
                  ),
                  const SizedBox(height: 16.0),

                  // Adicionando a opção de cadastro
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CadastroUser(),
                            ));
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                      ),
                      child: const Text('Não tem uma conta? Cadastre-se'),
                    ),
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




// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Tela de Login'),
//           backgroundColor: Colors.grey.shade700,
//         ),
//         body: Container(
//           padding: EdgeInsets.all(16.0),
//           color: Colors.grey.shade700,
//           child: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 // Adicionando o campo de entrada de usuário
//                 TextField(
//                   decoration: InputDecoration(
//                     labelText: 'Usuário',
//                     filled: true,
//                     fillColor: Colors.white,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(20.0),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(20.0),
//                       borderSide: BorderSide(
//                         color: Colors.grey.shade700,
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 16.0),

//                 // Adicionando o campo de entrada de senha
//                 TextField(
//                   decoration: InputDecoration(
//                     labelText: 'Senha',
//                     filled: true,
//                     fillColor: Colors.white,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(20.0),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(20.0),
//                       borderSide: BorderSide(
//                         color: Colors.grey.shade700,
//                       ),
//                     ),
//                   ),
//                   obscureText: true, // Para ocultar a senha
//                 ),
//                 SizedBox(height: 24.0),

//                 // Adicionando o botão de login
//                 ElevatedButton(
//                   onPressed: () {
//                     // Lógica de autenticação aqui
//                   },
//                   child: Text('Login'),
//                   style: ElevatedButton.styleFrom(
//                     primary: Color(0xFFD4AF37), // Cor dourada mais suave
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(30.0),
//                     ),
//                     elevation: 8.0, // Grau de profundidade
//                   ),
//                 ),
//                 SizedBox(height: 16.0),

//                 // Adicionando a opção de cadastro
//                 TextButton(
//                   onPressed: () {
//                     // Navegar para a tela de cadastro
//                   },
//                   child: Text('Não tem uma conta? Cadastre-se'),
//                   style: TextButton.styleFrom(
//                     primary: Colors.white,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
