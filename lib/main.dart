import 'package:flutter/material.dart';
import 'package:simple_app/bloc/lotto_bloc.dart';
import 'package:simple_app/models/lotto.dart';
import 'package:simple_app/page/expect_num.dart';
import 'package:simple_app/page/lotto_info.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LottoMainPage(),
    );
  }
}

class LottoMainPage extends StatefulWidget {
  @override
  _LottoMainPageState createState() => _LottoMainPageState();
}

class _LottoMainPageState extends State<LottoMainPage> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Lotto'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(icon: Icon(Icons.info),),
              Tab(icon:Icon(Icons.attach_money))
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            LottoInfo(),
            ExpectNum()
          ],
        )
      ),
    );
  }
}
