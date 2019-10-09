import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:credit_card/style/styles.dart';

class CardModel {
  CardModel({
    this.height,
    this.width,
    this.cardNumberStyle,
    this.cvvTextStyle,
    this.expiryStyle,
    this.holderNameStyle,
    this.backTextStyle,
    this.animeDuration,
    this.frontCardColor,
    this.backCardColor,
    this.numberMask = '0000 0000 0000 0000',
    this.cvvMask = '0000',
    this.expiryMask = '00/00',
    this.numberDefaultLabel,
    this.nameDefaultLabel,
    this.expiryDefaultLabel,
  }) {
    numberController = MaskedTextController(mask: numberMask);
    cvvController = MaskedTextController(mask: cvvMask);
    nameController = TextEditingController();
    expiryController = MaskedTextController(mask: expiryMask);

    animeDuration = animationDuration(animeDuration);
    numberDefaultLabel = numberLabel(numberDefaultLabel);
    expiryDefaultLabel = expiryLabel(expiryDefaultLabel);
    nameDefaultLabel = nameLabel(nameDefaultLabel);

    controllers = <TextEditingController>[
      numberController,
      cvvController,
      nameController,
      expiryController
    ];
  }

  MaskedTextController numberController;
  MaskedTextController cvvController;
  TextEditingController nameController;
  MaskedTextController expiryController;
  String numberDefaultLabel;
  String nameDefaultLabel;
  String expiryDefaultLabel;

  List<TextEditingController> controllers;

  Duration animeDuration;
  final String numberMask;
  final String cvvMask;
  final String expiryMask;
  final double height;
  final double width;
  final TextStyle cardNumberStyle;
  final TextStyle holderNameStyle;
  final TextStyle backTextStyle;
  final TextStyle cvvTextStyle;
  final TextStyle expiryStyle;
  final Color frontCardColor;
  final Color backCardColor;
}
