import 'package:flutter/material.dart';
import 'package:food_delivery/pages/home_page.dart';
import 'package:page_transition/page_transition.dart';

class StarterPage extends StatefulWidget {
  @override
  State<StarterPage> createState() => _StarterPageState();
}

class _StarterPageState extends State<StarterPage> with TickerProviderStateMixin{

  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 100)
    );
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onTap(){
    _animationController.forward().then((value) => 
      Navigator.push(context, PageTransition(child: HomePage(), type: PageTransitionType.fade))
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/starter_page.jpg'),
          fit: BoxFit.cover
          )
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            colors: [
              Colors.black.withOpacity(.9),
              Colors.black.withOpacity(.6),
              Colors.black.withOpacity(.2),
            ])
          ),
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Сделайте заказ прямо сейчас', style: TextStyle(color: Colors.grey[300], fontSize: 25, fontWeight: FontWeight.w700),),
                SizedBox(height: 80,),
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(colors: [
                      Colors.orange,
                      Colors.yellow
                    ])
                  ),
                  child: MaterialButton(
                    minWidth: double.infinity,
                    onPressed: () => _onTap(),
                    child: Text('Начать', style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),),
                  )
                ),
                SizedBox(height: 25,),
                Align(
                  child: Text('Работаем быстро и качественно', style: TextStyle(color: Colors.white54,),),
                ),
                SizedBox(height: 15,),
            ],
           ),
          )
        ),
      )
    );
  }
}