import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maths_puzzle/data.dart';
import 'package:maths_puzzle/puzzel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'continue.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: First(),
  ));
}

class First extends StatefulWidget {
  static SharedPreferences? prefer;

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
  void initState() {
    // TODO: implement initState
    super.initState();
    share_pefer();
  }
  int con=0;
  share_pefer() async {
    First.prefer = await SharedPreferences.getInstance();
    int levelno=First.prefer!.getInt("levelNo")??0;
    l=List.filled(data.ans.length,"");
    con=First.prefer!.getInt('levelNo')??0;
  }
  List l=[];
  bool t = false;
  bool t1 = false;
  bool t2 = false;
  int ?curren_lvl;

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
              Row(
                children: [
                  Expanded(
                      child: Container(
                        margin: EdgeInsets.only(top: 20),
                        alignment: Alignment.center,
                        child: Text("Math Puzzles", style: TextStyle(color: Colors.blue, fontSize: 30)),
                      )),
                ],
              ),
              Expanded(
                flex: 7,
                child: Container(
                    margin: EdgeInsets.all(10),
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(image: DecorationImage(image: AssetImage(
                                "myasset/first/blackboard_main_menu.png"), fit: BoxFit.fill)),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTapUp: (details) {
                                  t = false;
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return start(con);
                                    },
                                  ));
                                  setState(() {});
                                },
                                onTapDown: (details) {
                                  t = true;
                                  setState(() {});
                                },
                                onTapCancel: () {
                                  t = false;
                                  setState(() {});
                                },
                                child: Container(
                                  height: 50,
                                  width: 150,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                    border: (t == true)
                                        ? Border.all(color: Colors.white)
                                        : null,
                                  ),
                                  child: Text("CONTINUE", style: TextStyle(fontSize: 25, fontFamily: "myfont",
                                        color: Colors.white),),
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTapUp: (details) {
                                  t1 = false;
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return level_page(l);
                                    },
                                  ));
                                  setState(() {});
                                },
                                onTapDown: (details) {
                                  t1 = true;
                                  setState(() {});
                                },
                                onTapCancel: () {
                                  t1 = false;
                                  setState(() {});
                                },
                                child: Container(
                                  height: 50,
                                  width: 150,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                    border: (t1 == true)
                                        ? Border.all(color: Colors.white)
                                        : null,
                                  ),
                                  child: Text("PUZZLES", style: TextStyle(fontSize: 25, fontFamily: "myfont",
                                        color: Colors.white),),
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTapUp: (details) {
                                  t2 = false;
                                  // Navigator.push(context, MaterialPageRoute(
                                  //   builder: (context) {
                                  //     return start(curren_lvl);
                                  //   },
                                  // ));
                                  setState(() {});
                                },
                                onTapDown: (details) {
                                  t2 = true;
                                  setState(() {});
                                },
                                onTapCancel: () {
                                  t2 = false;
                                  setState(() {});
                                },
                                child: Container(
                                  height: 50,
                                  width: 150,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                    border: (t2 == true)
                                        ? Border.all(color: Colors.white)
                                        : null,
                                  ),
                                  child: Text("BUY PR0", style: TextStyle(fontSize: 25, fontFamily: "myfont",
                                      color: Colors.white),),
                                ),
                              )
                            ],
                          ),
                        ])),
              ),
              Expanded(child: Text("")),
              Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                margin: EdgeInsets.all(5),
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image:
                                      AssetImage("myasset/first/shareus.png")),
                                  gradient: LinearGradient(
                                      colors: [
                                        Colors.grey,
                                        Colors.white,
                                        Colors.grey
                                      ],
                                      begin: Alignment.center,
                                      end: Alignment.centerLeft),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(5),
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image:
                                      AssetImage("myasset/first/emailus.png")),
                                  gradient: LinearGradient(
                                      colors: [
                                        Colors.grey,
                                        Colors.white,
                                        Colors.grey
                                      ],
                                      begin: Alignment.center,
                                      end: Alignment.centerLeft),
                                ),
                              )
                            ]),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}