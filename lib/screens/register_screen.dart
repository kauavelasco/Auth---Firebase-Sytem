import 'package:auth_flutter/screens/home_screen.dart';
import 'package:auth_flutter/screens/login_screen.dart';
import 'package:auth_flutter/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obscurePassword = true;

  void handleRegister() async {
    if (!_formKey.currentState!.validate()) return;

    final service = AuthService();
    final userCredential = await service.signUpUser(
      _emailController.text.trim(), 
      _passwordController.text.trim(),
    );

    if (userCredential != null) {
      Navigator.pushReplacement(
        context, 
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Cadastro realizado com sucesso!',
            style: GoogleFonts.sourceCodePro(
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Erro ao cadastrar. Verifique o console.',
            style: GoogleFonts.sourceCodePro(
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
        ),
      );
    }
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
                width: double.infinity,
                padding: EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Auth - System',
                      style: GoogleFonts.sourceCodePro(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 30),
                    Icon(
                      Icons.app_registration_rounded,
                      size: 200,
                      color: Colors.white,
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if(value == null || value.isEmpty) {
                                  return 'Por favor preencha esse campo';
                                }
                                return null;
                              },
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              decoration: InputDecoration(
                                labelText: 'Email',
                                labelStyle: GoogleFonts.sourceCodePro(
                                  color: Colors.white,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white, width: 1.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white, width: 2.0),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            TextFormField(
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if(value == null || value.isEmpty) {
                                  return 'Por favor preencha esse campo';
                                } else if(value.trim().length <= 6) {
                                  return 'A senha deve ter mais de 6 caractéres';
                                }
                                return null;
                              },
                              controller: _passwordController,
                              obscureText: _obscurePassword,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              decoration: InputDecoration(
                                labelText: 'Password',
                                labelStyle: GoogleFonts.sourceCodePro(
                                  color: Colors.white,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white, width: 1.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white, width: 2.0),
                                ),
                                suffixIcon: GestureDetector(
                                  onTapDown: (_) {
                                    setState(() {
                                      _obscurePassword = false;
                                    });
                                  },
                                  onTapUp: (_) {
                                    setState(() {
                                      _obscurePassword = true;
                                    });
                                  },
                                  onTapCancel: () {
                                    setState(() {
                                      _obscurePassword = true;
                                    });
                                  },
                                  child: AnimatedSwitcher(
                                    duration: Duration(microseconds: 200),
                                    child: Icon(
                                      _obscurePassword ? Icons.visibility_off : Icons.visibility,
                                      key: ValueKey<bool>(_obscurePassword),
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            SizedBox(
                              width: double.infinity,
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                                onPressed: () {
                                  if(_formKey.currentState!.validate()) {
                                    _formKey.currentState!.save();
                                    if(_emailController.text.trim().isEmpty) return;
                                    if(_passwordController.text.trim().isEmpty) return;
                                    handleRegister();
                                  }
                                },
                                child: Text(
                                  'Sign Up',
                                  style: GoogleFonts.sourceCodePro(
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Already have an account? => ",
                                  style: GoogleFonts.sourceCodePro(
                                    color: Colors.white,
                                  ),
                                ),
                                TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: null,
                                  ),
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                                  }, 
                                  child: Text(
                                    'Login',
                                    style: GoogleFonts.sourceCodePro(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
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