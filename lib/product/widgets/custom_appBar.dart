import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget {
  final Function onPressed;
  final Color color;
  CustomAppBar({
    Key? key,
    required this.onPressed,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
            onPressed: onPressed(),
            child: Text("Geri", style: GoogleFonts.crimsonPro(fontSize: 24, fontWeight: FontWeight.bold, color: color))),
        IconButton(onPressed: () {}, icon: Icon(Icons.notifications_none_outlined, color: color)),
      ],
    );
  }
}
