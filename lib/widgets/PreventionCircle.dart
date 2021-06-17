import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PreventionCircle extends StatelessWidget {
  final text;
  final imagePath;

  PreventionCircle(this.text, this.imagePath);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        width: MediaQuery.of(context).size.width * .33,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              child: SvgPicture.asset(
                imagePath,
                fit: BoxFit.cover,
                allowDrawingOutsideViewBox: true,
              ),
              radius: MediaQuery.of(context).size.width * .1,
              backgroundColor: Color(0xffFDE5EE),
            ),
            Container(
              child: Text(
                text.toUpperCase(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Courgette-Regular',
                  fontSize: 13,
                  color: Color(0xFF0E3360),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
