import 'package:http/http.dart' ;
import 'dart:convert';
import 'package:intl/intl.dart';
class WorldTime{

  String location;//locatoin name for UI
  String time; //time in that location
  String flag; //url to asset an flag icon
  String url; //loaction url for api end point
  bool isDaytime = false;

  WorldTime({this.url,this.location,this.flag});

  Future<void> getTime() async {

    try{
      Response response =  await get('https://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);

      String dateTime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);
      //print(datatime);
      //print(offset);

      //create dtaatime oject
      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(offset)));
      //setting time property

      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      print('catch error : $e');
      time = 'could not get the time data';
    }


  }
}