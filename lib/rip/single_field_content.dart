import 'package:flutter/material.dart';
import 'package:pdf_gen/pages/form_page/widgets.dart';
import 'package:pdf_gen/utils/ui_utils.dart';

class SingleFieldContent extends StatelessWidget {
  final String heading;
  final String label;

  const SingleFieldContent({Key key, this.heading, this.label})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final height = UIUtils().size(context).height;
    final width = UIUtils().size(context).width;

    return Column(
      children: [
        normalTitleText(heading),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: width * 0.9,
              child: FormFieldWidget(
                labelText: label,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
