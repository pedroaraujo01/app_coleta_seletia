import 'package:flutter/material.dart';

class CuponsView extends StatefulWidget {
  const CuponsView({Key? key}) : super(key: key);

  @override
  State<CuponsView> createState() => _CuponsViewViewState();
}

class _CuponsViewViewState extends State<CuponsView> {
  @override
  Widget build(BuildContext context) {
    // to get size
    var size = MediaQuery.of(context).size;

    // style
    var cardTextStyle = const TextStyle(
        fontFamily: "Montserrat Regular",
        fontSize: 16,
        color: Color.fromRGBO(63, 63, 63, 1));

    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        toolbarHeight: 70,
        title: Text("Cupons"),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
              gradient: LinearGradient(
                  colors: [Colors.green,Colors.greenAccent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter
              )
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: ListView.builder(
                itemCount : 1,
                itemBuilder: (context, index) {
                    return const ListTile(
                      leading: CircleAvatar(
                      backgroundImage: AssetImage(
                      'lib/app/imagens/americanas.png'),
                      ),
                      title: Text("10% OFF em qualquer compra do app.",
                      style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black)),
                      subtitle: Text("200 pontos"),
                      );
                  },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
