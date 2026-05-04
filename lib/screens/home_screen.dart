import 'package:auth_flutter/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../services/auth_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void handleSignOut() async {
    final service = AuthService();
    await service.signOutUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                colors: [
                  Color.fromARGB(255, 58, 218, 210),
                  Color.fromARGB(255, 77, 69, 190),
                ],
              ),
            ),
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.all(16),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Bem vindo',
                            style: GoogleFonts.sourceCodePro(
                              color: Colors.white,
                              fontSize: 24,
                            ),
                          ),
                          Spacer(),
                          SizedBox(
                            child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.black,
                              ),
                              onPressed: () {
                                handleSignOut();
                                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                              }, 
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.person,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    'Sair',
                                    style: GoogleFonts.sourceCodePro(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
        ),
      ),
    );
  }
}