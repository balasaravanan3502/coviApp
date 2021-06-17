import 'package:covid_cure/screens/CenterDetailScreen.dart';
import 'package:flutter/material.dart';

class Vaccine_Center extends StatefulWidget {
  final String name;
  final String address;
  final String min_age_limit;
  final String vaccine;
  final List slots;

  Vaccine_Center(
      this.name, this.address, this.min_age_limit, this.vaccine, this.slots);

  @override
  _Vaccine_CenterState createState() => _Vaccine_CenterState();
}

class _Vaccine_CenterState extends State<Vaccine_Center> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: MaterialButton(
        padding: EdgeInsets.zero,
        highlightColor: Colors.transparent,
        onPressed: () {
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) => SingleChildScrollView(
                      child: Container(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: CenterDetailScreen(
                      widget.name,
                      widget.address,
                      widget.min_age_limit,
                      widget.vaccine,
                      widget.slots,
                    ),
                  )));
        },
        child: Container(
          width: MediaQuery.of(context).size.width * .4,
          height: MediaQuery.of(context).size.height * .18,
          padding: EdgeInsets.only(top: 16.0, left: 10, right: 10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.cyan.withOpacity(0.6),
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
          ),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 25,
                  height: 25,
                  child: Image(
                    image: AssetImage(
                      'assets/images/hospital.jpeg',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                Divider(
                  thickness: 10,
                  color: Colors.transparent,
                ),
                Flexible(
                  child: Container(
                    child: Text(
                      widget.name.toUpperCase(),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 11.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 0.7,
                        wordSpacing: 2.0,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 3),
                  child: Icon(
                    Icons.keyboard_arrow_down_outlined,
                    color: Colors.white,
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
