import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../provider/VaccineCenter.dart';
import '../widgets/VaccineCenter.dart';
import '../widgets/ShimmerContainer.dart';

class VaccineCenters extends StatefulWidget {
  @override
  _VaccineCentersState createState() => _VaccineCentersState();
}

class _VaccineCentersState extends State<VaccineCenters> {
  List<dynamic> data = [];
  bool _isLoading = false;
  bool _isInit = true;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      this._isLoading = true;
      final provider = Provider.of<VaccineCenter>(context);

      provider.getCenters().then((_) {
        setState(() {
          data = provider.districtCenters;
        });
      });
      this._isLoading = false;
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final centers = Provider.of<VaccineCenter>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.transparent,
            elevation: 0,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios_outlined,
            color: Color(0xFF0E3360),
          ),
        ),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.transparent,
              elevation: 0,
            ),
            onPressed: () {
              centers.getCenters();
              setState(() {
                data = centers.districtCenters;
              });
            },
            child: Icon(
              Icons.gps_fixed,
              color: Color(0xFF0E3360),
            ),
          )
        ],
      ),
      body: Container(
        child: data.length > 0
            ? Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 7),
                    child: Text(
                      'Available Centers in your locality ',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color(0xFF0E3360),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Flexible(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent:
                              MediaQuery.of(context).size.width * .4),
                      shrinkWrap: true,
                      padding: EdgeInsets.all(10.0),
                      itemCount: data.length,
                      itemBuilder: (ctx, index) {
                        return Vaccine_Center(
                          data[index]['name'],
                          data[index]['address'],
                          data[index]['min_age_limit'].toString(),
                          data[index]['vaccine'],
                          data[index]['slots'],
                        );
                      },
                    ),
                  ),
                ],
              )
            : Container(
                height: MediaQuery.of(context).size.height * .4,
                margin: EdgeInsets.only(top: 20, bottom: 7),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Available Centers in your locality ',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color(0xFF0E3360),
                          fontWeight: FontWeight.bold),
                    ),
                    Center(
                      child: Text(
                        'No data found',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
