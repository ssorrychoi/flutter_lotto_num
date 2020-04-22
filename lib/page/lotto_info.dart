import 'dart:math';

import 'package:flutter/material.dart';
import 'package:simple_app/bloc/lotto_bloc.dart';
import 'package:simple_app/models/lotto.dart';
import 'package:date_format/date_format.dart';


/// Lotto 결과값 가져오기.
final lottoBloc = LottoBloc();
String dropdownValue = '1';

class LottoInfo extends StatefulWidget {

  @override
  _LottoInfoState createState() => _LottoInfoState();
}

class _LottoInfoState extends State<LottoInfo> {

  /// 현재시간
  String date = formatDate(DateTime.now(), [yyyy, '-', mm,'-',dd]).toString();
  String time = formatDate(DateTime.now(), [HH, ':', nn]).toString();

  /// 기점
  int dateInt = int.parse(formatDate(DateTime(2020,04,11), [yyyy,mm,dd]));
  int nowInt = int.parse(formatDate(DateTime.now(), [yyyy,mm,dd]));


  @override
  Widget build(BuildContext context) {

    List<String> num_String = [];

    int num = 906;
    if(nowInt-dateInt >= 7){
      num = 906 + (nowInt-dateInt) ~/ 7;
    }
    for(int i=num;i<0;i--){
      num_String.add((i).toString());
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('현재시간 : ${date} ${time}'),
            Padding(padding: EdgeInsets.all(8),),
            StreamBuilder<Lotto>(
              stream: lottoBloc.result,
              builder: (context, snapshot){
               return snapshot.data.drwNoDate == null ? Center(child: CircularProgressIndicator()) :Column(
                 children: <Widget>[
                   Text('발표일 : ${snapshot.data.drwNoDate}(${snapshot.data.drwNo}회차)'),
                   Padding(padding: EdgeInsets.all(8),),
                   _resultNum(snapshot.data),
                   Padding(padding: EdgeInsets.all(8),),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: <Widget>[
                       Icon(Icons.add,size: 30,color: _getColor(),),
                       Container(
                           height: 40,
                           width: 40,
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(50),
                             color: _getColor(),
                           ),
                           child: Center(child: Text('${snapshot.data.bnusNo}',style: TextStyle(color: Colors.white)))
                       ),
                     ],
                   ),
//                   RaisedButton(
//                     child: Text('907회'),
//                     onPressed: (){
//                       lottoBloc.fetch(907);
//                       },
//                   ),
//                   RaisedButton(
//                     child: Text('906회'),
//                     onPressed: (){
//                       lottoBloc.fetch(906);
//                       },
//                   ),
                DropdownButton<String>(
                    value: dropdownValue,
                    icon: Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(
                        color: Colors.black
                    ),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        _selected(newValue);
                        lottoBloc.fetch(int.parse(newValue));
                      });
                      },
                    items: num_String
                        .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                ),
                 ],
               );
               },
            ),
          ],
        ),
      )
    );
  }

 Color _getColor() {
    Random random = new Random();
    Color color = Color.fromRGBO(random.nextInt(256), random.nextInt(256), random.nextInt(256), 1);
    return color;
 }

 Row _resultNum(Lotto snapshot) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: _getColor(),
            ),
            child: Center(child: Text('${snapshot.drwtNo1}',style: TextStyle(color: Colors.white),))
        ),
        Padding(padding: EdgeInsets.all(8),),
        Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: _getColor(),
            ),
            child: Center(child: Text('${snapshot.drwtNo2}',style: TextStyle(color: Colors.white)))
        ),
        Padding(padding: EdgeInsets.all(8),),
        Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: _getColor(),
            ),
            child: Center(child: Text('${snapshot.drwtNo3}',style: TextStyle(color: Colors.white)))
        ),
        Padding(padding: EdgeInsets.all(8),),
        Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: _getColor(),
            ),
            child: Center(child: Text('${snapshot.drwtNo4}',style: TextStyle(color: Colors.white)))
        ),
        Padding(padding: EdgeInsets.all(8),),
        Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: _getColor(),
            ),
            child: Center(child: Text('${snapshot.drwtNo5}',style: TextStyle(color: Colors.white)))
        ),
        Padding(padding: EdgeInsets.all(8),),
        Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: _getColor(),
            ),
            child: Center(child: Text('${snapshot.drwtNo6}',style: TextStyle(color: Colors.white)))
        ),
      ],
    );
  }

  void _selected(String newValue) {
    setState(() {
      dropdownValue = newValue;
    });
  }


}
