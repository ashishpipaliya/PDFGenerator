import 'dart:ui';

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
  final entitlement2 = userInputs['entitlement2'] ?? blank;
  final fullname2 = userInputs['full_name2'] ?? blank;
  final fullAddress2 = userInputs['full_address2'] ?? blank;
  final telephoneNo2 = userInputs['telephone_no2'] ?? blank;
  final emailAddress2 = userInputs['email_address2'] ?? blank;
  final bankName2 = userInputs['bank_name2'] ?? blank;
  final bankBranch2 = userInputs['bank_branch2'] ?? blank;
  final accountNumber2 = userInputs['account_number2'] ?? blank;
  final micrCode2 = userInputs['micr_code2'] ?? blank;
  final telephoneOfBankBranch2 =
      userInputs['telephone_of_bankbranch2'] ?? blank;
  final patientName2 = userInputs['patient_name2'] ?? blank;
  final relationship2 = userInputs['relationship2'] ?? blank;
  final status2 = userInputs['status2'] ?? blank;
  final basicPay2 = userInputs['basic_pay2'] ?? blank;
  final opdTreatment2 = userInputs['opd_treatment2'] ?? blank;
  final indoorTreatment2 = userInputs['indoor_treatment2'] ?? blank;
  final dateAdmission2 = userInputs['date_admission2'] ?? blank;
  final dateDischarge2 = userInputs['date_discharge2'] ?? blank;
  final amountClaimedOpdTreatment2 =
      userInputs['amount_claimed_opd_treatment2'] ?? blank;
  final amountClaimedIndoorTreatment2 =
      userInputs['amount_claimed_indoor_treatment2'] ?? blank;
  final detailsOfReferral2 = userInputs['details_of_referral2'] ?? blank;
  final detailsOfMedicalAdvance2 =
      userInputs['details_of_medical_advance2'] ?? blank;
  final name2 = userInputs['name2'] ?? blank;
  final dated2 = userInputs['dated2'] ?? blank;

  //Page 4
  final iName = userInputs['i_name'] ?? blank;
  final iRelation = userInputs['i_relation'] ?? blank;
  final iRelation2 = userInputs['i_relation2'] ?? blank;
  final iParentName = userInputs['i_patient_name'] ?? blank;
  final iResidentOf = userInputs['i_resident_of'] ?? blank;
  final iDeathDate = userInputs['i_expired_on'] ?? blank;
  final iSlug = userInputs['i_slug'] ?? blank;

  //Page 1
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

  //Page 2
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
            "  ",
            heading.entitlement2,
            "$entitlement2",
          ),
          leftRightContent(
            "3",
            heading.fullName2,
            "$fullname2 $fullname2 $fullname2$fullname2$fullname2$fullname2",
          ),
          leftRightContent(
            "4",
            heading.fullAddress2,
            "$fullAddress2",
          ),
          leftRightContent(
            "5",
            heading.telephone2,
            "$telephoneNo2",
          ),
          leftRightContent(
            "6",
            heading.emailAddress2,
            "$emailAddress2",
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("7.    "),
              Container(
                height: 50,
                width: 5 * PdfPageFormat.inch,
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(text: "${subHeading.bankName}  ", children: [
                    TextSpan(
                        text: "$bankName2  ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline))
                  ]),
                  TextSpan(text: "${subHeading.bankBranch}  ", children: [
                    TextSpan(
                        text: "$bankBranch2  ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline))
                  ]),
                  TextSpan(text: " ${subHeading.accountNumber}  ", children: [
                    TextSpan(
                        text: "$accountNumber2  ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline))
                  ]),
                  TextSpan(text: " ${subHeading.micrCode}  ", children: [
                    TextSpan(
                        text: "$micrCode2  ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline))
                  ]),
                  TextSpan(
                      text: "${subHeading.telephoneOfBankBranch}  ",
                      children: [
                        TextSpan(
                            text: "$telephoneOfBankBranch2  ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline))
                      ]),
                ])),
              ),
            ],
          ),
          leftRightContent(
            "8",
            heading.nameAndRelationship,
            "Name : $patientName2 " + "Relationship : $relationship2 ",
          ),
          leftRightContent(
            "9",
            heading.status2,
            "$status2",
          ),
          leftRightContent(
            "10",
            heading.basicPay2,
            "$basicPay2",
          ),
          leftRightContent(
            "11",
            heading.hospitalname2,
            "",
          ),
          nestedContent("a", subHeading.opdTreatment, "$opdTreatment2"),
          nestedContent("b", subHeading.indoorTreatment, "$indoorTreatment2"),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("12.    "),
              Container(
                width: 5.5 * PdfPageFormat.inch,
                child: Center(
                    child: RichText(
                        text: TextSpan(children: [
                  TextSpan(text: " Date of admission  ", children: [
                    TextSpan(
                        text: " $dateAdmission2 ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline))
                  ]),
                  TextSpan(text: " Date of Discharge  ", children: [
                    TextSpan(
                        text: " $dateDischarge2  ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline))
                  ]),
                  TextSpan(text: "(In case of Indoor Treatment only)"),
                ]))),
              ),
            ],
          ),
          leftRightContent("13", heading.totalAmountClaimed2, ""),
          nestedContent(
              "a", subHeading.opdTreatment, "$amountClaimedOpdTreatment2"),
          nestedContent("b", subHeading.indoorTreatment,
              "$amountClaimedIndoorTreatment2"),
          leftRightContent(
            "14",
            heading.referralDetails2,
            "$detailsOfReferral2",
          ),
          leftRightContent(
            "15",
            heading.medicalAdvance2,
            "$detailsOfMedicalAdvance2",
          ),
        ],
      ),
    ),
  );

  //Page 3
  pdf.addPage(
    Page(
        theme: ThemeData(defaultTextStyle: TextStyle(fontSize: 11)),
        pageFormat:
            PdfPageFormat.a4.copyWith(marginBottom: 1.0 * PdfPageFormat.cm),
        build: (context) => Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Header(
                    level: 3,
                    child: Center(
                        child: Text(megaHeading.declaration,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              lineSpacing: 2,
                            )))),
                SizedBox(height: containerHeight),
                Paragraph(
                  text: "      ${heading.declarationPara}",
                ),
                heightGap(),
                Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: 1 * PdfPageFormat.cm),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Text("Dated   : $dated2"),
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
                                margin: EdgeInsets.only(bottom: 5.0),
                                color: PdfColor.fromHex("#000"),
                                child: Text("Signature of Member"),
                              ),
                              Text("Name.  : $name2"),
                              Text("IC No. : IC No"), // TODO IC No.
                            ],
                          )),
                    ],
                  ),
                ),
                heightGap(),
                RichText(
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                    text: "Note: ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                          text: "${heading.declarationPara}",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                          )),
                    ],
                  ),
                ),
                heightGap(),
                Header(
                    level: 3,
                    child: Center(
                        child: Text(megaHeading.information,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              lineSpacing: 2,
                            )))),
                heightGap(),
                Paragraph(text: "${heading.kindlyWriteCorrect}"),
                Paragraph(text: "${heading.obtainBreakupFor}"),
                Paragraph(text: "${heading.draftAnnexure1}"),
                Paragraph(text: "${heading.draftAnnexure2}")
              ],
            )),
  );

  //Page 4
  pdf.addPage(
    Page(
        theme: ThemeData(defaultTextStyle: TextStyle(fontSize: 11)),
        pageFormat:
            PdfPageFormat.a4.copyWith(marginBottom: 1.0 * PdfPageFormat.cm),
        build: (context) => Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Header(
                  level: 3,
                  child: Center(
                      child: Text(
                    megaHeading.draftForAffidavitForDuplicate,
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        lineSpacing: 2,
                        decoration: TextDecoration.underline),
                  )),
                ),
                SizedBox(height: containerHeight),
                RichText(
                  text: TextSpan(text: "I, ", children: [
                    TextSpan(text: "$iName"),
                    TextSpan(
                        text:
                            " $iRelation of $iParentName and resident of $iResidentOf lost/misplaced the original paper or the same are not traceable. I hereby give an undertaking that I have not received any payment against original bills/claim papers from any source and that if the original papers are traced I shall not stake claim against original bills in future and that in the event. If I receive any cheque against original bills in future I shall return the same to competent authority.")
                  ]),
                ),
                heightGap(),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text("Deponent",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("Verify by Notary Public",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ]),
                heightGap(),
                Header(
                  level: 3,
                  child: Center(
                      child: Text(
                    megaHeading.draftForAffidavitOnStampPaper,
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        lineSpacing: 2,
                        decoration: TextDecoration.underline),
                  )),
                ),
                SizedBox(height: containerHeight),
                RichText(
                  text: TextSpan(text: "I, ", children: [
                    TextSpan(text: "$iName"),
                    TextSpan(
                        text:
                            " $iRelation of Late $iParentName and resident of $iResidentOf hereby submit the medical claim papers pertaining to treatment of my $iRelation Late Shri/Smt $iParentName who has expired on $iDeathDate (copy of Death Certificate is enclosed).")
                  ]),
                ),
                heightGap(),
                RichText(
                    text: TextSpan(
                        text:
                            "       Late $iSlug, $iName has left behind the following other legal heirs none of whom have any objection if the entire amount reimbursable is paid to me.")),
                heightGap(),
                Text(megaHeading.noObjectionCertificateSignedBy,
                    style: TextStyle(fontWeight: FontWeight.bold)),
                heightGap(),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text("Deponent"),
                      heightGap(),
                      Text("Deponent"),
                      Text("Verify by Notary Public"),
                    ]),
                heightGap(),
                Header(
                  level: 3,
                  child: Text(
                    megaHeading.draftForNoObjectionCertificateOnStamp,
                    style: TextStyle(
                      lineSpacing: 2,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                heightGap(),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      RichText(
                          text: TextSpan(
                              text: "We (i) $blank S/o  D/o Late Shri $blank")),
                      RichText(
                          text: TextSpan(
                              text: "(ii) $blank S/o  D/o Late Shri $blank")),
                      RichText(
                          text: TextSpan(
                              text: "(iii) $blank S/o  D/o Late Shri $blank")),
                      RichText(
                          text: TextSpan(
                              text: "(iv) $blank S/o  D/o Late Shri $blank")),
                    ]),
                heightGap(),
                RichText(
                    text: TextSpan(
                        text:
                            "being the legal heirs of Late $iSlug $iName have no objection if the entire amount reimbursable pertaining to the treatment of late $iSlug $iName is paid to $iSlug $iName")),
                heightGap(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("(Signature)"),
                        Text("Name: $blank"),
                        Text("Address: $blank"),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("(Signature)"),
                        Text("Name: $blank"),
                        Text("Address: $blank"),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("(Signature)"),
                        Text("Name: $blank"),
                        Text("Address: $blank"),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("(Signature)"),
                        Text("Name: $blank"),
                        Text("Address: $blank"),
                      ],
                    ),
                  ],
                ),
                heightGap(),
                Text("Verify by Notary Public",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
              ],
            )),
  );

  //save PDF
  final String dir = (await getApplicationDocumentsDirectory()).path;
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
