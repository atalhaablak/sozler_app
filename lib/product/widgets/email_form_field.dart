import 'package:flutter/material.dart';

String? formemail;

class EmailFormField extends StatefulWidget {
  const EmailFormField({Key? key}) : super(key: key);

  @override
  State<EmailFormField> createState() => _EmailFormFieldState();
}

class _EmailFormFieldState extends State<EmailFormField> {
  String? email;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        labelText: "Email",
        labelStyle: TextStyle(color: Colors.black87),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
      validator: (value) {
        return value!.isEmpty ? "Lütfen bir mail adresi girin." : null;
      },
      onSaved: ((newValue) {
        email = newValue;
        formemail = email;
      }),
    );
  }
}
