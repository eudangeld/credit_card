import 'dart:convert';
import 'package:flutter/widgets.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;

Size size(BuildContext context) => MediaQuery.of(context).size;
Orientation orientation(BuildContext context) =>
    MediaQuery.of(context).orientation;

bool flagReturned = false;
Widget flag = Container();

Future<Widget> getCardBin(String cardNumber) async {
  if (cardNumber.length < 6) {
    flagReturned = false;
    flag = Container();
  }

  if (cardNumber.length == 7 && !flagReturned) {
    try {
      final dynamic result = await http.read('https://binlist.io/lookup/' +
          cardNumber.replaceAll(RegExp(r'\s+\b|\b\s'), ''));

      if (flags[jsonDecode(result)['scheme']] != null) {
        flag = flags[jsonDecode(result)['scheme']];
        flagReturned = true;
      } else {
        flag = Container();
      }
    } catch (e) {}
  }
  return flag;
}

double _flagWidth = 50;

Map<String, dynamic> flags = <String, dynamic>{
  'MASTERCARD': SvgPicture.asset('packages/credit_card/assets/master.svg',
      width: _flagWidth),
  'VISA': SvgPicture.asset('packages/credit_card/assets/visa.svg',
      width: _flagWidth),
  'ELO': SvgPicture.asset('packages/credit_card/assets/elo.svg',
      width: _flagWidth),
  'JCB': SvgPicture.asset('packages/credit_card/assets/jcb.svg',
      width: _flagWidth),
  'DISCOVER': SvgPicture.asset('packages/credit_card/assets/discover.svg',
      width: _flagWidth),
  'DINERS CLUB': SvgPicture.asset('packages/credit_card/assets/diners.svg',
      width: _flagWidth),
  'aura': SvgPicture.asset('packages/credit_card/assets/aura.svg',
      width: _flagWidth),
  'AMERICAN EXPRESS': SvgPicture.asset('packages/credit_card/assets/amex.svg',
      width: _flagWidth),
  'HIPERCARD': SvgPicture.asset('packages/credit_card/assets/hipercard',
      width: _flagWidth)
};
