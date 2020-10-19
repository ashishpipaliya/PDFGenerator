import 'dart:convert';
import 'dart:ui';

import 'package:intl/intl.dart';
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
  final blank = "            ";

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
  final affidavitOnStampPaperByClaimant =
      userInputs['affidavit_on_stamppaper_by_claimant'] ?? "No";
  final noObjectionOnStampPaper =
      userInputs['no_objection_on_stamppaper'] ?? "No";
  final copyOfDeathCertificate =
      userInputs['copy_of_death_certificate'] ?? "No";
  final telephoneNo = userInputs['telephone_no'] ?? blank;
  final emailAddress = userInputs['email_address'] ?? blank;
  final dated =
      userInputs['dated'] ?? DateFormat('dd-MM-yyyy').format(DateTime.now());
  final signature = userInputs['signature'] ?? nullSignature;
  final bankName = userInputs['bank_name'] ?? blank;
  final bankBranch = userInputs['bank_branch'] ?? blank;
  final accountNumber = userInputs['account_number'] ?? blank;
  final micrCode = userInputs['micr_code'] ?? blank;
  final telephoneOfBankBranch = userInputs['telephone_of_bankbranch'] ?? blank;

  //Page 2
  final computerNumber = userInputs['computer_no'] ?? blank;
  final fullAddress2 = userInputs['full_address2'] ?? blank;
  final patientName2 = userInputs['patient_name2'] ?? blank;
  final relationship2 = userInputs['relationship_with_cardholder2'] ?? blank;
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

  //Page 3
  final icNumber = userInputs["ic_number"] ?? blank;

  //Page 4
  final iName = userInputs['i_name'] ?? blank;
  final iRelation = userInputs['i_relation'] ?? blank;
  final iRelation2 = userInputs['i_relation2'] ?? blank;
  final iParentName = userInputs['i_parent_name'] ?? blank;
  final iResidentOf = userInputs['i_resident_of'] ?? blank;
  final iDeathDate = userInputs['i_expired_on'] ?? blank;
  final iSlug = userInputs['i_slug'] ?? blank;

  final legalHeir1 = userInputs["legal_heir1"] ?? blank;
  final legalHeir2 = userInputs["legal_heir2"] ?? blank;
  final legalHeir3 = userInputs["legal_heir3"] ?? blank;
  final legalHeir4 = userInputs["legal_heir4"] ?? blank;

  final iSlug2 = userInputs['i_slug2'] ?? blank;
  final paidToName = userInputs['paid_to_name'] ?? blank;

  final heir1Sign = userInputs['heir_1_sign'] ?? nullSignature;
  final heir2Sign = userInputs['heir_2_sign'] ?? nullSignature;
  final heir3Sign = userInputs['heir_3_sign'] ?? nullSignature;
  final heir4Sign = userInputs['heir_4_sign'] ?? nullSignature;

  final heir1Address = userInputs['legal_heir1_address'] ?? blank;
  final heir2Address = userInputs['legal_heir2_address'] ?? blank;
  final heir3Address = userInputs['legal_heir3_address'] ?? blank;
  final heir4Address = userInputs['legal_heir4_address'] ?? blank;

  final PdfImage signatureImage = PdfImage.file(
    pdf.document,
    bytes: base64.decode(signature),
  );

  final PdfImage heir1Signature = PdfImage.file(
    pdf.document,
    bytes: base64.decode(heir1Sign),
  );

  final PdfImage heir2Signature = PdfImage.file(
    pdf.document,
    bytes: base64.decode(heir2Sign),
  );

  final PdfImage heir3Signature = PdfImage.file(
    pdf.document,
    bytes: base64.decode(heir3Sign),
  );

  final PdfImage heir4Signature = PdfImage.file(
    pdf.document,
    bytes: base64.decode(heir4Sign),
  );

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
            "$status",
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
              "$affidavitOnStampPaperByClaimant"),
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
                          margin: EdgeInsets.only(bottom: 5.0),
                          child: Image(signatureImage),
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
          Header(
              level: 1,
              margin: EdgeInsets.symmetric(horizontal: 3.0 * PdfPageFormat.cm),
              child: Text("Computer No. $computerNumber",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      lineSpacing: 2,
                      decoration: TextDecoration.combine([
                        TextDecoration.underline,
                        TextDecoration.overline
                      ])))),
          SizedBox(
              height: containerHeight,
              child: Text("(To be filled by the claimant)")),
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
            "  ",
            heading.entitlement2,
            "$entitlement",
          ),
          leftRightContent(
            "3",
            heading.fullName2,
            "$fullName",
          ),
          leftRightContent(
            "4",
            heading.fullAddress2,
            "$fullAddress2",
          ),
          leftRightContent(
            "5",
            heading.telephone2,
            "$telephoneNo",
          ),
          leftRightContent(
            "6",
            heading.emailAddress2,
            "$emailAddress",
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
                                margin: EdgeInsets.only(bottom: 5.0),
                                child: Image(signatureImage),
                              ),
                              Text("Name.  : $fullName"),
                              Text("IC No. : $icNumber"),
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
                    TextSpan(text: "$iName", style: filledBlankStyle),
                    TextSpan(text: " $iRelation ", style: filledBlankStyle),
                    TextSpan(text: " of "),
                    TextSpan(text: "$iParentName ", style: filledBlankStyle),
                    TextSpan(text: "and resident of "),
                    TextSpan(text: " $iResidentOf ", style: filledBlankStyle),
                    TextSpan(
                        text:
                            "lost/misplaced the original paper or the same are not traceable. I hereby give an undertaking that I have not received any payment against original bills/claim papers from any source and that if the original papers are traced I shall not stake claim against original bills in future and that in the event. If I receive any cheque against original bills in future I shall return the same to competent authority. "),
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
                    TextSpan(text: " $iName ", style: filledBlankStyle),
                    TextSpan(text: " $iRelation ", style: filledBlankStyle),
                    TextSpan(text: " of Late "),
                    TextSpan(text: " $iParentName ", style: filledBlankStyle),
                    TextSpan(text: " and resident of "),
                    TextSpan(text: " $iResidentOf ", style: filledBlankStyle),
                    TextSpan(
                        text:
                            " hereby submit the medical claim papers pertaining to treatment of my "),
                    TextSpan(text: " $iRelation2 ", style: filledBlankStyle),
                    TextSpan(text: " Late "),
                    TextSpan(text: " $iSlug ", style: filledBlankStyle),
                    TextSpan(text: " $iParentName ", style: filledBlankStyle),
                    TextSpan(text: " who has expired on "),
                    TextSpan(text: " $iDeathDate ", style: filledBlankStyle),
                    TextSpan(text: " (copy of Death Certificate is enclosed)."),
                  ]),
                ),
                heightGap(),
                RichText(
                    text: TextSpan(text: "       Late , ", children: [
                  TextSpan(text: " $iSlug ", style: filledBlankStyle),
                  TextSpan(text: " $iParentName ", style: filledBlankStyle),
                  TextSpan(
                      text:
                          " has left behind the following other legal heirs none of whom have any objection if the entire amount reimbursable is paid to me. "),
                ])),
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
                          text: TextSpan(text: "We (i)", children: [
                        TextSpan(
                            text: " $legalHeir1 ", style: filledBlankStyle),
                        TextSpan(text: " S/o  D/o Late Shri  "),
                        TextSpan(
                            text: " $iParentName ", style: filledBlankStyle),
                      ])),
                      RichText(
                          text: TextSpan(text: "(ii)", children: [
                        TextSpan(
                            text: " $legalHeir2 ", style: filledBlankStyle),
                        TextSpan(text: " S/o  D/o Late Shri  "),
                        TextSpan(
                            text: " $iParentName ", style: filledBlankStyle),
                      ])),
                      RichText(
                          text: TextSpan(text: "(iii)", children: [
                        TextSpan(
                            text: " $legalHeir3 ", style: filledBlankStyle),
                        TextSpan(text: " S/o  D/o Late Shri  "),
                        TextSpan(
                            text: " $iParentName ", style: filledBlankStyle),
                      ])),
                      RichText(
                          text: TextSpan(text: "(iv)", children: [
                        TextSpan(
                            text: " $legalHeir4 ", style: filledBlankStyle),
                        TextSpan(text: " S/o  D/o Late Shri  "),
                        TextSpan(
                            text: " $iParentName ", style: filledBlankStyle),
                      ])),
                    ]),
                heightGap(),
                RichText(
                  text: TextSpan(children: [
                    TextSpan(text: " being the legal heirs of Late "),
                    TextSpan(text: " $iSlug $iName ", style: filledBlankStyle),
                    TextSpan(
                        text:
                            " have no objection if the entire amount reimbursable pertaining to the treatment of late "),
                    TextSpan(text: " $iSlug $iName ", style: filledBlankStyle),
                    TextSpan(text: " is paid to "),
                    TextSpan(
                        text: " $iSlug2 $paidToName ", style: filledBlankStyle)
                  ]),
                ),
                heightGap(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 1.5 * PdfPageFormat.inch,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 100,
                            height: 50,
                            margin: EdgeInsets.only(bottom: 5.0),
                            child: Image(heir1Signature),
                          ),
                          Text("Name: $legalHeir1"),
                          Text("Address: $heir1Address"),
                        ],
                      ),
                    ),
                    Container(
                      width: 1.5 * PdfPageFormat.inch,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 100,
                            height: 50,
                            margin: EdgeInsets.only(bottom: 5.0),
                            child: Image(heir2Signature),
                          ),
                          Text("Name: $legalHeir2"),
                          Text("Address: $heir2Address"),
                        ],
                      ),
                    ),
                    Container(
                      width: 1.5 * PdfPageFormat.inch,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 100,
                            height: 50,
                            margin: EdgeInsets.only(bottom: 5.0),
                            child: Image(heir3Signature),
                          ),
                          Text("Name: $legalHeir3"),
                          Text("Address: $heir3Address"),
                        ],
                      ),
                    ),
                    Container(
                      width: 1.5 * PdfPageFormat.inch,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 100,
                            height: 50,
                            margin: EdgeInsets.only(bottom: 5.0),
                            child: Image(heir4Signature),
                          ),
                          Text("Name: $legalHeir4"),
                          Text("Address: $heir4Address"),
                        ],
                      ),
                    )
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
      .toIso8601String()
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
