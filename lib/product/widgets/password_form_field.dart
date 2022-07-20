import 'package:flutter/material.dart';

String? formpassword;

class PasswordFormFields extends StatefulWidget {
  PasswordFormFields({Key? key}) : super(key: key);

  @override
  State<PasswordFormFields> createState() => _PasswordFormFieldsState();
}

class _PasswordFormFieldsState extends State<PasswordFormFields> {
  bool _isVisible = true;
  String? password;

  void updateStatus() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: _isVisible ? true : false,
      decoration: InputDecoration(
          labelText: "Password",
          labelStyle: const TextStyle(color: Colors.black87),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          border: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          suffixIcon: IconButton(
            onPressed: () {
              updateStatus();
            },
            icon: Icon(
              _isVisible ? Icons.visibility_off : Icons.visibility,
              color: Colors.grey,
            ),
          )),
      validator: (value) {
        return value!.isEmpty ? "Şifre alanı boş bırakılamaz" : null;
      },
      onSaved: ((newValue) {
        password = newValue;
        formpassword = password;
      }),
    );
  }
}
