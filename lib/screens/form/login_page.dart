import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sozler_app/product/widgets/password_form_field.dart';
import 'package:sozler_app/screens/form/register_page.dart';

import '../../models/users.dart';
import '../../product/widgets/email_form_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  User user = User(email: "atalhaablak@gmail.com", password: "12345678");
  String? username;
  String? password;
  String? email;

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage("assets/image/background_image.jpeg"),
        fit: BoxFit.cover,
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Giriş Yap Head
                    Text("Giriş Yap", style: GoogleFonts.crimsonPro(fontSize: 46, fontWeight: FontWeight.bold)),
                    SizedBox(height: 40),
                    // Email password textfield
                    _sigInFormFields(),

                    //şifre yenileme textbutton (button -> visible)
                    _forgotPassword(),

                    SizedBox(height: 60),
                    // Giriş Yap Elevated Button
                    Center(child: _signInButton()),
                    // Henüz hesabın yok mu? Kayıt Ol! Row(text + textbutton)
                    _dontHaveAccount(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Form _sigInFormFields() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          EmailFormField(),
          PasswordFormFields(),
        ],
      ),
    );
  }

  Row _forgotPassword() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
            onPressed: () {},
            child: Text(
              "Şifre Yenileme",
              style: GoogleFonts.crimsonPro(
                fontSize: 16,
                color: Colors.purple,
                fontWeight: FontWeight.bold,
              ),
            )),
      ],
    );
  }

  ElevatedButton _signInButton() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            minimumSize: Size(MediaQuery.of(context).size.width * 0.7, 50),
            primary: Colors.purple,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12)))),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();
            if (formemail == user.email && formpassword == user.password) {
              print("Giriş başarılı");
            } else {
              print("Kullanıcı bilgileri eşleşmedi");
            }
          }
        },
        child: Text(
          "Giriş Yap",
          style: GoogleFonts.crimsonPro(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ));
  }

  Row _dontHaveAccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Henüz Hesabın Yok Mu?", style: GoogleFonts.crimsonPro(fontSize: 16, fontWeight: FontWeight.bold)),
        TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterPage()));
            },
            child: Text(
              "Kayıt Ol!",
              style: GoogleFonts.crimsonPro(
                fontSize: 16,
                color: Colors.purple,
                fontWeight: FontWeight.bold,
              ),
            )),
      ],
    );
  }
}
