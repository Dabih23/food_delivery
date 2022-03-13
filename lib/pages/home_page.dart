import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        elevation: 0,
        brightness: Brightness.light,
        leading: Icon(null),
        actions: [
          IconButton(onPressed: () {}, 
          icon: Icon(Icons.shopping_basket, color: Colors.grey[800],)
         )
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Доставка', style: TextStyle(color: Colors.grey[80], fontWeight: FontWeight.bold, fontSize: 30),),
                  SizedBox(height: 30,),
                  Container(
                    height: 40,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Categoryy(isActive: true, title: 'Пицца'),
                        Categoryy(isActive: false, title: 'Суши'),
                        Categoryy(isActive: false, title: 'Салаты'),
                        Categoryy(isActive: false, title: 'Десерты'),
                        Categoryy(isActive: false, title: 'Напитки'),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 30,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text('Бесплатная доставка', style: TextStyle(
                color: Colors.grey[80], 
                fontSize: 14,
                fontWeight: FontWeight.w600
              ),),
            ),
            SizedBox(height: 30,),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    ittem(image: 'assets/images/5.jpeg', price: '700', name: 'Пепперони'),
                    ittem(image: 'assets/images/6.jpg', price: '600', name: 'Маргарита'),
                    ittem(image: 'assets/images/7.jpeg', price: '750', name: 'Барбекю'),
                    ittem(image: 'assets/images/8.jpg', price: '700', name: 'Грибная'),
                  ],
                ),
              )
            ),
            SizedBox(height: 50,)
          ],
        ),
      ),
    );
  }

  Widget Categoryy({isActive, title}){
    return AspectRatio(
      aspectRatio: isActive ? 3 : 2.5 / 1,
      child: Container(
        margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: isActive ? Colors.yellow[700] : Colors.yellow[100],
          borderRadius: BorderRadius.circular(50),
        ),
        child: Align(
          child: Text(title, style: TextStyle(
            color: isActive ? Colors.white : Colors.grey[500], 
            fontSize: 15, 
            fontWeight: isActive ? FontWeight.bold : FontWeight.w100),
          ),
        ),
      ),
    );
  }

  Widget ittem({image, price, name}){
    return AspectRatio(
      aspectRatio: 1 / 1.4,
      child: GestureDetector(
        child: Container(
          margin: EdgeInsets.only(right: 35),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover 
            )
          ),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Align(
                  alignment: Alignment.topRight,
                  child: Icon(Icons.favorite, color: Colors.white,),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      
                      child: Row(
                      children: [
                        Text(price , style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Text('рублей' , style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
                        ),
                      ],
                    ),
                    ),
                    SizedBox(height: 5,),
                    Text(name, style: TextStyle(color: Colors.white, fontSize: 20),)
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}