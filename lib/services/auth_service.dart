import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  Future<UserCredential?> signUpUser(String email, String password) async {
    try {
      final userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email, 
        password: password,
      );
      print('Usuário cadastrado com sucesso! UID: ${userCredential.user?.uid}');
      return userCredential;
    } on FirebaseAuthException catch (e) {
      print('Erro ao cadastrar usuário: ${e.message}');
      return null;
    }
  }

  Future<UserCredential?> loginUser(String email, String password) async {
    try {
      final userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email, 
        password: password,
      );
      print('Usuário logado com sucesso! UID: ${userCredential.user?.uid}');
      return userCredential;
    } on FirebaseAuthException catch (e) {
      print('Erro ao logar usuário: ${e.message}');
      return null;
    }
  }

  Future<void> signOutUser() async {
    try {
      await FirebaseAuth.instance.signOut();
      print('Usuário saiu com exito!');
    } catch (e) {
      print('Erro ao deslogar: $e');
    }
  }
}