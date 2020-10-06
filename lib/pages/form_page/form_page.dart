import 'package:flutter/material.dart';
import 'package:flutter_signature_pad/flutter_signature_pad.dart';
import 'package:pdf_gen/constants.dart';
import 'package:pdf_gen/pages/form_page/widgets.dart';
import 'package:pdf_gen/shared/color_palette.dart';
import 'package:pdf_gen/utils/ui_utils.dart';

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  @override
  Widget build(BuildContext context) {
    final height = UIUtils().size(context).height;
    final width = UIUtils().size(context).width;

    MegaHeading megaHeading = MegaHeading();
    Heading heading = Heading();
    SubHeading subHeading = SubHeading();

    TextEditingController tokenNo = TextEditingController();
    TextEditingController place = TextEditingController();

    double twoFieldWidth = width * 0.45;
    double singleFieldWidth = width * 0.9;

    // onChnaged variables for checkbox
    bool _medical2004Form = false;
    bool _hospitalBreakup = false;
    bool _copyOfReferral = false;
    bool _copyOfDischargeSummary = false;
    bool _copyOfPrescription = false;
    bool _copyOfPermissionLetter = false;
    bool _copyOfCGHS = false;

    bool _copiesOfClaimPapers = false;
    bool _affidavitOnStampPaper = false;
    bool _affidavitOnStampPaper2 = false;
    bool _noObjectionOnStampPaper = false;
    bool _copyOfDeathCerti = false;

    String from = "From";
    String to = "To";

    Map<String, String> userInputs = {};

    return Scaffold(
      appBar: AppBar(
        title: Text("Fill the form"),
      ),
      body: Container(
        width: width,
        height: height,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(15.0),
          physics: ScrollPhysics(),
          child: Form(
              child: Column(
            children: [
              titleText(megaHeading.megaTitle1),
              normalTitleText(heading.tokenAndPlace),
              Wrap(
                direction: Axis.horizontal,
                alignment: WrapAlignment.spaceBetween,
                children: [
                  Container(
                    width: twoFieldWidth,
                    child: FormFieldWidget(
                      controller: tokenNo,
                      labelText: "Token No.",
                      onChanged: (value) {
                        userInputs["token_no"] = value;
                        print(userInputs);
                      },
                    ),
                  ),
                  Container(
                    width: twoFieldWidth,
                    child: FormFieldWidget(
                      controller: place,
                      labelText: "Place",
                      onChanged: (value) {
                        userInputs["place"] = value;
                        print(userInputs);
                      },
                    ),
                  ),
                ],
              ),
              normalTitleText(heading.validityOfcghsCard),
              Wrap(
                //TODO
                direction: Axis.horizontal,
                alignment: WrapAlignment.spaceBetween,
                children: [
                  Container(
                    width: twoFieldWidth,
                    child: FlatButton(
                      onPressed: () {},
                      child: Text(from),
                    ),
                  ),
                  Container(
                    width: twoFieldWidth,
                    child: FlatButton(
                      onPressed: () {},
                      child: Text(to),
                    ),
                  ),
                ],
              ),
              normalTitleText(heading.entitlement),
              Wrap(
                //TODO
                direction: Axis.horizontal,
                alignment: WrapAlignment.spaceBetween,
                children: [
                  Container(
                    width: singleFieldWidth,
                    child: FormFieldWidget(
                      labelText: "Entitlement",
                    ),
                  ),
                ],
              ),
              normalTitleText(heading.fullName),
              Wrap(
                direction: Axis.horizontal,
                alignment: WrapAlignment.spaceBetween,
                children: [
                  Container(
                    width: singleFieldWidth,
                    child: FormFieldWidget(
                      labelText: "Full name",
                      onChanged: (value) {
                        userInputs["full_name"] = value;
                        print(userInputs);
                      },
                    ),
                  ),
                ],
              ),
              normalTitleText(heading.status),
              Wrap(
                direction: Axis.horizontal,
                alignment: WrapAlignment.spaceBetween,
                children: [
                  Container(
                    width: singleFieldWidth,
                    child: FormFieldWidget(
                      labelText: "Select Status",
                      //  TODO: DropDown
                    ),
                  ),
                ],
              ),
              normalTitleText(heading.documentsAreSubmitted),
              Wrap(
                direction: Axis.horizontal,
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Card(
                    elevation: 0.5,
                    child: StatefulBuilder(
                        builder: (BuildContext context, StateSetter setState) {
                      return CheckboxListTile(
                        value: _medical2004Form,
                        title: Text(subHeading.medical2004),
                        checkColor: ColorPalette.darkPurple,
                        activeColor: ColorPalette.white,
                        onChanged: (value) {
                          setState(() {
                            _medical2004Form = value;
                            userInputs["medical_2004_form"] = value.toString();
                            print(userInputs);
                          });
                        },
                      );
                    }),
                  ),
                  Card(
                    elevation: 0.5,
                    child: StatefulBuilder(
                        builder: (BuildContext context, StateSetter setState) {
                      return CheckboxListTile(
                        value: _copyOfCGHS,
                        title: Text(subHeading.copyOfCGHS),
                        checkColor: ColorPalette.darkPurple,
                        activeColor: ColorPalette.white,
                        onChanged: (value) {
                          setState(() {
                            _copyOfCGHS = value;
                            userInputs["copy_of_cghs"] = value.toString();
                            print(userInputs);
                          });
                        },
                      );
                    }),
                  ),
                  Card(
                    elevation: 0.5,
                    child: StatefulBuilder(
                        builder: (BuildContext context, StateSetter setState) {
                      return CheckboxListTile(
                        value: _copyOfPermissionLetter,
                        title: Text(subHeading.copyOfPermissionLetter),
                        checkColor: ColorPalette.darkPurple,
                        activeColor: ColorPalette.white,
                        onChanged: (value) {
                          setState(() {
                            _copyOfPermissionLetter = value;
                            userInputs["copy_of_permission_letter"] =
                                value.toString();
                          });
                        },
                      );
                    }),
                  ),
                  Card(
                    elevation: 0.5,
                    child: StatefulBuilder(
                        builder: (BuildContext context, StateSetter setState) {
                      return CheckboxListTile(
                        value: _copyOfPrescription,
                        title: Text(subHeading.copyOfPrescription),
                        checkColor: ColorPalette.darkPurple,
                        activeColor: ColorPalette.white,
                        onChanged: (value) {
                          setState(() {
                            _copyOfPrescription = value;
                            userInputs["copy_of_prescription"] =
                                value.toString();
                          });
                        },
                      );
                    }),
                  ),
                  Card(
                    elevation: 0.5,
                    child: StatefulBuilder(
                        builder: (BuildContext context, StateSetter setState) {
                      return CheckboxListTile(
                        value: _copyOfDischargeSummary,
                        title: Text(subHeading.copyOfDischargeSummary),
                        checkColor: ColorPalette.darkPurple,
                        activeColor: ColorPalette.white,
                        onChanged: (value) {
                          setState(() {
                            _copyOfDischargeSummary = value;
                            userInputs["copy_of_discharge_summary"] =
                                value.toString();
                          });
                        },
                      );
                    }),
                  ),
                  Card(
                    elevation: 0.5,
                    child: StatefulBuilder(
                        builder: (BuildContext context, StateSetter setState) {
                      return CheckboxListTile(
                        value: _copyOfReferral,
                        title: Text(subHeading.copyOfReferral),
                        checkColor: ColorPalette.darkPurple,
                        activeColor: ColorPalette.white,
                        onChanged: (value) {
                          setState(() {
                            _copyOfReferral = value;
                            userInputs["copy_of_referral"] = value.toString();
                          });
                        },
                      );
                    }),
                  ),
                  Card(
                    elevation: 0.5,
                    child: StatefulBuilder(
                        builder: (BuildContext context, StateSetter setState) {
                      return CheckboxListTile(
                        value: _hospitalBreakup,
                        title: Text(subHeading.hospitalBreakup),
                        checkColor: ColorPalette.darkPurple,
                        activeColor: ColorPalette.white,
                        onChanged: (value) {
                          setState(() {
                            _hospitalBreakup = value;
                            userInputs["hospital_breakup"] = value.toString();
                          });
                        },
                      );
                    }),
                  ),
                  Container(
                    width: singleFieldWidth,
                    child: FormFieldWidget(
                      labelText: subHeading.numberOfOriginalBills,
                      onChanged: (value) {
                        userInputs["number_of_original_bills"] = value;
                        print(userInputs);
                      },
                    ),
                  ),
                ],
              ),
              smallTitleText(
                  "Original papers have been lost & the following documents are submitted"),
              Wrap(
                  direction: Axis.horizontal,
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Card(
                      elevation: 0.5,
                      child: StatefulBuilder(builder:
                          (BuildContext context, StateSetter setState) {
                        return CheckboxListTile(
                          value: _copiesOfClaimPapers,
                          title: Text(subHeading.copiesOfClaimPapers),
                          checkColor: ColorPalette.darkPurple,
                          activeColor: ColorPalette.white,
                          onChanged: (value) {
                            setState(() {
                              _copiesOfClaimPapers = value;
                              userInputs["copies_of_claim_papers"] =
                                  value.toString();
                              print(userInputs);
                            });
                          },
                        );
                      }),
                    ),
                    Card(
                      elevation: 0.5,
                      child: StatefulBuilder(builder:
                          (BuildContext context, StateSetter setState) {
                        return CheckboxListTile(
                          value: _affidavitOnStampPaper,
                          title: Text(subHeading.affidavitOnStampPaper),
                          checkColor: ColorPalette.darkPurple,
                          activeColor: ColorPalette.white,
                          onChanged: (value) {
                            setState(() {
                              _affidavitOnStampPaper = value;
                              userInputs["affidavit_on_stamppaper"] =
                                  value.toString();
                              print(userInputs);
                            });
                          },
                        );
                      }),
                    ),
                  ]),
              smallTitleText(
                  "Incase of death of card holder the following documents are submitted"),
              Wrap(
                  direction: Axis.horizontal,
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Card(
                      elevation: 0.5,
                      child: StatefulBuilder(builder:
                          (BuildContext context, StateSetter setState) {
                        return CheckboxListTile(
                          value: _affidavitOnStampPaper2,
                          title: Text(subHeading.affidavitOnStampPaper2),
                          checkColor: ColorPalette.darkPurple,
                          activeColor: ColorPalette.white,
                          onChanged: (value) {
                            setState(() {
                              _affidavitOnStampPaper2 = value;
                              userInputs["affidavit_on_stamppaper2"] =
                                  value.toString();
                              print(userInputs);
                            });
                          },
                        );
                      }),
                    ),
                    Card(
                      elevation: 0.5,
                      child: StatefulBuilder(builder:
                          (BuildContext context, StateSetter setState) {
                        return CheckboxListTile(
                          value: _noObjectionOnStampPaper,
                          title: Text(subHeading.noObjectionOnStampPaper),
                          checkColor: ColorPalette.darkPurple,
                          activeColor: ColorPalette.white,
                          onChanged: (value) {
                            setState(() {
                              _noObjectionOnStampPaper = value;
                              userInputs["no_objection_on_stamppaper"] =
                                  value.toString();
                              print(userInputs);
                            });
                          },
                        );
                      }),
                    ),
                    Card(
                      elevation: 0.5,
                      child: StatefulBuilder(builder:
                          (BuildContext context, StateSetter setState) {
                        return CheckboxListTile(
                          value: _copyOfDeathCerti,
                          title: Text(subHeading.copyOfDeathCerti),
                          checkColor: ColorPalette.darkPurple,
                          activeColor: ColorPalette.white,
                          onChanged: (value) {
                            setState(() {
                              _copyOfDeathCerti = value;
                              userInputs["copy_of_death_certificate"] =
                                  value.toString();
                              print(userInputs);
                            });
                          },
                        );
                      }),
                    ),
                  ]),
              Wrap(
                direction: Axis.horizontal,
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Container(
                    width: singleFieldWidth,
                    child: FormFieldWidget(
                      labelText: "Dated",
                      onChanged: (value) {
                        //TODO
                        userInputs["dated"] = value;
                        print(userInputs);
                      },
                    ),
                  ),
                  Container(
                    width: singleFieldWidth,
                    child: FormFieldWidget(
                      labelText: "Telephone No.",
                      onChanged: (value) {
                        userInputs["telephone_no"] = value;
                        print(userInputs);
                      },
                    ),
                  ),
                  Container(
                    width: singleFieldWidth,
                    child: FormFieldWidget(
                      labelText: "E-mail Address",
                      onChanged: (value) {
                        userInputs["email_address"] = value;
                        print(userInputs);
                      },
                    ),
                  ),
                  Container(
                    height: 200,
                    color: ColorPalette.cream,
                    width: singleFieldWidth,
                    child: Center(
                      //TODO
                      child: Center(
                        child: Text("Signature of CGHS card holder Logic Here"),
                      ),
                    ),
                  ),
                ],
              ),
              smallTitleText("Bank Details"),
              Wrap(
                direction: Axis.horizontal,
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Container(
                    width: singleFieldWidth,
                    child: FormFieldWidget(
                      labelText: subHeading.bankName,
                      onChanged: (value) {
                        userInputs["bank_name"] = value;
                        print(userInputs);
                      },
                    ),
                  ),
                  Container(
                    width: singleFieldWidth,
                    child: FormFieldWidget(
                      labelText: subHeading.branch,
                      onChanged: (value) {
                        userInputs["bank_branch"] = value;
                        print(userInputs);
                      },
                    ),
                  ),
                  Container(
                    width: singleFieldWidth,
                    child: FormFieldWidget(
                      labelText: subHeading.accountNumber,
                      onChanged: (value) {
                        userInputs["account_number"] = value;
                        print(userInputs);
                      },
                    ),
                  ),
                  Container(
                    width: singleFieldWidth,
                    child: FormFieldWidget(
                      labelText: subHeading.micrCode,
                      onChanged: (value) {
                        userInputs["micr_code"] = value;
                        print(userInputs);
                      },
                    ),
                  ),
                  Container(
                    width: singleFieldWidth,
                    child: FormFieldWidget(
                      labelText: subHeading.telephoneOfBankBranch,
                      onChanged: (value) {
                        userInputs["telephone_of_bankbranch"] = value;
                        print(userInputs);
                      },
                    ),
                  ),
                ],
              ),
            ],
          )),
        ),
      ),
    );
  }

  DateTime dateFrom = DateTime.now();
  DateTime dateTo = DateTime.now();

  Future<Null> selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: dateFrom,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2022, 8));
    if (picked != null && picked != dateFrom)
      setState(() {
        dateFrom = picked;
      });
  }
}
