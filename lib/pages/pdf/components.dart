import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

const double containerHeight = 21;

Widget heightGap() {
  return SizedBox(height: 20);
}

Widget leftRightContent(String prefix, String heading, String field1) {
  return Container(
      height: containerHeight,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Expanded(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text('$prefix.    '),
            Container(
              width: 3.5 * PdfPageFormat.inch,
              child: Text(heading),
            ),
            Text(":"),
          ]),
        ),
        Expanded(
          child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Text(field1),
          ]),
        )
      ]));
}

Widget nestedContent(String prefix, String heading, String field1) {
  return Container(
      margin: EdgeInsets.symmetric(horizontal: 0.8 * PdfPageFormat.cm),
      height: containerHeight,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('($prefix)   '),
              Container(
                width: 3.5 * PdfPageFormat.inch,
                child: Text(heading),
              ),
              Text(":"),
            ],
          ),
        ),
        Expanded(
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(field1),
          ]),
        )
      ]));
}

Widget deeplyNestedContent(String prefix, String heading, String field1) {
  return Container(
      margin: EdgeInsets.only(left: 1.5 * PdfPageFormat.cm),
      height: containerHeight,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('$prefix.    '),
              Container(
                width: 3.5 * PdfPageFormat.inch,
                child: Text(heading),
              ),
              Text(":"),
            ],
          ),
        ),
        Expanded(
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(field1),
          ]),
        )
      ]));
}
