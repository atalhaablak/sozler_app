import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EverydayWord extends StatelessWidget {
  const EverydayWord({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/image/aziz-sancar.jpeg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 30),
            child: _pageAppBar(),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.2,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: _writerandWord(),
            ),
          ),
          Positioned(
            bottom: 65,
            width: MediaQuery.of(context).size.width * 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                      width: 3,
                    ),
                  ),
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.favorite,
                        color: Colors.white,
                        size: 50,
                      )),
                ),
                SizedBox(width: 40),
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                      width: 3,
                    ),
                  ),
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.share,
                        color: Colors.white,
                        size: 50,
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Column _writerandWord() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "AZİZ SANCAR",
          style: GoogleFonts.crimsonPro(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 30),
        Text(
          '"Bütün enerjinizi işinize verin.\nBilim öğrenmeye çalışın. Günlük\ndedikodularla, politikalarla\nuğraşmayın."',
          textAlign: TextAlign.start,
          style: GoogleFonts.crimsonPro(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Row _pageAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () {},
          child: Text(
            "Geri",
            style: GoogleFonts.crimsonPro(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.menu,
              color: Colors.purple,
              size: 35,
            ))
      ],
    );
  }
}
