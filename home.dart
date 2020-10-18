import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class Home extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Home> {

  Map data = { };


  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    print('hello');
    print(data);

    //set background

    String bg = data['isDaytime'] ? 'day.jpg' : 'ni8.JPG';
    Color bgColor = data['isDaytime']? Colors.blue : Colors.deepOrangeAccent;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bg'),
              fit: BoxFit.cover,
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
            child: Column(
              children: <Widget>[
                FlatButton.icon(
                  onPressed: () async {
                    dynamic result = await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = {
                        'time' : result['time'],
                        'location' : result['location'],
                        'flag' : result['flag'],
                      };
                    });
                  },
                  icon: Icon(
                      Icons.edit_location,
                    color: Colors.grey[200],
                  ),
                  label: Text(
                      'Edit location',
                    style: TextStyle(
                      color: Colors.grey[200],
                    ),
                  ),
                ),
                SizedBox(height:10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20.0),
                Text(
                  data['time'],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 68.0,
                    letterSpacing: 2.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
