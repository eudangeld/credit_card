import 'dart:math';
import 'package:flutter/material.dart';

Duration animationDuration(Duration duration) =>
    duration != null ? duration : Duration(milliseconds: 500);

String nameLabel(String label) => label != null ? label : 'Card Holder';
String numberLabel(String label) =>
    label != null ? label : '0000 0000 0000 0000';
String expiryLabel(String label) => label != null ? label : 'MM/AA';

Color _textGray = const Color(0xFFD1D3D4);

TextStyle cardNumberStyle = TextStyle(
  color: _textGray,
  letterSpacing: 1.6,
  fontSize: 22,
  fontWeight: FontWeight.bold,
  fontFamily: 'DroidSansMono',
  package: 'credit_card',
);
TextStyle holderNameStyle = TextStyle(
  color: _textGray,
  // letterSpacing: 1.6,
  fontSize: 17,
  fontWeight: FontWeight.bold,
  fontFamily: 'DroidSansMono',
  package: 'credit_card',
);
TextStyle expiryStyle = TextStyle(
  color: _textGray,
  // letterSpacing: 1.6,
  fontSize: 18,
  fontWeight: FontWeight.bold,
  fontFamily: 'DroidSansMono',
  package: 'credit_card',
);
TextStyle cvvTextStyle = TextStyle(
  color: Colors.black,
  // letterSpacing: 1.6,
  fontSize: 18,
  fontWeight: FontWeight.bold,
  fontFamily: 'DroidSansMono',
  package: 'credit_card',
);

int _defaultCardBgColor = 0xffF6482D;

LinearGradient cardGradient({Color color}) {
  final Color _color = color == null ? Color(_defaultCardBgColor) : color;

  return LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    stops: const <double>[0.1, 0.6, 0.8, 0.9],
    colors: <Color>[
      _color.withOpacity(1),
      _color.withOpacity(0.90),
      _color.withOpacity(0.85),
      _color.withOpacity(0.76),
    ],
  );
}

AnimationController animationController(
        {TickerProvider vsync, Duration duration}) =>
    AnimationController(
      duration: duration,
      vsync: vsync,
    );
Animation<double> frontRotation(AnimationController controller) =>
    TweenSequence<double>(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: pi / 2)
              .chain(CurveTween(curve: Curves.easeIn)),
          weight: 50.0,
        ),
        TweenSequenceItem<double>(
          tween: ConstantTween<double>(pi / 2),
          weight: 50.0,
        ),
      ],
    ).animate(controller);
Animation<double> backRotation(AnimationController controller) =>
    TweenSequence<double>(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: ConstantTween<double>(pi / 2),
          weight: 50.0,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: -pi / 2, end: 0.0)
              .chain(CurveTween(curve: Curves.easeOut)),
          weight: 50.0,
        ),
      ],
    ).animate(controller);
