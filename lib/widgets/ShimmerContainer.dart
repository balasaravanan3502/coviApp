import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerContainer extends StatelessWidget {
  final backgroundColor;
  final height;
  final width;

  ShimmerContainer(this.backgroundColor, this.width, this.height);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Shimmer.fromColors(
              baseColor: Colors.grey[300],
              highlightColor: Colors.grey[100],
              child: Container(
                color: Colors.grey[300],
                height: MediaQuery.of(context).size.height * .03,
                width: MediaQuery.of(context).size.width * .3,
              ),
            ),
            Shimmer.fromColors(
              baseColor: Colors.grey[300],
              highlightColor: Colors.grey[100],
              child: Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * .04),
                color: Colors.grey[300],
                height: MediaQuery.of(context).size.height * .03,
                width: MediaQuery.of(context).size.width * .2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
