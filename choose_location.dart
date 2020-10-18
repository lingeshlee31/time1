import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class Chooselocation extends StatefulWidget {
  @override
  _ChooselocationState createState() => _ChooselocationState();
}

class _ChooselocationState extends State<Chooselocation> {

  List<WorldTime> locations = [
    //WorldTime(url:'Asia/kolkata',location: 'kolkata' ,flag: '1.jpg'),
    WorldTime(url:'Europe/London' ,location: 'London' ,flag: '2.jpg'),
    //WorldTime(url:'America/Adak',location: 'Adak' ,flag: '3.jpg'),
    //WorldTime(url:'Asia/Dubai' ,location: 'Dubai' ,flag: '4.jpg'),
    //WorldTime(url:'Pacific/Gambier' ,location: 'Gambier' ,flag: '5.jpg'),
  ];

  Future<void> updateTime(index)  async {
    WorldTime instance = locations[index];
    await instance.getTime();
    //navigate to home screen
    Navigator.pop(context,{
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });

  }
  @override
  Widget build(BuildContext context) {
    print('build function run');
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text('Choose a location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context,index) {
          return Card(
            child: ListTile(
              onTap: () {
                updateTime(index);
                //print(locations[index].location);
              },
              title: Text(locations[index].location),
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/${locations[index].flag}'),
              ),
            ),
          );
        }
      ),
    );
  }
}
