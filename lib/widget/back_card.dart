import 'package:credit_card/model/card_model.dart';
import 'package:flutter/material.dart';
import 'package:credit_card/helper/helper.dart';
import 'package:credit_card/style/styles.dart';
import 'package:credit_card/widget/card-flag.dart';

class BackCard extends StatefulWidget {
  const BackCard({Key key, this.model}) : super(key: key);

  @override
  _BackCardState createState() => _BackCardState();
  final CardModel model;
}

class _BackCardState extends State<BackCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 0),
            blurRadius: 24,
          ),
        ],
        gradient: cardGradient(color: widget.model.backCardColor),
      ),
      margin: const EdgeInsets.all(16),
      width: widget.model.width ?? size(context).width,
      height: widget.model.height ??
          (orientation(context) == Orientation.portrait
              ? size(context).height / 3.3
              : size(context).height / 2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              margin: const EdgeInsets.only(top: 16),
              height: 48,
              color: Colors.black,
            ),
          ),
          Expanded(
              flex: 2,
              child: Container(
                  margin: const EdgeInsets.only(top: 16),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                            flex: 9,
                            child:
                                Container(height: 48, color: Colors.white70)),
                        Expanded(
                            flex: 3,
                            child: Container(
                                color: Colors.white,
                                child: Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Text(
                                        widget.model.cvvController.text.isEmpty
                                            ? 'XXX'
                                            : widget.model.cvvController.text,
                                        maxLines: 1,
                                        style: widget.model.cvvTextStyle != null
                                            ? widget.model.cvvTextStyle
                                            : cvvTextStyle))))
                      ]))),
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                child:
                    CardFlag(numberController: widget.model.numberController),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
