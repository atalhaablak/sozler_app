// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

String? formuserName;

class UserFormField extends StatefulWidget {
  TextEditingController userController;
  UserFormField({
    Key? key,
    required this.userController,
  }) : super(key: key);

  @override
  State<UserFormField> createState() => _UserFormFieldState();
}

class _UserFormFieldState extends State<UserFormField> {
  String? username;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.userController,
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
