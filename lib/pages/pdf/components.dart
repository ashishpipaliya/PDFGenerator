import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

const double containerHeight = 20;

Widget heightGap() {
  return SizedBox(height: 20);
}

Widget leftRightContent(String prefix, String heading, String field1) {
  return Container(
      height: containerHeight,
      margin: EdgeInsets.symmetric(vertical: 2),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('$prefix.    '),
                    Container(
                      // color: PdfColor.fromHex("#DA4E31"),
                      width: 3 * PdfPageFormat.inch,
                      child: Text(heading),
                    ),
                    Text(":"),
                  ]),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 3 * PdfPageFormat.inch,
                    // color: PdfColor.fromHex("#3431DA"),
                    child: Center(child: Text(field1)),
                  )
                ],
              ),
            )
          ]));
}

Widget nestedContent(String prefix, String heading, String field1) {
  return Container(
      margin:
          EdgeInsets.symmetric(vertical: 3, horizontal: 0.8 * PdfPageFormat.cm),
      height: containerHeight,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('($prefix)   '),
                  Container(
                    // color: PdfColor.fromHex("#DA4E31"),
                    width: 2.8 * PdfPageFormat.inch,
                    child: Text(heading),
                  ),
                  Text(":"),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 2.8 * PdfPageFormat.inch,
                    // color: PdfColor.fromHex("#3431DA"),
                    child: Center(child: Text(field1)),
                  )
                ],
              ),
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
                width: 2.5 * PdfPageFormat.inch,
                child: Text(heading),
              ),
              Text(":"),
            ],
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 2.5 * PdfPageFormat.inch,
                // color: PdfColor.fromHex("#3431DA"),
                child: Center(child: Text(field1)),
              )
            ],
          ),
        )
      ]));
}

final filledBlankStyle = TextStyle(
    fontWeight: FontWeight.bold, decoration: TextDecoration.underline);
