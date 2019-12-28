import 'package:flutter/material.dart';
import 'dart:math';
import 'main.dart';
class Game extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Game();
  }
}

class _Game extends State<Game>{




  var firstPlayerName = firstPlayer ;
  var firstPlayerMotivation = ' I am Alyaws The Winner';
  var secondPlayerName = secondPlayer ;
  var secondPlayerMotivation = 'No Way To lose';

  var b = false;
  var clicked = [false,false,false,false,false,false,false,false,false];
  var text =["","","","","","","","",""];
  var winner = "noone";
   ShowWinner(BuildContext context){


  return showDialog(context: context,builder: (context){
    return AlertDialog(title: Text("the winner is"),
      content: Text(winner),
      actions: <Widget>[
        FlatButton(child: Text("Done!"), onPressed: (){
          Navigator.pop(context);
        },)
      ],
    );
  });
  }

  bool BlockedGame(){
    var f = true;
    for(int i = 0 ; i<9 ;i++){
      if(!clicked[i]) f=false;

    }
    return f;

  }

  int getWinner(){
    if(text[0]=="x"&&text[1]=="x"&&text[2]=="x"|| text[3]=="x"&&text[4]=="x"&&text[5]=="x"||text[6]=="x"&&text[7]=="x"&&text[8]=="x"||text[0]=="x"&&text[3]=="x"&&text[6]=="x"||text[1]=="x"&&text[4]=="x"&&text[7]=="x"||
        text[2]=="x"&&text[5]=="x"&&text[8]=="x"||text[0]=="x"&&text[4]=="x"&&text[8]=="x"||
        text[2]=="x"&&text[4]=="x"&&text[6]=="x") {
      print("winner is 2");
      return 2;
    }
    else if(text[0]=="o"&&text[1]=="o"&&text[2]=="o"|| text[3]=="o"&&text[4]=="o"&&text[5]=="o"||text[6]=="o"&&text[7]=="o"&&text[8]=="o"||
        text[0]=="o"&&text[3]=="o"&&text[6]=="o"||text[1]=="o"&&text[4]=="o"&&text[7]=="o"||text[2]=="o"&&text[5]=="o"&&text[8]=="o"||
        text[0]=="o"&&text[4]=="o"&&text[8]=="o"||text[2]=="o"&&text[4]=="o"&&text[6]=="o") {
      print("winner is 1");
      return 1;
    }else
      {

        return 0;
      }
  }


  Color getColor(int x){
    if(text[x] == "o") return Color(0xffff4d4d);
    else return Color(0xff31EA5C);
  }

