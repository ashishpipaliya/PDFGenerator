class MegaHeading {
  String megaTitle1 =
      "CENTRAL GOVERNMENT HEALTH SCHEME CHECK LIST FOR REIMBURSEMENT OF MEDICAL CLAIMS";
  String megaTitle2 =
      "MEDICAL 2004 FORM FOR REIMBURSEMENT OF MEDICAL CLAIMS OF CGHS BENEFICIARIES";
  String declaration = "DECLARATION";
  String information = "INFORMATION";

  String draftForAffidavitForDuplicate =
      "Draft for Affidavit for Duplicate Claim Papers/bills on stamp Paper (Annexure-I)";

  String draftForAffidavitOnStampPaper =
      "Draft for Affidavit on Stamp Paper for claiming medical reimbursement (Annexure-II)";

  String noObjectionCertificateSignedBy =
      "No Objection Certificate signed by other legal heirs on Stamp paper is enclosed.";
  String draftForNoObjectionCertificateOnStamp =
      "Draft for No Objection Certificate on Stamp Paper.";
}

class Heading {
  // page 1
  String tokenAndPlace = "CGHS Token No. and place of issue";
  String validityOfcghsCard = "Validity of CGHS Card";
  String entitlement = "EntitlementPvt./Semi Pvt/General";
  String fullName = "Full name of the Card Holder";
  String status = "Status (Govt. Servant/Member of Parliament)";
  String documentsAreSubmitted = "The following documents are submitted";

// page 2
  String heading2 = "Computer No.";
  String toBeFilled2 = "To be filled by the claimant";
  String tokenAndPlace2 = "CGHS Token No and Place of issue";
  String cardValidity2 = "Validity of CGHS Token Card";
  String entitlement2 = "Entitlement Private/Semi Private/General";
  String fullName2 = "Full name of the Card Holder";
  String fullAddress2 = "Full address";
  String telephone2 = "Telephone no";
  String emailAddress2 = "E-mail address if any";
  String nameAndRelationship =
      "Name of the patient & relationship with the card holder";
  String status2 = "Status";
  String basicPay2 = "Basic Pay/Basic Pension";
  String hospitalname2 = "Name of the Hospital with Address";
  String admitAndDischargeDate2 = "Date of admission and  discharge";
  String totalAmountClaimed2 = "Total amount Claimed";
  String referralDetails2 = "Details of Referral";
  String medicalAdvance2 = "Details of Medical advance if, any";

  String declarationPara =
      "I hereby declare that statements made in the application are true to the best of my knowledge and belief and the person for whom medical expenses were incurred is wholly dependant on me. I am a CGHS beneficiary and the CGHS card was valid at the time of treatment. I agree for the reimbursement as is admissible under the rules.";
  String misuseOfFacilities =
      "Misuse of CGHS facilities is a criminal offence. Suitable action including cancellation of CGHS Card shall be taken in case of willful suppression of facts or submission of false statements. Suitable disciplinary action shall be taken in case of serving employees.";

  //INFORMATION
  String kindlyWriteCorrect =
      "a)	Kindly write correct postal address in block letters.";
  String obtainBreakupFor =
      "b)	Obtain Break up of Investigations from the hospital (details and rates of Individual tests and the exact number of Sugar tests, X-ray films, etc.) as the reimbursable amount is calculated as per approved rates only.";
  String draftAnnexure1 =
      "c)	Draft against column (I) of check list-in case of loss of Original Papers (Annexure-I).";
  String draftAnnexure2 =
      "d)	Draft against column (I) of check list-in case of Death of Card holder (Annexure-II).";
}

class SubHeading {
  //page 1
  String medical2004 = "Medical 2004 Form";
  String copyOfCGHS = "Photocopy of CGHS card";
  String copyOfPermissionLetter = "Photocopy of permission letter";
  String numberOfOriginalBills = "Number of Original Bills";
  String copyOfPrescription = "Copy of prescription";
  String copyOfDischargeSummary = "Copy of discharge summary";
  String copyOfReferral = "Copy of referral by Specialist/CMO";
  String hospitalBreakup = "Whether the hospital has given breakup";
  String originalpapersLost =
      "Original papers have been lost & the following documents are submitted";
  String copiesOfClaimPapers = " Photocopies of claim papers";
  String affidavitOnStampPaper = "I Affidavit on Stamp Paper";

  String inCaseOfDeath =
      "Incase of death of card holder the Following documents are submitted";
  String affidavitOnStampPaper2 = "Affidavit on Stamp paper by Claimant";
  String noObjectionOnStampPaper =
      "No objection from other legal Heirs on Stamp papers";
  String copyOfDeathCerti = "Copy of death certificate";

//page 2
  String bankDetails = "Bank Details";
  String bankName = "Name of the Bank";
  String bankBranch = "Branch";
  String accountNumber = "SB A/C No";
  String micrCode = "Branch MICR Code";
  String telephoneOfBankBranch = "Telephone No. of Bank Branch";

  String opdTreatment = "OPD treatment and investigation";
  String indoorTreatment = "Indoor treatment";
}

List<String> entitlement = ["Private", "Semi Private", "General"];
List<String> status = ["Government Servant", "Member of Parliament"];

List<String> entitlement2 = ["Private", "Semi Private", "General"];
List<String> status2 = [
  "Govt. Servant",
  "Pensioner",
  "Serving employee or pension of autonomous body",
  "Member of Parliament",
  "Ex-MP",
  "Legal heir",
  "others"
];
