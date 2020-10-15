class MegaHeading {
  String megaTitle1 =
      "CENTRAL GOVERNMENT HEALTH SCHEME CHECK LIST FOR REIMBURSEMENT OF MEDICAL CLAIMS";
  String megaTitle2 =
      "MEDICAL 2004 FORM FOR REIMBURSEMENT OF MEDICAL CLAIMS OF CGHS BENEFICIARIES";
}

class Heading {
  // page 1
  String tokenAndPlace = "1. CGHS Token No. and place of issue";
  String validityOfcghsCard = "2. Validity of CGHS Card";
  String entitlement = "3. EntitlementPvt./Semi Pvt/General";
  String fullName = "4. Full name of the Card Holder";
  String status = "5. Status (Government Servant/Member of Parliament)";
  String documentsAreSubmitted = "6. The following documents are submitted";

// page 2
  String computerNo = "Computer No.";
  String toBeFilled = "To be filled by the claimant";
  String tokenAndPlace2 = "1. CGHS Token No and Place of issue";
  String cardValidity2 = "2. Validity of CGHS Token Card";
  String entitlement2 = "Entitlement (Private/Semi Private/General)";
  String fullName2 = "3. Full name of the Card Holder";
  String fullAddress = "4. Full address";
  String telephone = "5. Telephone number";
  String emailAddress = "6. E-mail address if any";
  String bankDetails = "7. Bank details";
  String patientNameAndRelationship =
      "8. Name of the patient & relationship with the card holder";
  String status2 = "9. Status";
  String basicPay = "10. Basic Pay/Basic Pension";
  String hospitalName = "11. Name of the Hospital with Address";
  String admitAndDischargeDate =
      "12. Date of admission and  discharge (In case of Indoor treatment only)";
  String totalAmountClaimed = "13. Total amount Claimed";
  String referralDetails = "14. Details of Referral";
  String medicalAdvance = "15. Details of Medical advance if, any";

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
      "c)	Draft against column (I) of check list — in case of loss of Original Papers (Annexure-I).";
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
  String hospitalBreakup =
      "Whether the hospital has given breakup: for lab investigations";
  String originalpapersLost =
      "Original papers have been lost & the following documents are submitted";
  String copiesOfClaimPapers = "I. Photocopies of claim papers";
  String affidavitOnStampPaper = "II. Affidavit on Stamp Paper";

  String inCaseOfDeath =
      "Incase of death of card holder the Following documents are submitted";
  String affidavitOnStampPaperByClaimant =
      "I. Affidavit on Stamp paper by Claimant";
  String noObjectionOnStampPaper =
      "II. No objection from other legal Heirs on Stamp papers";
  String copyOfDeathCerti = "III. Copy of death certificate";

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

List<String> entitlement = ["Select", "Private", "Semi Private", "General"];
List<String> status = ["Select", "Government Servant", "Member of Parliament"];

List<String> entitlement2 = ["Select", "Private", "Semi Private", "General"];
List<String> status2 = [
  "Select",
  "Govt. Servant",
  "Pensioner",
  "Serving employee or pension of autonomous body",
  "Member of Parliament",
  "Ex-MP",
  "Legal heir",
  "others"
];

List<String> iRelation = ["Select", "husband", "wife", "son", "daughter"];
List<String> iRelation2 = ["Select", "husband", "wife", "father", "mother"];
List<String> iSlug = ["Select", "Shri", "Smt"];
