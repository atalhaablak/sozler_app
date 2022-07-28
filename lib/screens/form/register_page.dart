import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sozler_app/models/users.dart';
import 'package:sozler_app/product/widgets/email_form_field.dart';
import 'package:sozler_app/product/widgets/password_form_field.dart';
import 'package:sozler_app/product/widgets/user_form_field.dart';
import 'package:sozler_app/screens/form/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController userController = TextEditingController();
  final String imageUrl = "assets/image/person.jpeg";
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/image/backgorund_register.jpeg"),
          fit: BoxFit.cover,
        ),
      ),
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
                    // KAyıt Ol Head
                    Text("Kayıt Ol", style: GoogleFonts.crimsonPro(fontSize: 46, fontWeight: FontWeight.bold)),
                    SizedBox(height: 50),

                    // Circle Avalatar
                    Center(child: AddProfilePhoto(imageUrl: imageUrl)),
                    SizedBox(height: 50),

                    // Kullanıcıd Adı Textfield
                    _createFormFields(),
                    SizedBox(height: 50),

                    // Kayıt Ol Elevated Button
                    _signUpButton(context),

                    // Zaten Hesabın Var mı? Giriş Yap Row(text + tet button)
                    _haveAccount(),
                    SizedBox(height: 50),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Form _createFormFields() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          UserFormField(userController: userController),
          EmailFormField(emailController: emailController),
          PasswordFormFields(passwordController: passwordController),
        ],
      ),
    );
  }

  Center _signUpButton(BuildContext context) {
    return Center(
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              minimumSize: Size(MediaQuery.of(context).size.width * 0.7, 50),
              primary: Colors.purple,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12)))),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
              new User(ad: userController.text, email: emailController.text, password: passwordController.text);
              debugPrint(
                  "kullanıcıadı: ${userController.text}\n email:${emailController.text}\n password: ${passwordController.text}");
            }
          },
          child: Text(
            "Giriş Yap",
            style: GoogleFonts.crimsonPro(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          )),
    );
  }

  Row _haveAccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Zaten Hesabın Var Mı?", style: GoogleFonts.crimsonPro(fontSize: 16, fontWeight: FontWeight.bold)),
        TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
            },
            child: Text(
              "Giriş Yap!",
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

class AddProfilePhoto extends StatelessWidget {
  final String imageUrl;
  const AddProfilePhoto({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.transparent,
      radius: 60.0,
      child: Align(
        alignment: Alignment.bottomRight,
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 23.0,
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.add_circle_outlined,
              color: Colors.purple,
              size: 35,
            ),
          ),
        ),
      ),
      backgroundImage: imageUrl.isNotEmpty ? AssetImage(imageUrl) : null,
    );
  }
}
