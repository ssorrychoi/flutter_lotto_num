import 'dart:convert';
import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;
import 'package:simple_app/models/lotto.dart';
import 'package:date_format/date_format.dart';

class LottoBloc{

  /// 결과값 받을 변수 생성
  final _lottoResult = BehaviorSubject<Lotto>.seeded(null);

  /// 기점
  int dateInt = int.parse(formatDate(DateTime(2020,04,11), [yyyy,mm,dd]));
  int nowInt = int.parse(formatDate(DateTime.now(), [yyyy,mm,dd]));

  /// 생성자
  LottoBloc(){
    int num;
    if(nowInt-dateInt >= 7){
      num = 906 + (nowInt-dateInt) ~/ 7;
    }
    fetch(num);
  }

  /// api 통신
  Future<Lotto> fetchData(num) async{
    try{
      var res = await http.get('http://www.nlotto.co.kr/common.do?method=getLottoNumber&drwNo=${num}');
      if(res.statusCode != 200){
        throw StateError('네트워크 에러! : ${res.statusCode}');
      }
      Lotto result = Lotto.fromJson(jsonDecode(res.body));
      return result;
    }catch (e){
      Future.error(e);
    }

  }

  void fetch(int num) async{
    var LottoResult = await fetchData(num);
    _lottoResult.add(LottoResult);
  }

  /// 변수 저장해서 stream
  Stream<Lotto> get result => _lottoResult.stream;

}
