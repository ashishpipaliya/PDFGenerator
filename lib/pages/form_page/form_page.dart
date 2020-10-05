import 'package:flutter/material.dart';
import 'package:pdf_gen/pages/form_page/widgets.dart';
import 'package:pdf_gen/utils/ui_utils.dart';

class FormPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = UIUtils().size(context).height;
    final width = UIUtils().size(context).width;

    double twoFieldWidth = width * 0.45;
    double singleFieldWidth = width * 0.9;

    return Scaffold(
      appBar: AppBar(
        title: Text("Fill the form"),
      ),
      body: Container(
        width: width,
        height: height,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(15.0),
          physics: BouncingScrollPhysics(),
          child: Form(
              child: Column(
            children: [
              titleText(
                  "CENTRAL GOVERNMENT HEALTH SCHEME CHECK LIST FOR REIMBURSEMENT OF MEDICAL CLAIMS"),
              normalTitleText("1. CGHS Token No. and place of issue"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: twoFieldWidth,
                    child: FormFieldWidget(
                      labelText: "Token No.",
                    ),
                  ),
                  Container(
                    width: twoFieldWidth,
                    child: FormFieldWidget(
                      labelText: "Place",
                    ),
                  ),
                ],
              ),
              normalTitleText("2. Validity of CGHS Card"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: twoFieldWidth,
                    child: FormFieldWidget(
                      labelText: "From",
                      //  TODO: Date picker
                    ),
                  ),
                  Container(
                    width: twoFieldWidth,
                    child: FormFieldWidget(
                      labelText: "To",
                      //  TODO: Date picker
                    ),
                  ),
                ],
              ),
              normalTitleText("3. Entitlement Pvt./Semi Pvt/General"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: singleFieldWidth,
                    child: FormFieldWidget(
                      labelText: "Entitlement",
                    ),
                  ),
                ],
              ),
              normalTitleText("4. Full name of the Card Holder"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: singleFieldWidth,
                    child: FormFieldWidget(
                      labelText: "Full name",
                    ),
                  ),
                ],
              ),
              normalTitleText("5. Status (Govt.servent/Member of Parliament)"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              normalTitleText("6. The following documents are submitted"),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: twoFieldWidth,
                    child: FormFieldWidget(
                      labelText: "Medical 2004 Form",
                      //  TODO: Checkbox
                    ),
                  ),
                  Container(
                    width: twoFieldWidth,
                    child: FormFieldWidget(
                      labelText: "Photocopy of CGHS card",
                      //  TODO: Checkbox
                    ),
                  ),
                  Container(
                    width: twoFieldWidth,
                    child: FormFieldWidget(
                      labelText: "Photocopy of permission letter",
                      //  TODO: Checkbox
                    ),
                  ),
                  Container(
                    width: twoFieldWidth,
                    child: FormFieldWidget(
                      labelText: "Copy of prescription",
                      //  TODO: Checkbox
                    ),
                  ),
                  Container(
                    width: twoFieldWidth,
                    child: FormFieldWidget(
                      labelText: "Photocopy of permission letter",
                      //  TODO: Checkbox
                    ),
                  ),
                  Container(
                    width: twoFieldWidth,
                    child: FormFieldWidget(
                      labelText: "Copy of discharge summary",
                      //  TODO: Checkbox
                    ),
                  ),
                  Container(
                    width: twoFieldWidth,
                    child: FormFieldWidget(
                      labelText: "Copy of referral by Specialist/CMO",
                      //  TODO: Checkbox  YES/NO
                    ),
                  ),
                  Container(
                    width: twoFieldWidth,
                    child: FormFieldWidget(
                      labelText: "Whether the hospital has given breakup",
                      //  TODO: Checkbox
                    ),
                  ),
                  Container(
                    width: singleFieldWidth,
                    child: FormFieldWidget(
                      labelText: "No. of Original Bills",
                    ),
                  ),
                ],
              ),
              smallTitleText(
                  "Original papers have been lost & the following documents are submitted"),
              Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      width: twoFieldWidth,
                      child: FormFieldWidget(
                        labelText: "I. Photocopies of claim papers",
                        //  TODO: Checkbox
                      ),
                    ),
                    Container(
                      width: twoFieldWidth,
                      child: FormFieldWidget(
                        labelText: "II. Affidavit on Stamp Paper",
                        //  TODO: Checkbox
                      ),
                    ),
                  ]),
              smallTitleText(
                  "Incase of death of card holder the following documents are submitted"),
              Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      width: twoFieldWidth,
                      child: FormFieldWidget(
                        labelText: "I. Affidavit on Stamp paper by Claimant",
                        //  TODO: Checkbox
                      ),
                    ),
                    Container(
                      width: twoFieldWidth,
                      child: FormFieldWidget(
                        labelText:
                            "II. No objection from other legal Heirs on Stamp papers",
                        //  TODO: Checkbox
                      ),
                    ),
                    Container(
                      width: twoFieldWidth,
                      child: FormFieldWidget(
                        labelText: "III. Copy of death certificate",
                        //  TODO: Checkbox
                      ),
                    ),
                  ])
            ],
          )),
        ),
      ),
    );
  }
}
