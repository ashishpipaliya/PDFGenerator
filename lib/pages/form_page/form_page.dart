import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pdf_gen/constants.dart';
import 'package:pdf_gen/pages/form_page/widgets.dart';
import 'package:pdf_gen/pages/pdf/pdf_templetate.dart';
import 'package:pdf_gen/shared/color_palette.dart';
import 'package:pdf_gen/utils/ui_utils.dart';
import 'package:intl/intl.dart';

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  FocusNode tokenNumberNode;
  FocusNode placeNode;
  FocusNode fullNameNode;
  FocusNode numberOfOriginalBillsNode;
  FocusNode datedNode;
  FocusNode telephoneNode;
  FocusNode emailNode;
  FocusNode bankNameNode;
  FocusNode branchNode;
  FocusNode accountNumberNode;
  FocusNode micrCodeNode;
  FocusNode telephoneOfBankBranchNode;

  @override
  void initState() {
    super.initState();

    tokenNumberNode = FocusNode();
    placeNode = FocusNode();
    fullNameNode = FocusNode();
    numberOfOriginalBillsNode = FocusNode();
    datedNode = FocusNode();
    telephoneNode = FocusNode();
    emailNode = FocusNode();
    bankNameNode = FocusNode();
    branchNode = FocusNode();
    accountNumberNode = FocusNode();
    micrCodeNode = FocusNode();
    telephoneOfBankBranchNode = FocusNode();
  }

  @override
  void dispose() {
    tokenNumberNode.dispose();
    placeNode.dispose();
    numberOfOriginalBillsNode.dispose();
    datedNode.dispose();
    telephoneNode.dispose();
    emailNode.dispose();
    bankNameNode.dispose();
    branchNode.dispose();
    accountNumberNode.dispose();
    micrCodeNode.dispose();
    telephoneOfBankBranchNode.dispose();
    super.dispose();
  }

  MegaHeading megaHeading = MegaHeading();
  Heading heading = Heading();
  SubHeading subHeading = SubHeading();

  // onChanged variables for Dropdowns
  String _entitlementSelected = entitlement[0];
  String _statusSelected = status[0];

  // onChnaged variables for checkboxes
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

  Map<String, String> userInputs = {};

  DateTime fromDate = DateTime.now();
  DateTime toDate = DateTime.now();
  DateTime dated = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final height = UIUtils().size(context).height;
    final width = UIUtils().size(context).width;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Container(
                        child: FormFieldWidget(
                          labelText: "Token No.",
                          onChanged: (value) {
                            userInputs["token_no"] = value;
                            print(userInputs);
                          },
                          focusNode: tokenNumberNode,
                          onSubmitted: (_) {
                            FocusScope.of(context).requestFocus(placeNode);
                          },
                        ),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        child: FormFieldWidget(
                          labelText: "Place",
                          onChanged: (value) {
                            userInputs["place"] = value;
                            print(userInputs);
                          },
                          focusNode: placeNode,
                          onSubmitted: (_) {
                            FocusScope.of(context).requestFocus(fullNameNode);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                normalTitleText(heading.validityOfcghsCard),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(
                        child: ListTile(
                            title: Text(
                                "${fromDate.day}-${fromDate.month}-${fromDate.year}"),
                            subtitle: Text("From"),
                            trailing: Icon(Icons.calendar_today),
                            onTap: () async {
                              DateTime picked = await showDatePicker(
                                context: context,
                                initialDate: fromDate,
                                firstDate: DateTime(DateTime.now().year - 10),
                                lastDate: DateTime(DateTime.now().year + 10),
                              );
                              if (picked != null)
                                setState(() {
                                  fromDate = picked;
                                  userInputs["from_date"] =
                                      DateFormat('dd-MM-yyyy').format(picked);
                                  print(userInputs);
                                });
                            })),
                    Flexible(
                        child: ListTile(
                            title: Text(
                                "${toDate.day}-${toDate.month}-${toDate.year}"),
                            subtitle: Text("To"),
                            trailing: Icon(Icons.calendar_today),
                            onTap: () async {
                              DateTime picked = await showDatePicker(
                                context: context,
                                initialDate: toDate,
                                firstDate: DateTime(DateTime.now().year - 10),
                                lastDate: DateTime(DateTime.now().year + 10),
                              );
                              if (picked != null)
                                setState(() {
                                  toDate = picked;
                                  userInputs["to_date"] =
                                      DateFormat('dd-MM-yyyy').format(picked);
                                  print(userInputs);
                                });
                            })),
                  ],
                ),
                normalTitleText(heading.entitlement),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: DropdownButtonHideUnderline(
                        child: Card(
                          elevation: 3.0,
                          child: DropdownButton(
                            value: _entitlementSelected,
                            items: entitlement.map((String item) {
                              return DropdownMenuItem<String>(
                                value: item,
                                child: Text(item),
                              );
                            }).toList(),
                            onChanged: (String value) {
                              setState(() {
                                this._entitlementSelected = value;
                                userInputs["entitlement"] = value;
                                print(userInputs);
                              });
                            },
                            dropdownColor: ColorPalette.superlightPurple,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                normalTitleText(heading.fullName),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Container(
                        child: FormFieldWidget(
                          labelText: heading.fullName,
                          onChanged: (value) {
                            userInputs["full_name"] = value;
                            print(userInputs);
                          },
                          focusNode: fullNameNode,
                          onSubmitted: (_) {
                            FocusScope.of(context)
                                .requestFocus(numberOfOriginalBillsNode);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                normalTitleText(heading.status),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Card(
                        elevation: 3.0,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            value: _statusSelected,
                            items: status.map((String dropdownItem) {
                              return DropdownMenuItem<String>(
                                value: dropdownItem,
                                child: Text(dropdownItem),
                              );
                            }).toList(),
                            onChanged: (String value) {
                              setState(() {
                                this._statusSelected = value;
                                userInputs["status"] = value;
                                print(userInputs);
                              });
                            },
                            dropdownColor: ColorPalette.superlightPurple,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                normalTitleText(heading.documentsAreSubmitted),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Card(
                      elevation: 0.5,
                      child: StatefulBuilder(builder:
                          (BuildContext context, StateSetter setState) {
                        return CheckboxListTile(
                          value: _medical2004Form,
                          title: Text(subHeading.medical2004),
                          checkColor: ColorPalette.darkPurple,
                          activeColor: ColorPalette.white,
                          onChanged: (value) {
                            setState(() {
                              _medical2004Form = value;
                              userInputs["medical_2004_form"] =
                                  value ? "Yes" : "No";
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
                          value: _copyOfCGHS,
                          title: Text(subHeading.copyOfCGHS),
                          checkColor: ColorPalette.darkPurple,
                          activeColor: ColorPalette.white,
                          onChanged: (value) {
                            setState(() {
                              _copyOfCGHS = value;
                              userInputs["copy_of_cghs"] = value ? "Yes" : "No";
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
                          value: _copyOfPermissionLetter,
                          title: Text(subHeading.copyOfPermissionLetter),
                          checkColor: ColorPalette.darkPurple,
                          activeColor: ColorPalette.white,
                          onChanged: (value) {
                            setState(() {
                              _copyOfPermissionLetter = value;
                              userInputs["copy_of_permission_letter"] =
                                  value ? "Yes" : "No";
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
                          value: _copyOfPrescription,
                          title: Text(subHeading.copyOfPrescription),
                          checkColor: ColorPalette.darkPurple,
                          activeColor: ColorPalette.white,
                          onChanged: (value) {
                            setState(() {
                              _copyOfPrescription = value;
                              userInputs["copy_of_prescription"] =
                                  value ? "Yes" : "No";
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
                          value: _copyOfDischargeSummary,
                          title: Text(subHeading.copyOfDischargeSummary),
                          checkColor: ColorPalette.darkPurple,
                          activeColor: ColorPalette.white,
                          onChanged: (value) {
                            setState(() {
                              _copyOfDischargeSummary = value;
                              userInputs["copy_of_discharge_summary"] =
                                  value ? "Yes" : "No";
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
                          value: _copyOfReferral,
                          title: Text(subHeading.copyOfReferral),
                          checkColor: ColorPalette.darkPurple,
                          activeColor: ColorPalette.white,
                          onChanged: (value) {
                            setState(() {
                              _copyOfReferral = value;
                              userInputs["copy_of_referral"] =
                                  value ? "Yes" : "No";
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
                          value: _hospitalBreakup,
                          title: Text(subHeading.hospitalBreakup),
                          checkColor: ColorPalette.darkPurple,
                          activeColor: ColorPalette.white,
                          onChanged: (value) {
                            setState(() {
                              _hospitalBreakup = value;
                              userInputs["hospital_breakup"] =
                                  value ? "Yes" : "No";
                            });
                          },
                        );
                      }),
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: FormFieldWidget(
                            labelText: subHeading.numberOfOriginalBills,
                            onChanged: (value) {
                              userInputs["number_of_original_bills"] = value;
                              print(userInputs);
                            },
                            focusNode: numberOfOriginalBillsNode,
                            onSubmitted: (_) {
                              FocusScope.of(context).requestFocus(datedNode);
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                smallTitleText(subHeading.originalpapersLost),
                Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
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
                                    value ? "Yes" : "No";
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
                                    value ? "Yes" : "No";
                                print(userInputs);
                              });
                            },
                          );
                        }),
                      ),
                    ]),
                smallTitleText(subHeading.inCaseOfDeath),
                Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
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
                                    value ? "Yes" : "No";
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
                                    value ? "Yes" : "No";
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
                                    value ? "Yes" : "No";
                                print(userInputs);
                              });
                            },
                          );
                        }),
                      ),
                    ]),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: FormFieldWidget(
                            labelText: "Telephone No.",
                            onChanged: (value) {
                              userInputs["telephone_no"] = value;
                              print(userInputs);
                            },
                            focusNode: telephoneNode,
                            onSubmitted: (_) {
                              FocusScope.of(context).requestFocus(emailNode);
                            },
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: FormFieldWidget(
                            labelText: "E-mail Address",
                            onChanged: (value) {
                              userInputs["email_address"] = value;
                              print(userInputs);
                            },
                            focusNode: emailNode,
                            onSubmitted: (_) {
                              FocusScope.of(context).requestFocus(bankNameNode);
                            },
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Flexible(
                            child: ListTile(
                                title: Text(
                                    "${dated.day}-${dated.month}-${dated.year}"),
                                subtitle: Text("dated"),
                                trailing: Icon(Icons.calendar_today),
                                onTap: () async {
                                  DateTime picked = await showDatePicker(
                                    context: context,
                                    initialDate: dated,
                                    firstDate:
                                        DateTime(DateTime.now().year - 10),
                                    lastDate:
                                        DateTime(DateTime.now().year + 10),
                                  );
                                  if (picked != null)
                                    setState(() {
                                      dated = picked;
                                      userInputs["dated"] =
                                          DateFormat('dd-MM-yyyy')
                                              .format(picked);
                                      print(userInputs);
                                    });
                                })),
                      ],
                    ),
                    Container(
                      height: 200,
                      width: width,
                      color: ColorPalette.cream,
                      child: Center(
                        //TODO Signature Pad
                        child: Center(
                          child:
                              Text("Signature of CGHS card holder Logic Here"),
                        ),
                      ),
                    ),
                  ],
                ),
                smallTitleText(subHeading.bankDetails),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: FormFieldWidget(
                            labelText: subHeading.bankName,
                            onChanged: (value) {
                              userInputs["bank_name"] = value;
                              print(userInputs);
                            },
                            focusNode: bankNameNode,
                            onSubmitted: (_) {
                              FocusScope.of(context).requestFocus(branchNode);
                            },
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: FormFieldWidget(
                            labelText: subHeading.branch,
                            onChanged: (value) {
                              userInputs["bank_branch"] = value;
                              print(userInputs);
                            },
                            focusNode: branchNode,
                            onSubmitted: (_) {
                              FocusScope.of(context)
                                  .requestFocus(accountNumberNode);
                            },
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: FormFieldWidget(
                            labelText: subHeading.accountNumber,
                            onChanged: (value) {
                              userInputs["account_number"] = value;
                              print(userInputs);
                            },
                            focusNode: accountNumberNode,
                            onSubmitted: (_) {
                              FocusScope.of(context).requestFocus(micrCodeNode);
                            },
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: FormFieldWidget(
                            labelText: subHeading.micrCode,
                            onChanged: (value) {
                              userInputs["micr_code"] = value;
                              print(userInputs);
                            },
                            focusNode: micrCodeNode,
                            onSubmitted: (_) {
                              FocusScope.of(context)
                                  .requestFocus(telephoneOfBankBranchNode);
                            },
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: FormFieldWidget(
                            labelText: subHeading.telephoneOfBankBranch,
                            onChanged: (value) {
                              userInputs["telephone_of_bankbranch"] = value;
                              print(userInputs);
                            },
                            focusNode: telephoneOfBankBranchNode,
                            onSubmitted: (_) {
                              FocusScope.of(context).unfocus();
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                          height: 50,
                          child: RaisedButton(
                            onPressed: () {
                              pdfTemplate(context, userInputs);
                            },
                            color: ColorPalette.darkPurple,
                            child: Text(
                              "Submit",
                              style: TextStyle(color: Colors.white),
                            ),
                          )),
                    )
                  ],
                )
              ],
            )),
          ),
        ),
      ),
    );
  }

  // selectDate(BuildContext context, DateTime dateType) async {
  //   DateTime picked = await showDatePicker(
  //     context: context,
  //     initialDate: DateTime.now(),
  //     firstDate: DateTime(DateTime.now().year - 10),
  //     lastDate: DateTime(DateTime.now().year + 10),
  //   );
  //   if (picked != null)
  //     setState(() {
  //       dateType = picked;
  //     });
  // }
}
