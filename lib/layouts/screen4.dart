import 'package:flutter/material.dart';
import 'package:adobe_xd/blend_mask.dart';
import 'package:adobe_xd/pinned.dart';

class screen4 extends StatelessWidget {
  const screen4({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f5f5),
      body: Stack(
        children: <Widget>[
          BlendMask(
            blendMode: BlendMode.multiply,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage(''),
                  fit: BoxFit.fill,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.6), BlendMode.dstIn),
                ),
              ),
              margin: const EdgeInsets.fromLTRB(-252.0, 0.0, -202.0, 0.0),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 0.0, end: 0.0),
            Pin(size: 118.0, start: 0.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0x80ffffff),
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(69.0),
                ),
                border: Border.all(width: 10.0, color: const Color(0x80707070)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 222.0, start: 36.0),
            Pin(size: 40.0, start: 38.0),
            child: const Text(
              'Check your GWA',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 30,
                color: Color(0xff000000),
                fontWeight: FontWeight.w600,
              ),
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 132.0, start: -4.0),
            Pin(size: 37.0, middle: 0.1958),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xb2ffffff),
                border: Border.all(width: 2.0, color: const Color(0xb2707070)),
              ),
            ),
          ),
          Align(
            alignment: const Alignment(0.0, -0.608),
            child: Container(
              width: 132.0,
              height: 37.0,
              decoration: BoxDecoration(
                color: const Color(0xb2ffffff),
                border: Border.all(width: 2.0, color: const Color(0xb2707070)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 132.0, end: -4.0),
            Pin(size: 37.0, middle: 0.1958),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xb2ffffff),
                border: Border.all(width: 2.0, color: const Color(0xb2707070)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 132.0, start: -4.0),
            Pin(size: 37.0, middle: 0.2416),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xb2ffffff),
                border: Border.all(width: 2.0, color: const Color(0xb2707070)),
              ),
            ),
          ),
          Align(
            alignment: const Alignment(0.0, -0.517),
            child: Container(
              width: 132.0,
              height: 37.0,
              decoration: BoxDecoration(
                color: const Color(0xb2ffffff),
                border: Border.all(width: 2.0, color: const Color(0xb2707070)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 132.0, end: -4.0),
            Pin(size: 37.0, middle: 0.2416),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xb2ffffff),
                border: Border.all(width: 2.0, color: const Color(0xb2707070)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 132.0, start: -4.0),
            Pin(size: 37.0, middle: 0.2875),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xb2ffffff),
                border: Border.all(width: 2.0, color: const Color(0xb2707070)),
              ),
            ),
          ),
          Align(
            alignment: const Alignment(0.0, -0.425),
            child: Container(
              width: 132.0,
              height: 37.0,
              decoration: BoxDecoration(
                color: const Color(0xb2ffffff),
                border: Border.all(width: 2.0, color: const Color(0xb2707070)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 132.0, end: -4.0),
            Pin(size: 37.0, middle: 0.2875),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xb2ffffff),
                border: Border.all(width: 2.0, color: const Color(0xb2707070)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 132.0, start: -4.0),
            Pin(size: 37.0, middle: 0.3333),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xb2ffffff),
                border: Border.all(width: 2.0, color: const Color(0xb2707070)),
              ),
            ),
          ),
          Align(
            alignment: const Alignment(0.0, -0.333),
            child: Container(
              width: 132.0,
              height: 37.0,
              decoration: BoxDecoration(
                color: const Color(0xb2ffffff),
                border: Border.all(width: 2.0, color: const Color(0xb2707070)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 132.0, end: -4.0),
            Pin(size: 37.0, middle: 0.3333),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xb2ffffff),
                border: Border.all(width: 2.0, color: const Color(0xb2707070)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 132.0, start: -4.0),
            Pin(size: 37.0, middle: 0.3792),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xb2ffffff),
                border: Border.all(width: 2.0, color: const Color(0xb2707070)),
              ),
            ),
          ),
          Align(
            alignment: const Alignment(0.0, -0.242),
            child: Container(
              width: 132.0,
              height: 37.0,
              decoration: BoxDecoration(
                color: const Color(0xb2ffffff),
                border: Border.all(width: 2.0, color: const Color(0xb2707070)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 132.0, end: -4.0),
            Pin(size: 37.0, middle: 0.3792),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xb2ffffff),
                border: Border.all(width: 2.0, color: const Color(0xb2707070)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 132.0, start: -4.0),
            Pin(size: 37.0, middle: 0.425),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xb2ffffff),
                border: Border.all(width: 2.0, color: const Color(0xb2707070)),
              ),
            ),
          ),
          Align(
            alignment: const Alignment(0.0, -0.15),
            child: Container(
              width: 132.0,
              height: 37.0,
              decoration: BoxDecoration(
                color: const Color(0xb2ffffff),
                border: Border.all(width: 2.0, color: const Color(0xb2707070)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 132.0, end: -4.0),
            Pin(size: 37.0, middle: 0.425),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xb2ffffff),
                border: Border.all(width: 2.0, color: const Color(0xb2707070)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 90.0, start: 17.0),
            Pin(size: 21.0, middle: 0.2005),
            child: const Text(
              'Course Code',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                color: Color(0xff000000),
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
              softWrap: false,
            ),
          ),
          const Align(
            alignment: Alignment(0.0, -0.599),
            child: SizedBox(
              width: 42.0,
              height: 21.0,
              child: Text(
                'Grade',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  color: Color(0xff000000),
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
                softWrap: false,
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 36.0, end: 44.0),
            Pin(size: 21.0, middle: 0.2005),
            child: const Text(
              'Units',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                color: Color(0xff000000),
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
              softWrap: false,
            ),
          ),
          const Align(
            alignment: Alignment(0.0, 0.097),
            child: SizedBox(
              width: 20.0,
              height: 40.0,
              child: Text(
                '+',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 30,
                  color: Color(0xffffffff),
                  fontWeight: FontWeight.w800,
                ),
                textAlign: TextAlign.center,
                softWrap: false,
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 81.0, end: 80.0),
            Pin(size: 51.0, end: 12.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xb2ffffff),
                borderRadius: BorderRadius.circular(32.0),
                border: Border.all(width: 5.0, color: const Color(0xb2333572)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 164.0, middle: 0.5),
            Pin(size: 27.0, end: 26.0),
            child: const Text(
              'Check my results!',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 20,
                color: Color(0xff000000),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
              softWrap: false,
            ),
          ),
        ],
      ),
    );
  }
}

const String _svg_dr9fnn =
    '<svg viewBox="164.0 432.0 62.0 60.0" ><path transform="translate(164.0, 432.0)" d="M 31 0 C 48.12082672119141 0 62 13.43145942687988 62 30 C 62 46.56854248046875 48.12082672119141 60 31 60 C 13.87917327880859 60 0 46.56854248046875 0 30 C 0 13.43145942687988 13.87917327880859 0 31 0 Z" fill="#707070" stroke="#707070" stroke-width="5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
