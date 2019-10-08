import 'package:flutter/material.dart';
import 'package:credit_card/style/styles.dart';
import 'package:credit_card/widget/animation_card.dart';
import 'package:credit_card/widget/back_card.dart';
import 'package:credit_card/widget/front_card.dart';

import 'model/card_model.dart';

class CreditCard extends StatefulWidget {
  const CreditCard({
    Key key,
    @required this.showBackView,
    @required this.cardModel,
  }) : super(key: key);

  final bool showBackView;
  final CardModel cardModel;

  @override
  _CreditCardState createState() => _CreditCardState();
}

class _CreditCardState extends State<CreditCard>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> _frontRotation;
  Animation<double> _backRotation;
  Gradient backgroundGradientColor;

  String numberString;
  bool isAmex = false;

  @override
  void dispose() {
    controller.dispose();
    widget.cardModel.controllers.forEach((f) => f.dispose());
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    widget.cardModel.controllers
        .forEach((f) => f.addListener(() => setState(() {})));

    controller = animationController(
      duration: widget.cardModel.animeDuration,
      vsync: this,
    );

    _frontRotation = frontRotation(controller);
    _backRotation = backRotation(controller);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.showBackView) {
      controller.forward();
    } else {
      controller.reverse();
    }

    return Stack(
      children: <Widget>[
        AnimationCard(
          animation: _frontRotation,
          child: FrontCard(model: widget.cardModel),
        ),
        AnimationCard(
          animation: _backRotation,
          child: BackCard(model: widget.cardModel),
        ),
      ],
    );
  }
}
