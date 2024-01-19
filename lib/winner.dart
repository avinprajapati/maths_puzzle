import 'package:flutter/material.dart';
import 'continue.dart';
import 'maths_puzzel.dart';

class win extends StatefulWidget {
  int curren_lvl;
  bool ?is_skip;
  win(this.curren_lvl,[this.is_skip]);

  @override
  State<win> createState() => _winState();
}

class _winState extends State<win> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("myasset/first/background.jpg"))),
          child: Column(
            children: [
              Container(
                  margin: EdgeInsets.only(top: 30),
                  child: Text("Puzzle ${widget.curren_lvl} Completed", style: TextStyle(fontSize: 25),)),
              Expanded(
                flex: 2,
                child: Container(
                  height: 250,
                  width:double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage("myasset/first/trophy.png"))),
                ),
              ),

              Expanded(
                child: Column(children: [
                  Expanded(
                    child: InkWell(onTap: () {
                     if(widget.is_skip==true){
                       Navigator.push(context, MaterialPageRoute(builder: (context) {
                         return start(widget.curren_lvl);
                       },));
                     }
                     else{
                       Navigator.push(context, MaterialPageRoute(builder: (context) {
                         return start(widget.curren_lvl);
                       },));
                     }
                    },
                      child: Container(
                        margin: EdgeInsets.all(5),
                        alignment: Alignment.center,
                        height:100,
                        width: 150,
                        child: Text("Continue",style: TextStyle(fontSize: 25,),),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Colors.grey, Colors.white, Colors.grey], begin: Alignment.center,
                                end: Alignment.centerLeft),
                            borderRadius: BorderRadius.circular(10),border: Border.all(color: Colors.black,width: 3)),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return First();
                      },));
                    },
                      child: Container(
                        margin: EdgeInsets.all(5),
                        alignment: Alignment.center,
                        height:150,
                        width: 150,
                        child: Text("Main Menu",style: TextStyle(fontSize: 25,),),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Colors.grey, Colors.white, Colors.grey], begin: Alignment.center,
                                end: Alignment.centerLeft),
                            borderRadius: BorderRadius.circular(10),border: Border.all(color: Colors.black,width: 3)),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(5),
                      alignment: Alignment.center,
                      height:50,
                      width: 150,
                      child: Text("Buy Pro",style: TextStyle(fontSize: 25,),),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.grey, Colors.white, Colors.grey], begin: Alignment.center,
                              end: Alignment.centerLeft),
                          borderRadius: BorderRadius.circular(10),border: Border.all(color: Colors.black,width: 3)),
                    ),
                  ),],),
              ),
              Expanded(child: Text("")),
            ],
          ),
        ),
      ),
    );
  }
}