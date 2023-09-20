import 'package:tembo_client_sdk/tembo_client_sdk.dart';

enum TemboLocale {
  sw,
  en,
}

class TemboTexts {
  static const countryChoosePageTitle = "country-choose-page-title";
  static const basicInfoPageTitle = "basic-info-page-title";
  static const genderPickPageTitle = "gender-pick-page-title";
  static const docDataPageTitle = "doc-data-page-title";
  static const dataVerifyPageTitle = "data-verify-page-title";

  static const tocPageDesc = "toc-page-desc-prefix";
  static const tocPageAgreeConfirmDesc = "toc-page-agree-confirm-desc";

  static const docType = "doc-type";
  static const docTypeDriversLicense = "doc-type-drivers-license";
  static const docTypeNationalID = "doc-type-national-id";
  static const docTypePassport = "doc-type-passport";

  static const docNumber = "doc-number";
  static const docIssueDate = "doc-issue-date";
  static const docExpiryDate = "doc-expiry-date";

  static const userFirstName = "user-first-name";
  static const userLastName = "user-last-name";
  static const userDOB = "user-dob";
  static const userGender = "user-gender";
  static const userCountry = "user-country";

  static const gendersMale = "genders-male";
  static const gendersFemale = "genders-female";

  static const submissionFailedDesc = "submission-failed-desc";
  static const submissionInProgressDesc = "submission-in-progress-desc";
  static const submissionSuccessDesc = "submission-success-desc";

  static const actionsNext = "actions-next";
  static const actionsTryAgain = "actions-try-again";
  static const actionsClose = "actions-close";
  static const actionsReadTOC = "actions-read-toc";

  static const dataPrepTitle = "data-prep-title";
  static const dataPrepDesc = "data-prep-desc";
  static const dataPrepRequirementsTitle = "data-prep-req-title";
  static const dataPrepRequirement1 = "data-prep-req-1";
  static const dataPrepRequirement2 = "data-prep-req-2";
  static const dataPrepSupportedDocs = "data-prep-supported-docs";
  static const dataPrepNextPageCTA = "data-prep-action-cta";

  // errors
  static const errorsEmptyFieldsSuffix = "errors-empty-fields-suffix";
  static const errorsEmptyFieldsPrefix = "errors-empty-fields-prefix";

  static const errorsDOBRequired = "errors-dob-required";
  static const errorsDOBAgeBelow18 = "errors-dob-age-below-18";
  static const errorsDOBBornFromFuture = "errors-dob-born-from-future";

  static const errorsCountryRequired = "errors-country-required";
  static const errorsGenderRequired = "errors-gender-required";
  static const errorsIssueDateRequired = "errors-issue-date-required";
  static const errorsExpiryDateRequired = "errors-expiry-date-required";
  static const errorsDocTypeRequired = "errors-doc-type-required";
}

const enTexts = {
  TemboTexts.countryChoosePageTitle: "Choose Your Country",
  TemboTexts.basicInfoPageTitle: "Basic Info",
  TemboTexts.genderPickPageTitle: "Choose Your Gender",
  TemboTexts.docDataPageTitle: "Identity Document Data",
  TemboTexts.dataVerifyPageTitle: "Is This Okay?",
  TemboTexts.docType: "Document Type",
  TemboTexts.docTypeDriversLicense: "Driver's License",
  TemboTexts.docTypeNationalID: "National ID",
  TemboTexts.docTypePassport: "Passport",
  TemboTexts.docNumber: "Document Number",
  TemboTexts.docIssueDate: "Document Issue Date",
  TemboTexts.docExpiryDate: "Document Expiry Date",
  TemboTexts.userFirstName: "First Name",
  TemboTexts.userLastName: "Last Name",
  TemboTexts.userDOB: "Date of Birth",
  TemboTexts.userGender: "Gender",
  TemboTexts.userCountry: "Country",
  TemboTexts.gendersMale: "Male",
  TemboTexts.gendersFemale: "Female",
  TemboTexts.submissionSuccessDesc: "We successfully submitted your details",
  TemboTexts.submissionInProgressDesc: "We are submitting your job",
  TemboTexts.submissionFailedDesc: "We have submitted your job",
  TemboTexts.actionsNext: "Next",
  TemboTexts.actionsTryAgain: "Try Again",
  TemboTexts.actionsClose: "Close",
  TemboTexts.errorsEmptyFieldsPrefix: "This field",
  TemboTexts.errorsEmptyFieldsSuffix: "can't be empty",
  TemboTexts.errorsDOBAgeBelow18: "You must be at least 18 years old",
  TemboTexts.errorsDOBBornFromFuture:
      "We don't support people born from the future",
  TemboTexts.errorsDOBRequired: "Date of birth is required",
  TemboTexts.errorsCountryRequired: "Country is required",
  TemboTexts.errorsGenderRequired: "Gender is required",
  TemboTexts.errorsIssueDateRequired: "Issue date is required",
  TemboTexts.errorsExpiryDateRequired: "Expiry date is required",
  TemboTexts.errorsDocTypeRequired: "Document type must be selected",
  TemboTexts.actionsReadTOC: "Read Our Terms & Conditions",
  TemboTexts.tocPageDesc:
      "You need to agree to our Terms and Conditions to proceed with the onboarding process",
  TemboTexts.tocPageAgreeConfirmDesc:
      "I have read and agreed to your Terms & Conditions",
  TemboTexts.dataPrepDesc:
      "You're about to start the document capturing process. We have two steps",
  TemboTexts.dataPrepRequirement1: 'Take Your Selfie',
  TemboTexts.dataPrepRequirement2: 'Capture Your Identity Document',
  TemboTexts.dataPrepSupportedDocs:
      "Only the below Identity Documents are supported:",
  TemboTexts.dataPrepNextPageCTA: "I'm ready. Let's go!",
  TemboTexts.dataPrepTitle: "Verify Your Identity",
  TemboTexts.dataPrepRequirementsTitle: "Steps",
};

