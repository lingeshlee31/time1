import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {



  Future<void> setupWorldTime()  async {
    WorldTime instance = WorldTime(location: 'Kolkata',flag: '1.png',url: 'Asia/Kolkata');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });
  }

  //int counter =0;
  @override
  void initState() {
    super.initState();
    //print('initstate function run');
    setupWorldTime();
    //print('hey there');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
          child: SpinKitWave(
            color: Colors.white,
            size: 80.0,
          )
      ),
    );
  }
}
