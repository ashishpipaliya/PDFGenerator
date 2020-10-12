import 'package:pdf/pdf.dart';
import 'dart:io';
import 'package:pdf/widgets.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart' as material;
import 'package:pdf_gen/pages/pdf/components.dart';
import 'package:pdf_gen/pages/pdf/pdf_viewer.dart';
import 'package:pdf_gen/pages/pdf/strings.dart';

pdfTemplate(context, Map userInputs) async {
  final Document pdf = Document();
  MegaHeading megaHeading = MegaHeading();
  Heading heading = Heading();
  SubHeading subHeading = SubHeading();
  final blank = "...............";

  final tokenNo = userInputs['token_no'] ?? blank;
  final place = userInputs['place'] ?? blank;
  final fromDate = userInputs['from_date'] ?? blank;
  final toDate = userInputs['to_date'] ?? blank;
  final entitlement = userInputs['entitlement'] ?? blank;
  final fullName = userInputs['full_name'] ?? blank;
  final status = userInputs['status'] ?? blank;
  final medical2004Form = userInputs['medical_2004_form'] ?? "No";
  final copyOfCGHS = userInputs['copy_of_cghs'] ?? "No";
  final copyOfPermissionLetter =
      userInputs['copy_of_permission_letter'] ?? "No";
  final copyOfPrescription = userInputs['copy_of_prescription'] ?? "No";
  final copyOfDischargeSummary =
      userInputs['copy_of_discharge_summary'] ?? "No";
  final copyOfReferral = userInputs['copy_of_referral'] ?? "No";
  final hospitalBreakup = userInputs['hospital_breakup'] ?? "No";
  final numberOfOriginalBills = userInputs['number_of_original_bills'] ?? blank;
  final copiesOfClaimPapers = userInputs['copies_of_claim_papers'] ?? "No";
  final affidavitOnStampPaper = userInputs['affidavit_on_stamppaper'] ?? "No";
  final affidavitOnStampPaper2 = userInputs['affidavit_on_stamppaper2'] ?? "No";
  final noObjectionOnStampPaper =
      userInputs['no_objection_on_stamppaper'] ?? "No";
  final copyOfDeathCertificate =
      userInputs['copy_of_death_certificate'] ?? "No";
  final telephoneNo = userInputs['telephone_no'] ?? blank;
  final emailAddress = userInputs['email_address'] ?? blank;
  final dated = userInputs['dated'] ?? blank;
  final bankName = userInputs['bank_name'] ?? blank;
  final bankBranch = userInputs['bank_branch'] ?? blank;
  final accountNumber = userInputs['account_number'] ?? blank;
  final micrCode = userInputs['micr_code'] ?? blank;
  final telephoneOfBankBranch = userInputs['telephone_of_bankbranch'] ?? blank;

  //Page 2
  final tokenNo2 = userInputs['token_no2'] ?? blank;
  final place2 = userInputs['place2'] ?? blank;
  final fromDate2 = userInputs['from_date2'] ?? blank;
  final toDate2 = userInputs['to_date2'] ?? blank;
  final entitlement2 = userInputs['entitlement'] ?? blank;

  pdf.addPage(
    Page(
      theme: ThemeData(defaultTextStyle: TextStyle(fontSize: 11)),
      pageFormat:
          PdfPageFormat.a4.copyWith(marginBottom: 1.0 * PdfPageFormat.cm),
      build: (Context context) => Column(
        children: [
          Header(
              level: 3,
              margin: EdgeInsets.symmetric(horizontal: 3.0 * PdfPageFormat.cm),
              child: Text(megaHeading.megaTitle1,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      lineSpacing: 2,
                      decorationThickness: 2.0))),
          SizedBox(height: containerHeight),
          leftRightContent(
            "1",
            heading.tokenAndPlace,
            tokenNo + "    " + place,
          ),
          leftRightContent(
            "2",
            heading.validityOfcghsCard,
            "from : $fromDate" + "    " + "to : $toDate",
          ),
          leftRightContent(
            "3",
            heading.entitlement,
            "$entitlement",
          ),
          leftRightContent(
            "4",
            heading.fullName,
            "$fullName",
          ),
          leftRightContent(
            "5",
            heading.status,
            status,
          ),
          leftRightContent(
            "6",
            heading.documentsAreSubmitted,
            "(Please tick the relevant column)",
          ),

          heightGap(),
          //  Nested lines with a, b, c, d...
          nestedContent("a", subHeading.medical2004, "$medical2004Form"),
          nestedContent("b", subHeading.copyOfCGHS, "$copyOfCGHS"),
          nestedContent("c", subHeading.copyOfPermissionLetter,
              "$copyOfPermissionLetter"),
          nestedContent(
              "d", subHeading.numberOfOriginalBills, "$numberOfOriginalBills"),
          nestedContent(
              "e", subHeading.copyOfPrescription, "$copyOfPrescription"),
          nestedContent("f", subHeading.copyOfDischargeSummary,
              "$copyOfDischargeSummary"),
          nestedContent("g", subHeading.copyOfReferral, "$copyOfReferral"),
          nestedContent("h", subHeading.hospitalBreakup, "$hospitalBreakup"),
          nestedContent("i", subHeading.originalpapersLost, ""),

          //deeply nested I, II, ....
          deeplyNestedContent(
              "I", subHeading.copiesOfClaimPapers, "$copiesOfClaimPapers"),
          deeplyNestedContent(
              "II", subHeading.affidavitOnStampPaper, "$affidavitOnStampPaper"),
          heightGap(),
          //  Nested lines with a, b, c, d...
          nestedContent("j", subHeading.inCaseOfDeath, ""),
          //deeply nested I, II, ....
          deeplyNestedContent("I", subHeading.affidavitOnStampPaper2,
              "$affidavitOnStampPaper2"),
          deeplyNestedContent("II", subHeading.noObjectionOnStampPaper,
              "$noObjectionOnStampPaper"),
          deeplyNestedContent(
              "III", subHeading.copyOfDeathCerti, "$copyOfDeathCertificate"),
          heightGap(),

          // bottom stuffs
          Container(
            margin: EdgeInsets.symmetric(horizontal: 1 * PdfPageFormat.cm),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 3,
                  child: Text("Dated   : $dated"),
                ),
                Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 100,
                          height: 50,
                          color: PdfColor.fromHex("#000"),
                          child: Text("Signature of CGHS card holder"),
                        ),
                        Text("Tel. No.  : $telephoneNo"),
                        Text("e-mail address  : $emailAddress"),
                      ],
                    )),
              ],
            ),
          ),
          heightGap(),
          //  bottom paragraph
          Container(
            margin: EdgeInsets.symmetric(horizontal: 1 * PdfPageFormat.cm),
            child: RichText(
                text: TextSpan(children: [
              TextSpan(text: "${subHeading.bankName}  ", children: [
                TextSpan(
                    text: "$bankName  ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline))
              ]),
              TextSpan(text: "${subHeading.bankBranch}  ", children: [
                TextSpan(
                    text: "$bankBranch  ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline))
              ]),
              TextSpan(text: " ${subHeading.accountNumber}  ", children: [
                TextSpan(
                    text: "$accountNumber  ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline))
              ]),
              TextSpan(text: " ${subHeading.micrCode}  ", children: [
                TextSpan(
                    text: "$micrCode  ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline))
              ]),
              TextSpan(
                  text: "${subHeading.telephoneOfBankBranch}  ",
                  children: [
                    TextSpan(
                        text: "$telephoneOfBankBranch  ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline))
                  ]),
            ])),
          ),
        ],
      ),
    ),
  );

  pdf.addPage(
    Page(
      theme: ThemeData(defaultTextStyle: TextStyle(fontSize: 11)),
      pageFormat:
          PdfPageFormat.a4.copyWith(marginBottom: 1.0 * PdfPageFormat.cm),
      build: (context) => Column(
        children: [
          Header(
              level: 3,
              margin: EdgeInsets.symmetric(horizontal: 3.0 * PdfPageFormat.cm),
              child: Text(megaHeading.megaTitle2,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    lineSpacing: 2,
                  ))),
          SizedBox(height: containerHeight),
          leftRightContent(
            "1",
            heading.tokenAndPlace,
            tokenNo2 + "    " + place2,
          ),
          leftRightContent(
            "2",
            heading.validityOfcghsCard,
            "from : $fromDate2" + "    " + "to : $toDate2",
          ),
          leftRightContent(
            "2",
            heading.entitlement2,
            "$entitlement2",
          ),
        ],
      ),
    ),
  );

  //save PDF
  final String dir = (await getApplicationDocumentsDirectory()).absolute.path;
  var fileName = DateTime.now()
      .toLocal()
      .toString()
      .replaceAll(" ", "")
      .replaceAll(":", "")
      .replaceAll(".", "");
  final String path = '$dir/$fileName.pdf';
  final File file = File(path);
  await file.writeAsBytes(pdf.save());
  material.Navigator.of(context).push(
    material.MaterialPageRoute(
      builder: (_) => PDFViewer(path: path),
    ),
  );
}
