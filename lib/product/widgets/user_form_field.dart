import 'package:flutter/material.dart';

String? formuserName;

class UserFormField extends StatefulWidget {
  const UserFormField({Key? key}) : super(key: key);

  @override
  State<UserFormField> createState() => _UserFormFieldState();
}

class _UserFormFieldState extends State<UserFormField> {
  String? username;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        labelText: "Kullanıcı Adı",
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
        return value!.isEmpty ? "Bir kullanıcı adı belirlemelisin." : null;
      },
      onSaved: ((newValue) {
        username = newValue;
        formuserName = username;
      }),
    );
  }
}
