import 'package:covid_cure/screens/StateScreen.dart';

//Color(0xFF0E3360) Color(0xff264671)
import '../widgets/ShimmerContainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../provider/Cases.dart';
import '../widgets/CasesContainer.dart';
import '../widgets/PreventionCircle.dart';
import './VaccineCenterScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController controller = PageController(initialPage: 0);
  var _isInit = true;

  List<dynamic> cases = [];

  @override
  void didChangeDependencies() {
    if (_isInit) {
      final provider = Provider.of<Cases>(context);

      provider.getlatestCases().then((_) {
        setState(() {
          cases = provider.latestCases;
          cases[0]['regionData'].insert(0, {
            "region": 'State/UT',
            "totalInfected": 'C',
            "activeCases": 'A',
            "recovered": 'R',
            "deceased": 'D'
          });
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Cases>(context, listen: true);
    provider.getlatestCases();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 5),
                  height: MediaQuery.of(context).size.height * .6,
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(50.0),
                      bottomLeft: Radius.circular(50.0),
                    ),
                  ),
                  child: cases.length > 0
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              padding: EdgeInsets.only(top: 20, left: 35),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(3),
                                    margin: EdgeInsets.only(top: 10),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'India',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w900,
                                            color: Color(0xFF0E3360),
                                            fontSize: 38,
                                          ),
                                        ),
                                        Text(
                                          'Last updated at ' +
                                              cases[0]['lastUpdatedAtApify']
                                                  .substring(11, 19),
                                          style: TextStyle(
                                              color: Color(0xFF0E3360)),
                                        ),
                                      ],
                                    ),
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      primary: Colors.transparent,
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (ctx) => StateScreen(
                                              cases[0]['regionData']),
                                        ),
                                      );
                                    },
                                    child: Icon(
                                      Icons.arrow_forward_outlined,
                                      color: Color(0xFF0E3360),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height / 4.9,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  CasesConatiner(
                                      'Confirmed',
                                      Color(0xffE23028),
                                      Color(0xffFFE7EC),
                                      cases[0]['totalCases'],
                                      '0'),
                                  CasesConatiner(
                                      'Active',
                                      Color(0xff007BFF),
                                      Color(0xffE8F2FF),
                                      cases[0]['activeCases'],
                                      cases[0]['activeCasesNew']),
                                ],
                              ),
                            ),

                            //  first first

                            Container(
                              height: MediaQuery.of(context).size.height / 5.2,
                              //margin: EdgeInsets.only(top: 10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  CasesConatiner(
                                      'Recovered',
                                      Color(0xff28A745),
                                      Color(0xffE7F3EC),
                                      cases[0]['recovered'],
                                      cases[0]['recoveredNew']),
                                  CasesConatiner(
                                      'Deceased',
                                      Color(0xff6C757D),
                                      Color(0xffF0F1F2),
                                      cases[0]['deaths'],
                                      cases[0]['deathsNew']),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                bottom: 10,
                                left: 50,
                                right: 50,
                              ),
                              child: Divider(
                                color: Color(0xff264671),
                              ),
                            ),
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              padding: EdgeInsets.only(top: 20, left: 35),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(3),
                                        margin: EdgeInsets.only(top: 10),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'India',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w900,
                                                color: Color(0xFF0E3360),
                                                fontSize: 38,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      primary: Colors.transparent,
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (ctx) => StateScreen(
                                                cases[0]['regionData'])),
                                      );
                                    },
                                    child: Icon(
                                      Icons.arrow_forward_outlined,
                                      color: Color(0xFF0E3360),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height / 4.9,
                              //margin: EdgeInsets.only(top: 40.0, bottom: 10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ShimmerContainer(
                                      Color(0xffFFE7EC),
                                      MediaQuery.of(context).size.width / 2.5,
                                      MediaQuery.of(context).size.height / 6.5),
                                  ShimmerContainer(
                                      Color(0xffE8F2FF),
                                      MediaQuery.of(context).size.width / 2.5,
                                      MediaQuery.of(context).size.height / 6.5),
                                ],
                              ),
                            ),

                            //  first first

                            Container(
                              height: MediaQuery.of(context).size.height / 5.2,
                              //margin: EdgeInsets.only(top: 10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ShimmerContainer(
                                      Color(0xffE7F3EC),
                                      MediaQuery.of(context).size.width / 2.5,
                                      MediaQuery.of(context).size.height / 6.5),
                                  ShimmerContainer(
                                      Color(0xffF0F1F2),
                                      MediaQuery.of(context).size.width / 2.5,
                                      MediaQuery.of(context).size.height / 6.5),
                                ],
                              ),
                            ),

                            Container(
                              padding: EdgeInsets.only(
                                bottom: 10,
                                left: 50,
                                right: 50,
                              ),
                              child: Divider(
                                color: Color(0xff264671),
                              ),
                            ),
                          ],
                        ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * .17,
                  margin: EdgeInsets.only(left: 21, right: 21),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Color(0xff264671),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      elevation: 0,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VaccineCenters(),
                        ),
                      );
                    },
                    child: Container(
                      child: Center(
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/images/doctor.svg',
                              width: MediaQuery.of(context).size.width * .3,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 5.0, left: 10.0, right: 10.0),
                              child: Text(
                                'get \nVaccinated\nnow'.toUpperCase(),
                                style: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  letterSpacing: 2.0,
                                  wordSpacing: 3.0,
                                ),
                              ),
                            ),
                            Icon(Icons.arrow_forward_ios)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * .5,
                  margin: EdgeInsets.only(top: 20, bottom: 20),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        margin:
                            EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        ),
                        child: Text(
                          'prevention tips'.toUpperCase(),
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 2.0,
                            wordSpacing: 3.0,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 16),
                        height: MediaQuery.of(context).size.height * .2,
                        child: Row(
                          children: [
                            PreventionCircle('Wear a\n Facemask',
                                'assets/images/wear_mask.svg'),
                            PreventionCircle('Clean your hands often',
                                'assets/images/hand_wash.svg'),
                            PreventionCircle('Avoid close contact',
                                'assets/images/social-distance.svg'),
                          ],
                        ),
                      ),
                      //circle
                    ],
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
