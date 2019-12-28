import 'package:flutter/material.dart';
import 'game.dart';
void main()=>runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: XO_game_changer(),

));

class XO_game_changer extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Game();
  }
}
var firstPlayer;
var secondPlayer;
class _Game extends State<XO_game_changer>{

  var B = false;
  var gameOn = true;


  @override
  Widget build(BuildContext context) {



    // TODO: implement build
    return Scaffold(
      body: new AnimatedContainer(duration: Duration(milliseconds: 200),
        curve: Curves.bounceInOut,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: gameOn? Color(0xffe4efef): Colors.black,
          border: Border.all(width: 1.00, color: Color(0xff707070),),
          boxShadow: [
            BoxShadow(
              offset: Offset(0.00,3.00),
              color: Color(0xffc9baba).withOpacity(0.16),
              blurRadius: 6,
            ),
          ],
        ),
        child: ListView(

          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: <Widget>[

            Padding(padding: EdgeInsets.all(30), child: Image(width:170, height:170,image: AssetImage('assets/ox_ixon.png'),),),
            new Text(
              "Beautiful XO Game",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "Helvetica Neue",
                fontSize: 21,
                color:Color(0xff606060),
              ),
            ),
            new Text(
              "by EAY Team",
              textAlign: TextAlign.end,
              style: TextStyle(
                fontFamily: "Helvetica Neue",
                fontSize: 11,
                color:Color(0xff000000),
              ),
            ),
            SizedBox(height: 20,),
            Padding(padding: EdgeInsets.only(right: 25,left: 25), child: new Container(
              child: Padding(
                padding: EdgeInsets.only(left:10,right: 10,top: 7),
                child: TextField(
                  onSubmitted: (s){

                  },
                  onChanged: (d){
                    setState(() {
                      firstPlayer = d;
                      print(firstPlayer);
                    });
                  },
                  decoration: InputDecoration(
                    alignLabelWithHint: false,
                    hintText: 'First Player Name',
                    border: InputBorder.none,

                  ),
                ),
              ),
              height: 64.00,
              width: 234.00,
              decoration: BoxDecoration(
                color: Color(0xffffffff),
                border: Border.all(width: 1.00, color: Color(0xff707070),), borderRadius: BorderRadius.circular(15.00),
              ),
            ),),
            SizedBox(height: 20,),
            Padding(padding: EdgeInsets.only(left:25,right: 25), child: new Container(
              child: Padding(
                padding: EdgeInsets.only(left:10,right: 10,top: 7),
                child: TextField(
                  onChanged: (d){
                    setState(() {
                      secondPlayer = d;
                      print(secondPlayer);
                    });
                  },
                  decoration: InputDecoration(
                    alignLabelWithHint: false,
                    hintText: 'Second Player Name',
                    border: InputBorder.none,

                  ),
                ),
              ),
              height: 64.00,
              width: 234.00,
              decoration: BoxDecoration(
                color: Color(0xffffffff),
                border: Border.all(width: 1.00, color: Color(0xff707070),), borderRadius: BorderRadius.circular(15.00),
              ),
            ),),
            SizedBox(height: 30,),
            FlatButton(
              child: new Container(
                child: Center(
                  child: new Text(
                    "start the game",
                    style: TextStyle(
                      fontFamily: "Helvetica Neue",
                      fontSize: 21,
                      color:Color(0xffffffff),
                    ),
                  ),
                ),
                height: 63.00,
                width: 203.00,
                decoration: BoxDecoration(
                  color: Color(0xff1d1d1d),
                  border: Border.all(width: 1.00, color: Color(0xffffffff),), borderRadius: BorderRadius.circular(40.00),
                ),
              ),
              onPressed: (){

                Navigator.push(context, MaterialPageRoute(builder: (context)=>Game()));
              },
            ),
            SizedBox(height: 30,),


          ],
        ),
      )
    );
  }
}
/*
* Container(
      //duration: Duration(microseconds: 500),
      //duration: Duration(microseconds: 500),
      decoration: BoxDecoration(
        color:  gameOn? Color(0xffe4efef) : Color(0x00000000),
        border: Border.all(width: 1.00, color: gameOn? Color(0xff707070) : Color(0x00000000),),
        boxShadow: [
          BoxShadow(
            offset: Offset(0.00,3.00),
            color:  gameOn? Color(0xffe4efef) : Color(0x00000000),
            blurRadius: 6,
          ),
        ],
      ),
      child: SafeArea(
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image(
              width:170,
              height: 170,
              image: AssetImage("assets/ox_ixon.png"),
            ),
            SizedBox(height: 20,),
            new Text(
              "Beautiful XO Game \n by EAY Team",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.normal,

                fontSize: 18,
                color:Color(0xff000000),
              ),
            ),

            TextFormField(
              decoration: InputDecoration(
                  hintText: 'Player 1 Name'
              ),
            ),
            //Image.asset(name),
            FlatButton(
              child: Text(" Start The Game ", style: TextStyle(color:  Colors.red)),
              onPressed: (){
                setState(() {

                  gameOn = !gameOn;
                  print(gameOn);
                });
              },
            ),
          ],
        ),
      )
    )
*
* */