import 'package:flutter/material.dart';
import 'package:th_knn/values/strings.dart';
import 'package:th_knn/widgets/text_style.dart';

class Header extends StatelessWidget {
  final String? headerTitle;
  final num? size;
  const Header({super.key, this.headerTitle, this.size});

  @override
  Widget build(BuildContext context) {
    // return Container(
    //     height: 90,
    //     padding: const EdgeInsets.symmetric(horizontal: 30),
    //     width: MediaQuery.sizeOf(context).width,
    //     decoration: BoxDecoration(
    //       borderRadius: const BorderRadius.only(
    //         bottomRight: Radius.circular(69.0),
    //       ),
    //       border: Border.all(width: 10.0, color: headerColor),
    //     ),
    //     child: Align(
    //       alignment: Alignment.centerLeft,
    //       child: Text(headerTitle ?? goodDay, style: headerTextStyle()),
    //     ));
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            flex: 1,
            child: Image.asset('assets/imgs/catsu.png',
                height: size?.toDouble(), width: size?.toDouble()),
          ),
          const SizedBox(width: 10),
          Expanded(
              flex: 2,
              child: Text(appName,
                  textAlign: TextAlign.center, style: headerTextStyle())),
          const SizedBox(width: 10),
          Expanded(
            flex: 1,
            child: Image.asset('assets/imgs/cict.png',
                height: size?.toDouble(), width: size?.toDouble()),
          )
        ],
      ),
    );
  }
}
