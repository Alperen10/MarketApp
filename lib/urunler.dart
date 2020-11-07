import 'package:flutter/material.dart';
import 'package:fmarket/kategori.dart';

class Urunler extends StatefulWidget {
  @override
  _UrunlerState createState() => _UrunlerState();
}

class _UrunlerState extends State<Urunler> with SingleTickerProviderStateMixin{

  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController=TabController(length: 4,vsync: this);
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TabBar(
          controller: tabController,
          indicatorColor: Colors.redAccent,
          labelColor: Colors.redAccent,
          unselectedLabelColor: Colors.grey,
          isScrollable: true,
          labelStyle: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w500),
          tabs: [
          Tab(child: Text("Temel Gıda"),),
          Tab(child: Text("Şekerleme"),),
          Tab(child: Text("İçecekler"),),
          Tab(child: Text("Temizlik"),),
          ]
          ),
        Expanded(
          child: TabBarView(
            controller: tabController,
            children: [
              Kategori(kategori: "temel gıda",),
              Kategori(kategori: "şekerleme",),
              Kategori(kategori: "içecekler",),
              Kategori(kategori: "temizlik",),

            ],
          ),
        )
      ],
    );
  }
}