const swTexts = {
  TemboTexts.countryChoosePageTitle: "Chagua Nchi Yako",
  TemboTexts.basicInfoPageTitle: "Taarifa za Msingi",
  TemboTexts.genderPickPageTitle: "Chagua Jinsia Yako",
  TemboTexts.docDataPageTitle: "Taarifa za Utambulisho",
  TemboTexts.dataVerifyPageTitle: "Hakiki Taarifa Zako",
  TemboTexts.docType: "Aina ya Kitambulisho",
  TemboTexts.docTypeDriversLicense: "Leseni ya Udereva",
  TemboTexts.docTypeNationalID: "Kitambulisho cha Utaifa",
  TemboTexts.docTypePassport: "Pasipoti",
  TemboTexts.docNumber: "Namba ya Kitambulisho",
  TemboTexts.docIssueDate: "Tarehe ya Kutolewa kwa Hati",
  TemboTexts.docExpiryDate: "Tarehe ya Mwisho wa Matumizi wa Hati",
  TemboTexts.userFirstName: "Jina la Kwanza",
  TemboTexts.userLastName: "Jina la Ukoo",
  TemboTexts.userDOB: "Tarehe ya Kuzaliwa",
  TemboTexts.userGender: "Jinsia",
  TemboTexts.userCountry: "Nchi",
  TemboTexts.gendersMale: "Mwanamume",
  TemboTexts.gendersFemale: "Mwanamke",
  TemboTexts.submissionSuccessDesc: "Tumefanikiwa kutuma taarifa zako",
  TemboTexts.submissionInProgressDesc: "Tunatuma taarifa zako",
  TemboTexts.submissionFailedDesc:
      "Tatizo lilitokea wakati tunatuma taarifa zako",
  TemboTexts.actionsNext: "Endelea",
  TemboTexts.actionsTryAgain: "Jaribu Tena",
  TemboTexts.actionsClose: "Funga",
  TemboTexts.errorsEmptyFieldsPrefix: "Taarifa hii",
  TemboTexts.errorsEmptyFieldsSuffix: "lazima ijazwe",
  TemboTexts.errorsDOBAgeBelow18: "Unatakiwa uwe na miaka 18 au zaidi",
  TemboTexts.errorsDOBBornFromFuture:
      "Tafadhali angalia tarehe yako ya kuzaliwa vizuri. Inaonesha umezaliwa kutoka siku zijazo 😃",
  TemboTexts.errorsDOBRequired: "Tarehe ya kuzaliwa lazima ijazwe",
  TemboTexts.errorsCountryRequired: "Tafadhali chagua nchi kwanza",
  TemboTexts.errorsGenderRequired: "Tafadhali chagua jinsia kwanza",
  TemboTexts.errorsIssueDateRequired: "Lazima ujaze hii tarehe",
  TemboTexts.errorsExpiryDateRequired: "Lazima ujaze hii tarehe",
  TemboTexts.errorsDocTypeRequired:
      "Tafadhali hakikisha umechagua aina ya kitambulisho",
  TemboTexts.actionsReadTOC: "Soma Sheria na Masharti Yetu",
  TemboTexts.tocPageDesc:
      "Unahitaji kukubaliana na Sheria na Masharti yetu ili kuendelea na mchakato wa kujisajili",
  TemboTexts.tocPageAgreeConfirmDesc:
      "Nimesoma na ninakubaliana na Sheria na Masharti yenu",
  TemboTexts.dataPrepDesc:
      "Tunahitaji kuhakikisha utambulisho wako.\n\nTafadhari andaa kitambulisho chako kisha fuata hatua zinazofuata",
  TemboTexts.dataPrepRequirement1: 'Jipige Picha',
  TemboTexts.dataPrepRequirement2: 'Piga picha kitambulisho',
  TemboTexts.dataPrepSupportedDocs:
      "Ni Hati za Utambulisho zilizo hapa chini ndizo zinazotumika:",
  TemboTexts.dataPrepNextPageCTA: "Niko tayari. Twende!",
  TemboTexts.dataPrepTitle: "Hakiki Utambulisho Wako",
  TemboTexts.dataPrepRequirementsTitle: "Hatua",
};

extension StringExt2 on String {
  String tr() {
    final locale = localeManager.value;
    return (locale == TemboLocale.en ? enTexts[this] : swTexts[this]) ?? this;
  }
}
