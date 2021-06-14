import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "calculater",
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: home(),
    );
  }
}

class home extends StatefulWidget {
  // const home({Key? key}) : super(key: key);

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {

  int firstnum;
  int secoundnum;
  String texttodisplay;
  String res;
  String operatortoperfrom;
  void btnclicked(String btnvalue){
    if(btnvalue=="c"){
      texttodisplay = "";
      firstnum = 0;
      secoundnum = 0;
      res = "";
    }
    else if(btnvalue=="+" || btnvalue=="-"|| btnvalue=="*"|| btnvalue=="/"){
      firstnum= int.parse(texttodisplay);
      res = "";
      operatortoperfrom = btnvalue;
    }
    else if(btnvalue == "="){
      secoundnum = int.parse(texttodisplay);
      if(operatortoperfrom == "+"){
        res = (firstnum + secoundnum).toString();
      }
      if(operatortoperfrom == "-"){
        res = (firstnum - secoundnum).toString();
      }
      if(operatortoperfrom == "*"){
        res = (firstnum * secoundnum).toString();
      }
      if(operatortoperfrom == "/"){
        res = (firstnum ~/ secoundnum).toString();
      }
    }
    else{
      res = int.parse(texttodisplay + btnvalue).toString();
    }
    setState(() {
      texttodisplay = res;
    });
  }



  Widget button(String btnvalue) {
    return Expanded(
      child: OutlineButton(
        padding: EdgeInsets.all(25),
        onPressed: () => btnclicked(btnvalue),
        child: Text(
          "$btnvalue",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("calculater"),
      ),
      body: Container(
        padding: EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.bottomRight,
                child: Text(
                  "$texttodisplay",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Row(
              children: [
                button("9"),
                button("8"),
                button("7"),
                button("+"),
              ],
            ),
            Row(
              children: [
                button("6"),
                button("5"),
                button("4"),
                button("-"),
              ],
            ),
            Row(
              children: [
                button("3"),
                button("2"),
                button("1"),
                button("*"),
              ],
            ),
            Row(
              children: [
                button("c"),
                button("0"),
                button("="),
                button("/"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
