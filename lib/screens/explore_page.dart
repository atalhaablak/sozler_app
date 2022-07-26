import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              // AppBar Sağda Geri Solda Zil
              _pageAppBar(),
              SizedBox(height: 30),
              // Keşfet başlığı yanında filtrele butonu
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: _exploreHead(context),
              ),
              SizedBox(height: 30),
              // Ekranın Ortasında Card
              _customCardPost(),
              SizedBox(height: 30),
              // Tabbar
            ],
          ),
        ),
      ),
    );
  }

  Row _exploreHead(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Keşfet", style: GoogleFonts.crimsonPro(fontSize: 36, fontWeight: FontWeight.bold)),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(MediaQuery.of(context).size.width * 0.1, 30),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              primary: Colors.purple,
            ),
            onPressed: () {},
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Icon(
                Icons.filter_list,
                size: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text("Filtrele", style: GoogleFonts.crimsonPro(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ])),
      ],
    );
  }

  Row _pageAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
            onPressed: () {},
            child: Text("Geri", style: GoogleFonts.crimsonPro(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black))),
        IconButton(onPressed: () {}, icon: Icon(Icons.notifications_none_outlined)),
      ],
    );
  }
}

class _customCardPost extends StatelessWidget {
  const _customCardPost({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.62,
            width: MediaQuery.of(context).size.width * 0.8,
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    boxShadow: [BoxShadow(blurRadius: 5, color: Colors.black45)],
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                      image: AssetImage("assets/image/moon.jpeg"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, top: 15.0),
                  child: Row(
                    children: [
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.purple),
                          color: Colors.transparent,
                          image: DecorationImage(image: AssetImage("assets/image/person.png"), fit: BoxFit.contain),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Samed Aydın",
                            style: GoogleFonts.crimsonPro(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            )),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  child: Container(
                    color: Colors.transparent,
                    width: MediaQuery.of(context).size.width * 0.65,
                    height: MediaQuery.of(context).size.height * 0.40,
                    child: Center(
                      child: Text(
                        "Arkamda bıraktığım köprüleri yıkarım ki ilerlemekten başka çarem kalmasın",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.crimsonPro(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  bottom: 65,
                  left: 30,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: -5,
          right: 50,
          child: ElevatedButton(
            onPressed: () {},
            child: Icon(Icons.bookmark_border),
            style: ElevatedButton.styleFrom(primary: Colors.purple),
          ),
        ),
      ],
    );
  }
}
