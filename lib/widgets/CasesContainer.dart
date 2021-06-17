import 'package:flutter/material.dart';

class CasesConatiner extends StatelessWidget {
  final text;
  final color;
  final total;
  final newCount;
  final backgroundColor;

  RegExp reg = new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  Function mathFunc = (Match match) => '${match[1]},';

  CasesConatiner(
      this.text, this.color, this.backgroundColor, this.total, this.newCount);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 6.5,
      width: MediaQuery.of(context).size.width / 2.5,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, top: 8.0, bottom: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: 19,
                color: color,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    if (text != 'Confirmed')
                      Text(
                        '+' +
                            newCount.toString().replaceAllMapped(reg, mathFunc),
                        style: TextStyle(
                          fontSize: 12,
                          color: color,
                        ),
                      ),
                    Text(
                      total.toString().replaceAllMapped(reg, mathFunc),
                      style: TextStyle(
                        color: color,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
