import 'package:flutter/material.dart';
import 'package:fmarket/urun_detay.dart';

class Kategori extends StatefulWidget {
  final String kategori;

  const Kategori({Key key, this.kategori}) : super(key: key);

  @override
  _KategoriState createState() => _KategoriState();
}

class _KategoriState extends State<Kategori> {

  List<Widget> gosterilecekListe;

  @override
  void initState() {
    super.initState();

    if(widget.kategori=="temel gıda"){
        gosterilecekListe = [
        urunKarti("Zeytinyağı","25 TL","https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSwD5jRMzzLXCzW8cnts3kUwGlBYZtPdF35EQ&usqp=CAU",mevcut: true,),
        urunKarti("Süt","3.5 TL","https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcS33eMXazdg0vPR42TAqHeQgVK4_aaDoukBVQ&usqp=CAU",mevcut: true),
        urunKarti("Yumurta","9 TL","https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQdQ-eKDgeXne2qRbUszQhH4_SqwVwLOcMJTQ&usqp=CAU",mevcut: true),
        urunKarti("Makarna","14 TL","https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRScWhUpfh68RH2IrPwZjwpVMPs6LC3ge55XQ&usqp=CAU",mevcut: true),
        urunKarti("Çay","20 TL","https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTZ2x986_ybwXWaeWA08gYg-AExA1n86uZRFA&usqp=CAU",mevcut: true),
      ];

    }
    else if(widget.kategori=="şekerleme"){
        gosterilecekListe = [
          urunKarti("Çikolatalı Gofret","2 TL","https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcS3VEWY4PtMDIs_oK5RXoj9mC76yf_CvM6-uA&usqp=CAU"),
          urunKarti("Islak Kek","4 TL","https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRU6zyoXYKDXb_fb6wJK75EWMajVycOQ2cvmg&usqp=CAU"),
        
      ];

    }
    else if(widget.kategori=="içecekler"){
        gosterilecekListe = [
          urunKarti("Meyve Suyu","2 TL","https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTu4aWErsDpd0C0eWqebxUFj_RTksqcP9t3xA&usqp=CAU"),
          urunKarti("Su","1 TL","https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcT4Qz4pqa8bwV8iNodncf287Ing_u4Rpu6sFA&usqp=CAU"),
          urunKarti("Soğuk Çay","4 TL","https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQHBjCzK1T5ea-gw0xDj3zHOe1IFdPbX5iCvA&usqp=CAU"),
          urunKarti("Soda","2.5 TL","https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcS1O0unF5VOf3ZkXbfvkf7w48GXJ3vMKZiuSA&usqp=CAU"),

      ];

    }

    else if(widget.kategori=="temizlik"){
        gosterilecekListe = [
          urunKarti("Çamaşır Deterjanı","30 TL","https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQ2iUnoaE-fl4tJ4nXQ2m8KyX4aMPkINurWxg&usqp=CAU"),
          urunKarti("Bulaşık Deterjanı","12 TL","https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQw9eDbjUw2Ow99kk7lvajzEc-u023XO8zoXg&usqp=CAU"),
          urunKarti("Temizlik Bezi","10 TL","https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTP98pZos6hJmDxV13WZrUjLMbJLvai3qUU8A&usqp=CAU"),
      ];

    }



  
  }

  Widget urunKarti(String isim,String fiyat,String resimUrl,{bool mevcut=false}){
    return GestureDetector(
      onTap: (){
        Navigator.push(context,MaterialPageRoute(builder: (context)=>UrunDetay(
          isim: isim,
          fiyat: fiyat,
          resimUrl: resimUrl,
          mevcut: mevcut,
        )));
      },
          child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 4.0,
              spreadRadius: 2.0,
          )
          ]
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Hero(
              tag: resimUrl,
                          child: Container(
                width: 120.0,
                height: 80.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(resimUrl),
                    fit:BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
            SizedBox(height: 8.0,),
            Text(isim,style: TextStyle(fontSize: 14.0,fontWeight: FontWeight.bold,color: Colors.grey,)),
            SizedBox(height: 8.0,),
            Text(fiyat,style: TextStyle(fontSize: 14.0,fontWeight: FontWeight.bold,color: Colors.redAccent,)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 12.0,
      crossAxisSpacing: 12.0,
      padding: EdgeInsets.all(10.0),
      childAspectRatio: 1,
      children: gosterilecekListe,
    );
  }
}
