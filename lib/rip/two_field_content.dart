import 'package:flutter/material.dart';
import 'package:pdf_gen/pages/form_page/widgets.dart';
import 'package:pdf_gen/utils/ui_utils.dart';

class TwoFieldContent extends StatelessWidget {
  final double leftSize;
  final double rightSide;
  final String heading;
  final String leftLabel;
  final String rightLabel;

  const TwoFieldContent(
      {Key key,
      this.leftSize,
      this.rightSide,
      this.heading,
      this.leftLabel,
      this.rightLabel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = UIUtils().size(context).height;
    final width = UIUtils().size(context).width;

    return Container(
      child: Column(
        children: [
          normalTitleText(heading),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: leftSize,
                child: FormFieldWidget(
                  labelText: leftLabel,
                ),
              ),
              Container(
                width: rightSide,
                child: FormFieldWidget(
                  labelText: rightLabel,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
