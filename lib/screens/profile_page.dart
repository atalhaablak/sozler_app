import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sozler_app/models/users.dart';
import 'package:sozler_app/product/widgets/custom_appBar.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(length: _MyTabViews.values.length, vsync: this);
  }

  User user = User(ad: "Esin Altıntaş", email: "esin@gmail.com", password: "987654");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Stack(
                    children: [
                      // AppBar
                      CustomAppBar(onPressed: () {}, color: Colors.white),
                      // Profil fotoğrafı
                      const Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Align(
                          alignment: Alignment.center,
                          child: _ProfilePhoto(photo: "assets/image/person.png"),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),

                  // isim
                  Text("${user.ad}", style: GoogleFonts.crimsonPro(fontSize: 36, fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),

                  // etiket
                  _createHashtag(),
                  SizedBox(height: 10),

                  // PAYLAŞIM TAKİPÇİ TAKİP EDİLEN
                  _createProfileInfo(),
                ],
              ),
            ),
            SizedBox(height: 10),
            // Paylaşımlar Beğeniler Kaydedilenler -> tabbar gibi
            _displayOptions(),
            Container(
              color: Colors.transparent,
              width: MediaQuery.of(context).size.width * 1,
              height: MediaQuery.of(context).size.height * 0.45,
              child: TabBarView(
                controller: _tabController,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: _favoriteCards(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: _favoriteCards(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: _favoriteCards(),
                  ),
                ],
              ),
            ),

            // Liste Halinde Cardlar

            // tabbar
          ],
        ),
      ),
    );
  }

  ListView _favoriteCards() {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: 5,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 30, left: 20, right: 20, top: 10),
          child: _exampleCard(context),
        );
      },
    );
  }

  Container _exampleCard(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.225,
      width: MediaQuery.of(context).size.width * 0.15,
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(blurRadius: 10, color: Colors.black54, blurStyle: BlurStyle.solid)],
        borderRadius: BorderRadius.circular(20),
        color: Colors.yellow,
        image: DecorationImage(fit: BoxFit.cover, image: AssetImage("assets/image/moon.jpeg")),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.favorite, color: Colors.amberAccent[700]),
                Padding(
                  padding: const EdgeInsets.only(bottom: 6.0, left: 2),
                  child: Text(
                    "1.4K",
                    style: GoogleFonts.crimsonPro(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "O KADAR GELİŞ Kİ, İNSANLAR SENİ YENİDEN TANIMAK ZORUNDA KALSIN",
                textAlign: TextAlign.center,
                style: GoogleFonts.crimsonPro(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  "#motivasyon",
                  style: GoogleFonts.crimsonPro(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Stack _displayOptions() {
    return Stack(
      children: [
        Divider(color: Colors.black, thickness: 0.3),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Container(
            child: TabBar(
              controller: _tabController,
              labelColor: Colors.black,
              indicatorColor: Colors.black,
              tabs: [
                Tab(text: "${_MyTabViews.Paylasimlar.name}"),
                Tab(text: "${_MyTabViews.Begeniler.name}"),
                Tab(text: "${_MyTabViews.Kaydedilenler.name}"),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 47),
          child: Divider(color: Colors.black, thickness: 0.3),
        ),
      ],
    );
  }

  Row _createProfileInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Text("267", style: GoogleFonts.crimsonPro(fontSize: 36, fontWeight: FontWeight.bold)),
            Text("paylaşım", style: GoogleFonts.crimsonPro(fontSize: 14)),
          ],
        ),
        Column(
          children: [
            Text("1.413", style: GoogleFonts.crimsonPro(fontSize: 36, fontWeight: FontWeight.bold)),
            Text("takipçi", style: GoogleFonts.crimsonPro(fontSize: 14)),
          ],
        ),
        Column(
          children: [
            Text("1.112", style: GoogleFonts.crimsonPro(fontSize: 36, fontWeight: FontWeight.bold)),
            Text("takip edilen", style: GoogleFonts.crimsonPro(fontSize: 14)),
          ],
        ),
      ],
    );
  }
}

class _ProfilePhoto extends StatelessWidget {
  final String photo;
  const _ProfilePhoto({
    Key? key,
    required this.photo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 120,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.purple),
        color: Colors.transparent,
        image: DecorationImage(image: AssetImage(photo), fit: BoxFit.contain),
      ),
    );
  }
}

class _createHashtag extends StatelessWidget {
  const _createHashtag({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      // içerik nasıl ve nereden gelecek bilmediğim için user modeli ellemeden buraya elle giriyorum
      children: [
        Text("#gerceksevgi", style: GoogleFonts.crimsonPro(fontSize: 12)),
        Text("#motivasyon", style: GoogleFonts.crimsonPro(fontSize: 12)),
        Text("#kararlienerji", style: GoogleFonts.crimsonPro(fontSize: 12)),
      ],
    );
  }
}

enum _MyTabViews { Paylasimlar, Begeniler, Kaydedilenler }
