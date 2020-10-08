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

  final tokenNo = userInputs['token_no'];
  final place = userInputs['place'];
  final fromDate = userInputs['from_date'];
  final toDate = userInputs['to_date'];
  final entitlement = userInputs['entitlement'];
  final fullName = userInputs['full_name'];
  final status = userInputs['status'];
  final medical2004Form = userInputs['medical_2004_form'] ?? "No";
  final copyOfCGHS = userInputs['copy_of_cghs'] ?? "No";
  final copyOfPermissionLetter =
      userInputs['copy_of_permission_letter'] ?? "No";
  final copyOfPrescription = userInputs['copy_of_prescription'] ?? "No";
  final copyOfDischargeSummary =
      userInputs['copy_of_discharge_summary'] ?? "No";
  final copyOfReferral = userInputs['copy_of_referral'] ?? "No";
  final hospitalBreakup = userInputs['hospital_breakup'] ?? "No";
  final numberOfOriginalBills = userInputs['number_of_original_bills'];
  final copiesOfClaimPapers = userInputs['copies_of_claim_papers'] ?? "No";
  final affidavitOnStampPaper = userInputs['affidavit_on_stamppaper'] ?? "No";
  final affidavitOnStampPaper2 = userInputs['affidavit_on_stamppaper2'] ?? "No";
  final noObjectionOnStampPaper =
      userInputs['no_objection_on_stamppaper'] ?? "No";
  final copyOfDeathCertificate =
      userInputs['copy_of_death_certificate'] ?? "No";
  final telephoneNo = userInputs['telephone_no'];
  final emailAddress = userInputs['email_address'];
  final dated = userInputs['dated'];
  final bankName = userInputs['bank_name'];
  final bankBranch = userInputs['bank_branch'];
  final accountNumber = userInputs['account_number'];
  final micrCode = userInputs['micr_code'];
  final telephoneOfBankBranch = userInputs['telephone_of_bankbranch'];

  pdf.addPage(
    MultiPage(
      theme: ThemeData(defaultTextStyle: TextStyle(fontSize: 11)),
      pageFormat:
          PdfPageFormat.a4.copyWith(marginBottom: 1.0 * PdfPageFormat.cm),
      crossAxisAlignment: CrossAxisAlignment.start,
      // header: (Context context) {
      //   return Container(
      //       alignment: Alignment.centerRight,
      //       margin: const EdgeInsets.only(bottom: 3.0 * PdfPageFormat.mm),
      //       padding: const EdgeInsets.only(bottom: 3.0 * PdfPageFormat.mm),
      //       decoration: const BoxDecoration(
      //           border:
      //               BoxBorder(bottom: true, width: 0.5, color: PdfColors.grey)),
      //       child: Text(MegaHeading().megaTitle1,
      //           style: Theme.of(context)
      //               .defaultTextStyle
      //               .copyWith(color: PdfColors.grey)));
      // },

      build: (Context context) => <Widget>[
        Header(
            level: 3,
            margin: EdgeInsets.symmetric(horizontal: 3.0 * PdfPageFormat.cm),
            child: Text(megaHeading.megaTitle1,
                textAlign: TextAlign.center,
                style: TextStyle(
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
        nestedContent(
            "c", subHeading.copyOfPermissionLetter, "$copyOfPermissionLetter"),
        nestedContent(
            "d", subHeading.numberOfOriginalBills, "$numberOfOriginalBills"),
        nestedContent(
            "e", subHeading.copyOfPrescription, "$copyOfPrescription"),
        nestedContent(
            "f", subHeading.copyOfDischargeSummary, "$copyOfDischargeSummary"),
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
        deeplyNestedContent(
            "I", subHeading.affidavitOnStampPaper2, "$affidavitOnStampPaper2"),
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
          child: Paragraph(
              text:
                  "Name of the Bank : $bankName Branch : $bankBranch SB A/C No : $accountNumber Name of the Bank : Bank Name here Branch : Yogichowk SB A/C No : 91516261611 Branch MICR Code : $micrCode Tel.No. of Bank Branch : $telephoneOfBankBranch"),
        ),

        //  Page 1 end
      ],
    ),
  );
  //save PDF
  final String dir = (await getExternalStorageDirectory()).path;
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
