import 'package:flutter/material.dart';

class Abc extends StatelessWidget {
  const Abc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            height: 40,
            color: Colors.deepOrange,
            child: Center(
              child: Text(
                'Header',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
          ListView.separated(
            separatorBuilder: (context, index) => Divider(),
            physics: ScrollPhysics(),
            shrinkWrap: true,
            itemCount: 50,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                color: Colors.lime,
                height: 60,
                child: Center(
                  child: Text(
                    'Child $index',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
              );
            },
          ),
          Container(
            height: 40,
            color: Colors.deepOrange,
            child: Center(
              child: Text(
                'Footer',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