  void clickButton (int btnNum ){

      if(!clicked[btnNum]){

                       if (!b) {
                         clicked[btnNum] = true;
                         text[btnNum] = "x";
                         b=!b;
                       } else {
                         clicked[btnNum] = true;
                         text[btnNum] = "o";
                         b=!b;
                       }
                       if(getWinner()==1 || getWinner() ==2){
                         winner = getWinner().toString();
                         ShowWinner(context);
                         clicked = [true,true,true,true,true,true,true,true,true];
                       }
                     }

  }
  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return new Scaffold(
      body:  AnimatedContainer(

        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              // Header Of The Game .... First Player Profile
              Padding(padding: EdgeInsets.all(15), child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      new Container(
                        height: 97.00,
                        width: 97.00,
                        decoration: BoxDecoration(
                          color: Color(0xff39e8e8),
                          shape: BoxShape.circle,
                        ),
                      ),
                      new Container(
                        height: 97.00,
                        width: 97.00,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/iconfinder_profile-filled_299075.png"),
                          ),
                          shape: BoxShape.circle,
                        ),
                      ),


                    ],
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(firstPlayerName,style: TextStyle(fontSize: 18, fontFamily: 'Roboto',color: BlockedGame()? Colors.white:Colors.black),textAlign: TextAlign.start,),
                      Text(firstPlayerMotivation,style: TextStyle(fontSize: 12,color: BlockedGame()? Colors.white:Colors.black),),
                    ],
                  ),
                  new Container(
                    child: FlatButton(
                      onPressed: (){},
                      child:Text(""),
                      onLongPress: (){
                        setState(() {
                          b = false;
                          clicked = [false,false,false,false,false,false,false,false,false];
                          text =["","","","","","","","",""];
                        });
                      },
                    ),
                    height: 68.00,
                    width: 33.00,
                    decoration: BoxDecoration(
                      color: Color(0xffff4d4d),borderRadius: BorderRadius.circular(17.00),
                    ),
                  )
                ],
              ),
              ),

              Transform.rotate(
                angle: 0 * pi / 180,
                child: new AnimatedContainer(


                  duration: Duration(milliseconds: 200),
                  curve: Curves.bounceIn,
                  height: 33,
                  width:b ? 240:150.00 ,
                  decoration: BoxDecoration(
                    color: !b? Color(0xffbeadad):Color(0xffFF4D4D),
                    borderRadius: BorderRadius.circular(17.00),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                new AnimatedContainer(
                  child:FlatButton(onPressed: (){
                    setState(() {
                      clickButton(0);
                     

                    });
                  },child: Text(text[0], style: TextStyle(fontSize:55, color: Colors.white ),),),
                  duration: Duration(milliseconds: 200),
                  height: clicked[0]?100: 80.00,
                  width: clicked[0]?100:80.00,
                  decoration: BoxDecoration(
                    color: clicked[0]? getColor(0) : Color(0xffffffff),borderRadius: BorderRadius.circular(16.00),
                  ),
                ),
                new AnimatedContainer(
                  child:FlatButton(

                    onPressed: (){
                    setState(() {
                      clickButton(1);
                    });
                  },child: Text(text[1], style: TextStyle(fontSize:55, color: Colors.white ),),),
                  duration: Duration(milliseconds: 200),
                  height: clicked[1]?100: 80.00,
                  width: clicked[1]?100:80.00,
                  decoration: BoxDecoration(
                    color: clicked[1]? getColor(1) : Color(0xffffffff),borderRadius: BorderRadius.circular(16.00),
                  ),
                ),

                new AnimatedContainer(
                  child:FlatButton(onPressed: (){
                    setState(() {
                      clickButton(2);
                    });
                  },child: Text(text[2], style: TextStyle(fontSize:55, color: Colors.white ),),),
                  duration: Duration(milliseconds: 200),
                  height: clicked[2]?100: 80.00,
                  width: clicked[2]?100:80.00,
                  decoration: BoxDecoration(
                    color: clicked[2]? getColor(2) : Color(0xffffffff),borderRadius: BorderRadius.circular(16.00),
                  ),
                ),


              ],),





              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                new AnimatedContainer(
                  child:FlatButton(onPressed: (){
                    setState(() {
                      clickButton(3);
                    });
                  },child: Text(text[3], style: TextStyle(fontSize:55, color: Colors.white ),),),
                  duration: Duration(milliseconds: 200),
                  height: clicked[3]?100: 80.00,
                  width: clicked[3]?100:80.00,
                  decoration: BoxDecoration(
                    color: clicked[3]? getColor(3) : Color(0xffffffff),borderRadius: BorderRadius.circular(16.00),
                  ),
                ),
                new AnimatedContainer(
                  child:FlatButton(onPressed: (){
                    setState(() {
                      clickButton(4);
                    });
                  },child: Text(text[4], style: TextStyle(fontSize:55, color: Colors.white ),),),
                  duration: Duration(milliseconds: 200),
                  height: clicked[4]?100: 80.00,
                  width: clicked[4]?100:80.00,
                  decoration: BoxDecoration(
                    color: clicked[4]? getColor(4) : Color(0xffffffff),borderRadius: BorderRadius.circular(16.00),
                  ),
                ),

                new AnimatedContainer(
                  child:FlatButton(onPressed: (){
                    setState(() {
                      clickButton(5);
                    });
                  },child: Text(text[5], style: TextStyle(fontSize:55, color: Colors.white ),),),
                  duration: Duration(milliseconds: 200),
                  height: clicked[5]?100: 80.00,
                  width: clicked[5]?100:80.00,
                  decoration: BoxDecoration(
                    color: clicked[5]? getColor(5) : Color(0xffffffff),borderRadius: BorderRadius.circular(16.00),
                  ),
                ),



              ],),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                new AnimatedContainer(
                  child:FlatButton(onPressed: (){
                    setState(() {
                      clickButton(6);
                    });
                  },child: Text(text[6], style: TextStyle(fontSize:55, color: Colors.white ),),),
                  duration: Duration(milliseconds: 200),
                  height: clicked[6]?100: 80.00,
                  width: clicked[6]?100:80.00,
                  decoration: BoxDecoration(
                    color: clicked[6]? getColor(6) : Color(0xffffffff),borderRadius: BorderRadius.circular(16.00),
                  ),
                ),
                new AnimatedContainer(
                  child:FlatButton(onPressed: (){
                    setState(() {
                     clickButton(7);
                    });
                  },child: Text(text[7], style: TextStyle(fontSize:55, color: Colors.white ),),),
                  duration: Duration(milliseconds: 200),
                  height: clicked[7]?100: 80.00,
                  width: clicked[7]?100:80.00,
                  decoration: BoxDecoration(
                    color: clicked[7]? getColor(7) : Color(0xffffffff),borderRadius: BorderRadius.circular(16.00),
                  ),
                ),

                new AnimatedContainer(
                  child:FlatButton(onPressed: (){
                    setState(() {
                      clickButton(8);
                    });
                  },child: Text(text[8], style: TextStyle(fontSize:55, color: Colors.white ),),),
                  duration: Duration(milliseconds: 200),
                  height: clicked[8]?100: 80.00,
                  width: clicked[8]?100:80.00,
                  decoration: BoxDecoration(
                    color: clicked[8]? getColor(8) : Color(0xffffffff),borderRadius: BorderRadius.circular(16.00),
                  ),
                ),


              ],),




              Transform.rotate(
                angle: 0 * pi / 180,
                child: new AnimatedContainer(

                  duration: Duration(milliseconds: 200),
                  curve: Curves.bounceIn,
                  height: 33,
                  width:!b ? 240:150.00 ,
                  decoration: BoxDecoration(
                    color: !b? Color(0xff31EA5C):Color(0xffbeadad),borderRadius: BorderRadius.circular(17.00),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.all(15), child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new Container(
                    child: FlatButton(
                      onPressed: (){} ,
                      child:Text(""),
                      onLongPress: (){
                        setState(() {
                           b = true;
                           clicked = [false,false,false,false,false,false,false,false,false];
                           text =["","","","","","","","",""];
                        });
                      },
                    ),
                    height: 68.00,
                    width: 33.00,
                    decoration: BoxDecoration(
                      color: Color(0xff31EA5C),borderRadius: BorderRadius.circular(17.00),
                    ),
                  ),


                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(secondPlayerName,style: TextStyle(fontSize: 18, fontFamily: 'Roboto',color: BlockedGame()? Colors.white:Colors.black),textAlign: TextAlign.start,),
                      Text(secondPlayerMotivation,style: TextStyle(fontSize: 12,color: BlockedGame()? Colors.white:Colors.black),),
                    ],
                  ),

                  Stack(
                    children: <Widget>[
                      new Container(
                        height: 97.00,
                        width: 97.00,
                        decoration: BoxDecoration(
                          color: Color(0xff39e8e8),
                          shape: BoxShape.circle,
                        ),
                      ),
                      new Container(
                        height: 97.00,
                        width: 97.00,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/iconfinder_profile-filled_299075.png"),
                          ),
                          shape: BoxShape.circle,
                        ),
                      ),


                    ],
                  ),

                ],
              ),
              ),
            ],
          ),
        ),





        duration: Duration(milliseconds: 200),



        decoration: BoxDecoration(
          color: BlockedGame()? Colors.black : Color(0xffe4efef),
          border: Border.all(width: 1.00, color: Color(0xff707070),),
          boxShadow: [
            BoxShadow(
              offset: Offset(0.00,3.00),
              color: Color(0xffc9baba).withOpacity(0.16),
              blurRadius: 6,
            ),
          ],
        ),
      ),
    );
  }
}
