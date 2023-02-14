import 'package:coffee/view/auth/login/service/login_service.dart';

class AppBarViewModel{
  final LoginService _auth = LoginService();

  Future <void> logout() async{
    await _auth.signOut();
  }
}