import 'package:flutter/material.dart';
import 'package:fmarket/sepetim.dart';
import 'package:fmarket/urunler.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Market Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Anasayfa(),
    );
  }
}

class Anasayfa extends StatefulWidget{
  @override
  _AnasayfaState createState()=>_AnasayfaState();

}

class _AnasayfaState extends State<Anasayfa>{

  int _aktifIcerikNo = 0;

  List<Widget> _icerikler;

  @override
  void initState() {

    super.initState();

    _icerikler=[
      Urunler(),
      Sepetim(),

    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color:Colors.redAccent),
        elevation: 0.0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "AA Market",
          style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color: Colors.grey),
        ),
      ),
      body: _icerikler[_aktifIcerikNo],
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.all(0.0),
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Good Boy"),
              accountEmail: Text("goodboy123@gmail.com"),
              currentAccountPicture: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRDkjFkG12QYX1njngNtmY0ls9UCCg6Ds6ToA&usqp=CAU"),
                    fit: BoxFit.cover
                    ),
                    borderRadius: BorderRadius.circular(50.0),
                ),
              ),
              decoration: BoxDecoration(color:Colors.redAccent),
              ),
              ListTile(title: Text("Siparişlerim"),onTap: (){},),
              ListTile(title: Text("İndirimlerim"),onTap: (){},),
              ListTile(title: Text("Ayarlar"),onTap: (){},),
              ListTile(title: Text("Çıkış Yap"),onTap: (){Navigator.pop(context);},),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _aktifIcerikNo,
        selectedItemColor: Colors.redAccent,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),title:Text("Ürünler")),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),title:Text("Sepetim")) 
        ],
        onTap: (int tiklananButonPozisyonNo){
          setState(() {
            _aktifIcerikNo=tiklananButonPozisyonNo;
          });
        },
        ),
    );

  }

}

