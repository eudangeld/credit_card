import 'package:credit_card/model/card_model.dart';
import 'package:flutter/material.dart';
import 'package:credit_card/helper/helper.dart';
import 'package:credit_card/style/styles.dart';
import 'package:credit_card/widget/card-flag.dart';

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
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: const <BoxShadow>[
          BoxShadow(color: Colors.black26, offset: Offset(0, 0), blurRadius: 24)
        ],
        gradient: cardGradient(color: widget.model.frontCardColor),
      ),
      width: widget.model.width ?? size(context).width,
      height: widget.model.height ??
          (orientation(context) == Orientation.portrait
              ? size(context).height / 4
              : size(context).height / 2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Align(
            alignment: Alignment.topRight,
            child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
                child: CardFlag(
                  numberController: widget.model.numberController,
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, bottom: 25),
            child: Text(
                widget.model.expiryController.text.isEmpty
                    ? 'MM/YY'
                    : widget.model.expiryController.text,
                style: textStyle(widget.model.frontTextStyle)),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 16, right: 16, bottom: 10, top: 50),
            child: Text(
                widget.model.nameController.text.isEmpty
                    ? 'CARD HOLDER'
                    : widget.model.nameController.text,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: textStyle(widget.model.frontTextStyle)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, bottom: 15),
            child: Stack(
              children: [
                Positioned(
                  left: 1,
                  top: 1,
                  child: Text(
                      widget.model.numberController.text.isEmpty
                          ? 'XXXX XXXX XXXX XXXX'
                          : widget.model.numberController.text,
                      style: textStyle(widget.model.frontTextStyle)
                          .copyWith(color: Colors.black)),
                ),
                Positioned(
                  child: Text(
                      widget.model.numberController.text.isEmpty
                          ? 'XXXX XXXX XXXX XXXX'
                          : widget.model.numberController.text,
                      style: textStyle(widget.model.frontTextStyle)),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
