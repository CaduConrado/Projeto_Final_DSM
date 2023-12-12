// import 'package:projeto_final/services/user_service.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../models/user.dart';

// class LoginHelper {
//   Future<User?> login(User userI) async {
//     UserService service = UserService();
//     User? user = await service.getUser(userI);
//     if (user != null) {
//       final prefs = await SharedPreferences.getInstance();
//       prefs.setBool('logged', true);
//       prefs.setInt('id', int.parse(user.id.toString()));
//       prefs.setString('email', user.email);
//       print(user.nome);
//       return user;
//     } else {
//       return null;
//     }
//   }
// }
