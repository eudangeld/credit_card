import 'package:credit_card/model/card_model.dart';
import 'package:credit_card/widget/card-flag.dart';
import 'package:flutter/material.dart';
import 'package:credit_card/helper/helper.dart';
import 'package:credit_card/style/styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FrontCard extends StatefulWidget {
  const FrontCard({
    Key key,
    this.model,
  }) : super(key: key);

  @override
  _FrontCardState createState() => _FrontCardState();

  final CardModel model;
}

class _FrontCardState extends State<FrontCard> {
  @override
  Widget build(BuildContext context) {
    final double _cardWidth = widget.model.width ?? size(context).width;
    final double _cardHeight = widget.model.height ??
        (orientation(context) == Orientation.portrait
            ? size(context).height / 3.3
            : size(context).height / 2);

    final double _numberCardHeight = _cardHeight / 2.2;
    final double _chipTopPadding = _numberCardHeight - _cardHeight / 3;
    const double _holderBottomPadding = 20;
    final double _expiryBttonPadding = _numberCardHeight + 37;
    const double _leftPadding = 35;

    return Container(
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          boxShadow: const <BoxShadow>[
            BoxShadow(
                color: Colors.black26, offset: Offset(0, 0), blurRadius: 25)
          ],
          gradient: cardGradient(color: widget.model.backCardColor),
        ),
        width: _cardWidth,
        height: _cardHeight,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: _chipTopPadding,
              right: _leftPadding,
              child: CardFlag(numberController: widget.model.numberController),
            ),
            Positioned(
              left: _leftPadding,
              top: _chipTopPadding,
              child: SvgPicture.asset(
                'packages/credit_card/assets/mcard.svg',
                width: _cardWidth / 7,
              ),
            ),
            Stack(children: <Positioned>[
              Positioned(
                left: _leftPadding,
                top: _numberCardHeight + 1,
                child: Text(
                    widget.model.numberController.text.isEmpty
                        ? numberLabel(widget.model.numberDefaultLabel)
                        : widget.model.numberController.text,
                    style: widget.model.cardNumberStyle != null
                        ? widget.model.cardNumberStyle
                        : cardNumberStyle.copyWith(color: Colors.black)),
              ),
              Positioned(
                  left: _leftPadding,
                  top: _numberCardHeight,
                  child: Text(
                      widget.model.numberController.text.isEmpty
                          ? numberLabel(widget.model.numberDefaultLabel)
                          : widget.model.numberController.text,
                      style: widget.model.cardNumberStyle != null
                          ? widget.model.cardNumberStyle
                          : cardNumberStyle)),
            ]),
            Stack(
              children: <Positioned>[
                Positioned(
                  left: _leftPadding,
                  bottom: _holderBottomPadding,
                  child: Text(
                      widget.model.nameController.text.isEmpty
                          ? nameLabel(widget.model.nameDefaultLabel)
                              .toUpperCase()
                          : widget.model.nameController.text.toUpperCase(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: widget.model.holderNameStyle != null
                          ? widget.model.holderNameStyle
                          : holderNameStyle.copyWith(color: Colors.black)),
                ),
                Positioned(
                  left: _leftPadding,
                  bottom: _holderBottomPadding + 1,
                  child: Text(
                      widget.model.nameController.text.isEmpty
                          ? nameLabel(widget.model.nameDefaultLabel)
                              .toUpperCase()
                          : widget.model.nameController.text.toUpperCase(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: widget.model.holderNameStyle != null
                          ? widget.model.holderNameStyle
                          : holderNameStyle),
                ),
              ],
            ),
            Stack(
              children: <Positioned>[
                Positioned(
                  left: _leftPadding,
                  top: _expiryBttonPadding + 1,
                  child: Text(
                      widget.model.expiryController.text.isEmpty
                          ? expiryLabel(widget.model.expiryDefaultLabel)
                              .toUpperCase()
                          : widget.model.expiryController.text.toUpperCase(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: widget.model.expiryStyle != null
                          ? widget.model.expiryStyle
                          : expiryStyle.copyWith(color: Colors.black)),
                ),
                Positioned(
                  left: _leftPadding,
                  top: _expiryBttonPadding,
                  child: Text(
                      widget.model.expiryController.text.isEmpty
                          ? nameLabel(widget.model.expiryDefaultLabel)
                              .toUpperCase()
                          : widget.model.expiryController.text.toUpperCase(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: widget.model.expiryStyle != null
                          ? widget.model.expiryStyle
                          : expiryStyle),
                ),
              ],
            ),
          ],
        ));
  }
}
