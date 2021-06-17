import 'package:covid_cure/widgets/StateList.dart';
import 'package:flutter/material.dart';

class StateScreen extends StatelessWidget {
  final states;

  StateScreen(this.states);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'StateWise',
          style:
              TextStyle(color: Color(0xFF0E3360), fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            primary: Colors.transparent,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios_outlined,
            color: Color(0xFF0E3360),
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 40, left: 5, right: 5, bottom: 10),
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return StateList(states[index]);
          },
          itemCount: states.length,
        ),
      ),
    );
  }
}
