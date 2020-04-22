import 'package:flutter/material.dart';
import 'dart:math';


class ExpectNum extends StatefulWidget {
  @override
  _ExpectNumState createState() => _ExpectNumState();
}

class _ExpectNumState extends State<ExpectNum> {



 Random random = new Random();

  @override
  Widget build(BuildContext context) {
//    List<int> ranNum = [];
//    for(int i=0;i<6;i++){
//      int num = random.nextInt(45);
//      ranNum.add(num);
//    }

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(child: Text("It's Your Turn",style: TextStyle(fontSize: 40),)),
          Padding(padding: EdgeInsets.all(16),),
//          Center(child:_getNumber()),
//          ListTile(
//            title: Text('${ranNum}'),
//          ),
//          ListView.builder(
//              itemCount: ranNum.length,
//              itemBuilder: (context, index){
//                return Column(
//                  mainAxisAlignment: MainAxisAlignment.center,
//                  children: <Widget>[
//                    Text('${ranNum[index]}'),
//                  ],
//                );
//              }),
        ],
      ),
    );
  }

  Text _getNumber() {
    List<int> ranNum = [];

    for(int i=0;i<6;i++){
      int num = random.nextInt(45);
      ranNum.add(num);
      print(num);
    }
    print(ranNum);

    return Text('${ranNum}',style: TextStyle(fontSize: 24),);
//    return textNum.toList();

  }
  List _getList(){
    List<Text> textNum = [];
    for(int i=0;i<6;i++){
      int num = random.nextInt(45);
      textNum.add(Text('${num}',style: TextStyle(fontSize: 24),));
      print(num);
    }
    print(textNum);
    return textNum;
  }
}
