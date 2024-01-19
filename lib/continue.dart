import 'package:flutter/material.dart';
import 'package:maths_puzzle/data.dart';
import 'package:maths_puzzle/winner.dart';
import 'maths_puzzel.dart';


class start extends StatefulWidget {
  int ind;

  start(this.ind);

  @override
  State<start> createState() => _startState();
}

class _startState extends State<start> {
  String str = "";

  @override
  void initState() {
    print(widget.ind);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Exit Again"),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("cancel")),
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) {
                            return First();
                          },
                        ));
                      },
                      child: Text("ok"))
                ],
              );
            },
          );
          return true;
        },
        child: SafeArea(
            child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("myasset/first/gameplaybackground.jpg"),
                  fit: BoxFit.fill)),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      Expanded(
                          child: InkWell(
                        onTap: () {
                          String st =
                              First.prefer!.getString("skip_time") ?? "";
                          if (st == "") {
                            DateTime dt = DateTime.now();
                            First.prefer!.setString("skip_time", dt.toString());
                            widget.ind++;
                            int con = First.prefer!.getInt('levelNo') ?? 0;
                            if (widget.ind > con) {
                              First.prefer!.setInt('levelNo', widget.ind);
                            }
                          } else {
                            DateTime cur_time = DateTime.now();
                            DateTime skip_time = DateTime.parse(st);
                            Duration dur = cur_time.difference(skip_time);
                            int sec = dur.inSeconds;
                            if (sec > 5) {
                              First.prefer!.setString("skip_time", cur_time.toString());
                              widget.ind++;
                              int con = First.prefer!.getInt('levelNo') ?? 0;
                              if (widget.ind > con) {
                                First.prefer!.setInt('levelNo', widget.ind);
                              }
                            } else {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text("U Can Skip After 5 Second"),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            "OK",
                                            style: TextStyle(fontSize: 25),
                                          ))
                                    ],
                                  );
                                },
                              );
                            }
                          }
                          setState(() {});
                        },
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("myasset/first/skip.png"))),
                        ),
                      )),
                      Expanded(
                          child: Container(
                        alignment: Alignment.center,
                        height: 100,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    "myasset/first/level_board.png"))),
                        child: Text(
                          "Puzzle ${widget.ind +1}",
                          style: TextStyle(fontSize: 15, fontFamily: "myfont"),
                        ),
                      )),
                      Expanded(
                          child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("myasset/first/hint.png"))),
                      )),
                    ],
                  ),
                ),
                Expanded(
                    flex: 11,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(
                                bottom: 200, right: 10, left: 10),
                            height: double.infinity,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage("${data.level[widget.ind]}"),
                                    fit: BoxFit.fill)),
                          ),
                        ),
                      ],
                    )),
                Expanded(child: Text("")),
                Expanded(
                  flex: 3,
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(color: Colors.black, width: 3),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Container(
                                alignment: Alignment.centerLeft,
                                child: Text("$str"),
                                margin: EdgeInsets.all(10),
                                height: 50,
                                width: 100,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  border:
                                      Border.all(color: Colors.black, width: 3),
                                ),
                              ),
                            ),
                            Expanded(
                                child: InkWell(
                              onTap: () {
                                if (str != "") {
                                  str = str.substring(0, str.length - 1);
                                }
                                setState(() {});
                              },
                              child: Container(
                                margin: EdgeInsets.all(10),
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                  image: AssetImage("myasset/first/delete.png"),
                                )),
                              ),
                            )),
                            Expanded(
                                child: InkWell(
                              onTap: () {
                                if (str == "${data.ans[widget.ind]}") {
                                  if (widget.ind != null) {
                                    First.prefer!.setString('level_status${widget.ind}','yes');
                                    widget.ind++;
                                    int con = First.prefer!.getInt('levelNo') ?? 0;
                                    if (widget.ind > con) {
                                      First.prefer!.setInt('levelNo', widget.ind);
                                    }
                                    str = "";
                                    Navigator.push(context, MaterialPageRoute(
                                      builder: (context) {
                                        return win(widget.ind);
                                      },
                                    ));
                                  }
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text("Answer is wrong")));
                                }
                                setState(() {});
                              },
                              child: Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.all(10),
                                height: 50,
                                width: 100,
                                decoration: BoxDecoration(
                                    color: Colors.black26,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Text(
                                  "SUBMIT",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ),
                            )),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  str += '1';
                                  setState(() {});
                                },
                                child: Container(
                                  margin: EdgeInsets.only(left: 2, right: 2),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.white, width: 2)),
                                  alignment: Alignment.center,
                                  child: Text("1",
                                      style: TextStyle(color: Colors.white)),
                                ),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  str += '2';
                                  setState(() {});
                                },
                                child: Container(
                                  margin: EdgeInsets.only(left: 2, right: 2),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.white, width: 2)),
                                  alignment: Alignment.center,
                                  child: Text("2",
                                      style: TextStyle(color: Colors.white)),
                                ),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  str += '3';
                                  setState(() {});
                                },
                                child: Container(
                                  margin: EdgeInsets.only(left: 2, right: 2),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.white, width: 2)),
                                  alignment: Alignment.center,
                                  child: Text("3",
                                      style: TextStyle(color: Colors.white)),
                                ),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  str += '4';
                                  setState(() {});
                                },
                                child: Container(
                                  margin: EdgeInsets.only(left: 2, right: 2),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.white, width: 2)),
                                  alignment: Alignment.center,
                                  child: Text("4",
                                      style: TextStyle(color: Colors.white)),
                                ),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  str += '5';
                                  setState(() {});
                                },
                                child: Container(
                                  margin: EdgeInsets.only(left: 2, right: 2),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.white, width: 2)),
                                  alignment: Alignment.center,
                                  child: Text("5",
                                      style: TextStyle(color: Colors.white)),
                                ),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  str += '6';
                                  setState(() {});
                                },
                                child: Container(
                                  margin: EdgeInsets.only(left: 2, right: 2),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.white, width: 2)),
                                  alignment: Alignment.center,
                                  child: Text("6",
                                      style: TextStyle(color: Colors.white)),
                                ),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  str += '7';
                                  setState(() {});
                                },
                                child: Container(
                                  margin: EdgeInsets.only(left: 2, right: 2),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.white, width: 2)),
                                  alignment: Alignment.center,
                                  child: Text("7",
                                      style: TextStyle(color: Colors.white)),
                                ),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  str += '8';
                                  setState(() {});
                                },
                                child: Container(
                                  margin: EdgeInsets.only(left: 2, right: 2),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.white, width: 2)),
                                  alignment: Alignment.center,
                                  child: Text("8",
                                      style: TextStyle(color: Colors.white)),
                                ),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  str += '9';
                                  setState(() {});
                                },
                                child: Container(
                                  margin: EdgeInsets.only(left: 2, right: 2),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.white, width: 2)),
                                  alignment: Alignment.center,
                                  child: Text("9",
                                      style: TextStyle(color: Colors.white)),
                                ),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  str += '0';
                                  setState(() {});
                                },
                                child: Container(
                                  margin: EdgeInsets.only(left: 2, right: 2),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.white, width: 2)),
                                  alignment: Alignment.center,
                                  child: Text("0",
                                      style: TextStyle(color: Colors.white)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                //Expanded(child: Text(""),),
              ]),
        )),
      ),
    );
  }
}
