import 'package:flutter/material.dart';

class CenterDetailScreen extends StatelessWidget {
  final String name;
  final String address;
  final String min_age_limit;
  final String vaccine;
  final List slots;

  CenterDetailScreen(
      this.name, this.address, this.min_age_limit, this.vaccine, this.slots);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              child: Text(
                name,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0E3360),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * .18,
              width: MediaQuery.of(context).size.width * .05,
              margin: EdgeInsets.only(left: 30, right: 30, top: 20),
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.cyan.withOpacity(0.9),
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(7.0),
                    padding: EdgeInsets.only(
                        left: 15, top: 10, right: 15, bottom: 10),
                    decoration: BoxDecoration(
                      color: Colors.cyan.withOpacity(0.9),
                      borderRadius: BorderRadius.all(Radius.circular(40.0)),
                    ),
                    child: Text(
                      'Address'.toUpperCase(),
                      style: TextStyle(
                        fontFamily: 'Courgette-Regular',
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        wordSpacing: 2.0,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      padding: EdgeInsets.all(7.0),
                      child: Text(
                        address.toUpperCase(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Courgette-Regular',
                          fontSize: 10.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          wordSpacing: 2.0,
                          letterSpacing: 1.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * .15,
              margin: EdgeInsets.only(left: 30, right: 30, top: 10),
              padding: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                color: Colors.cyan.withOpacity(0.9),
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(10.0),
                    padding: EdgeInsets.symmetric(vertical: 7, horizontal: 15),
                    decoration: BoxDecoration(
                      color: Colors.cyan.withOpacity(0.9),
                      borderRadius: BorderRadius.all(Radius.circular(40.0)),
                    ),
                    child: Text(
                      'Available vaccine'.toUpperCase(),
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        wordSpacing: 2.0,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(7.0),
                    child: Text(
                      vaccine.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 10.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        wordSpacing: 2.0,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * .15,
              margin: EdgeInsets.only(left: 30, right: 30, top: 10),
              padding: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                color: Colors.cyan.withOpacity(0.9),
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(10.0),
                    padding: EdgeInsets.symmetric(vertical: 7, horizontal: 15),
                    decoration: BoxDecoration(
                      color: Colors.cyan.withOpacity(0.9),
                      borderRadius: BorderRadius.all(Radius.circular(40.0)),
                    ),
                    child: Text(
                      'minimum Age limit'.toUpperCase(),
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        wordSpacing: 2.0,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      padding: EdgeInsets.all(7.0),
                      child: Text(
                        min_age_limit.toUpperCase(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 10.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          wordSpacing: 2.0,
                          letterSpacing: 1.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
