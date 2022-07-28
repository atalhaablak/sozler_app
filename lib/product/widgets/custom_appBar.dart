import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget {
  final Function onPressed;
  CustomAppBar({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
            onPressed: onPressed(),
            child: Text("Geri", style: GoogleFonts.crimsonPro(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black))),
        IconButton(onPressed: () {}, icon: Icon(Icons.notifications_none_outlined)),
      ],
    );
  }
}
