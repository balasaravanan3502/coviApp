import 'package:flutter/material.dart';

class StateList extends StatelessWidget {
  final stateInfo;

  StateList(this.stateInfo);
  RegExp reg = new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  Function mathFunc = (Match match) => '${match[1]},';
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 3),
            padding: EdgeInsets.all(4),
            color: Colors.grey[200],
            width: MediaQuery.of(context).size.width * .25,
            child: stateInfo['region'] == 'State/UT'
                ? Text(
                    stateInfo['region'],
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  )
                : Text(
                    stateInfo['region'],
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 3),
            padding: EdgeInsets.all(2),
            color: Colors.grey[200],
            width: MediaQuery.of(context).size.width * .15,
            child: stateInfo['totalInfected'] == 'C'
                ? Text(
                    stateInfo['totalInfected'],
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  )
                : Text(
                    stateInfo['totalInfected']
                        .toString()
                        .replaceAllMapped(reg, mathFunc),
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 3),
            padding: EdgeInsets.all(2),
            color: Colors.grey[200],
            width: MediaQuery.of(context).size.width * .15,
            child: stateInfo['activeCases'] == 'A'
                ? Text(
                    stateInfo['activeCases'],
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  )
                : Text(
                    stateInfo['activeCases']
                        .toString()
                        .replaceAllMapped(reg, mathFunc),
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 3),
            padding: EdgeInsets.all(2),
            color: Colors.grey[200],
            width: MediaQuery.of(context).size.width * .15,
            child: stateInfo['recovered'] == 'R'
                ? Text(
                    stateInfo['recovered'],
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  )
                : Text(
                    stateInfo['recovered']
                        .toString()
                        .replaceAllMapped(reg, mathFunc),
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 3),
            padding: EdgeInsets.all(2),
            color: Colors.grey[200],
            width: MediaQuery.of(context).size.width * .15,
            child: stateInfo['deceased'] == 'D'
                ? Text(
                    stateInfo['deceased'],
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  )
                : Text(
                    stateInfo['deceased']
                        .toString()
                        .replaceAllMapped(reg, mathFunc),
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
