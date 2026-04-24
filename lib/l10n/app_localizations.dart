import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_fr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('fr'),
  ];

  /// No description provided for @commonError.
  ///
  /// In fr, this message translates to:
  /// **'Erreur : {error}'**
  String commonError(String error);

  /// No description provided for @commonCancel.
  ///
  /// In fr, this message translates to:
  /// **'Annuler'**
  String get commonCancel;

  /// No description provided for @commonSave.
  ///
  /// In fr, this message translates to:
  /// **'Enregistrer'**
  String get commonSave;

  /// No description provided for @commonSaving.
  ///
  /// In fr, this message translates to:
  /// **'Enregistrement…'**
  String get commonSaving;

  /// No description provided for @commonBack.
  ///
  /// In fr, this message translates to:
  /// **'Retour'**
  String get commonBack;

  /// No description provided for @commonNext.
  ///
  /// In fr, this message translates to:
  /// **'Suivant'**
  String get commonNext;

  /// No description provided for @commonFinish.
  ///
  /// In fr, this message translates to:
  /// **'Terminer'**
  String get commonFinish;

  /// No description provided for @commonFinishing.
  ///
  /// In fr, this message translates to:
  /// **'En cours…'**
  String get commonFinishing;

  /// No description provided for @commonSending.
  ///
  /// In fr, this message translates to:
  /// **'Envoi…'**
  String get commonSending;

  /// No description provided for @commonRefresh.
  ///
  /// In fr, this message translates to:
  /// **'Rafraîchir'**
  String get commonRefresh;

  /// No description provided for @commonNoReason.
  ///
  /// In fr, this message translates to:
  /// **'(sans motif)'**
  String get commonNoReason;

  /// No description provided for @commonUnavailable.
  ///
  /// In fr, this message translates to:
  /// **'Non disponible'**
  String get commonUnavailable;

  /// No description provided for @commonYes.
  ///
  /// In fr, this message translates to:
  /// **'oui'**
  String get commonYes;

  /// No description provided for @commonNo.
  ///
  /// In fr, this message translates to:
  /// **'non'**
  String get commonNo;

  /// No description provided for @commonOk.
  ///
  /// In fr, this message translates to:
  /// **'OK'**
  String get commonOk;

  /// No description provided for @commonErrorState.
  ///
  /// In fr, this message translates to:
  /// **'erreur'**
  String get commonErrorState;

  /// No description provided for @commonLogout.
  ///
  /// In fr, this message translates to:
  /// **'Se déconnecter'**
  String get commonLogout;

  /// No description provided for @loginTitle.
  ///
  /// In fr, this message translates to:
  /// **'Connexion'**
  String get loginTitle;

  /// No description provided for @loginPasswordLabel.
  ///
  /// In fr, this message translates to:
  /// **'Mot de passe parent'**
  String get loginPasswordLabel;

  /// No description provided for @loginSubmitting.
  ///
  /// In fr, this message translates to:
  /// **'Connexion…'**
  String get loginSubmitting;

  /// No description provided for @loginSubmit.
  ///
  /// In fr, this message translates to:
  /// **'Se connecter'**
  String get loginSubmit;

  /// No description provided for @loginFailed.
  ///
  /// In fr, this message translates to:
  /// **'Échec de connexion : {error}'**
  String loginFailed(String error);

  /// No description provided for @onboardingTitle.
  ///
  /// In fr, this message translates to:
  /// **'Premier lancement'**
  String get onboardingTitle;

  /// No description provided for @onboardingFamilyStep.
  ///
  /// In fr, this message translates to:
  /// **'Famille'**
  String get onboardingFamilyStep;

  /// No description provided for @onboardingFamilyNameLabel.
  ///
  /// In fr, this message translates to:
  /// **'Nom de la famille'**
  String get onboardingFamilyNameLabel;

  /// No description provided for @onboardingParentStep.
  ///
  /// In fr, this message translates to:
  /// **'Parent'**
  String get onboardingParentStep;

  /// No description provided for @onboardingParentNameLabel.
  ///
  /// In fr, this message translates to:
  /// **'Votre prénom'**
  String get onboardingParentNameLabel;

  /// No description provided for @onboardingParentPasswordLabel.
  ///
  /// In fr, this message translates to:
  /// **'Mot de passe parent (≥ 4 caractères)'**
  String get onboardingParentPasswordLabel;

  /// No description provided for @onboardingChildStep.
  ///
  /// In fr, this message translates to:
  /// **'Enfant'**
  String get onboardingChildStep;

  /// No description provided for @onboardingChildNameLabel.
  ///
  /// In fr, this message translates to:
  /// **'Prénom de l\'enfant'**
  String get onboardingChildNameLabel;

  /// No description provided for @onboardingPolicyStep.
  ///
  /// In fr, this message translates to:
  /// **'Règles initiales'**
  String get onboardingPolicyStep;

  /// No description provided for @onboardingBudgetLabel.
  ///
  /// In fr, this message translates to:
  /// **'Budget quotidien :'**
  String get onboardingBudgetLabel;

  /// No description provided for @onboardingWindowLabel.
  ///
  /// In fr, this message translates to:
  /// **'Créneau :'**
  String get onboardingWindowLabel;

  /// No description provided for @dayMonShort.
  ///
  /// In fr, this message translates to:
  /// **'Lun'**
  String get dayMonShort;

  /// No description provided for @dayTueShort.
  ///
  /// In fr, this message translates to:
  /// **'Mar'**
  String get dayTueShort;

  /// No description provided for @dayWedShort.
  ///
  /// In fr, this message translates to:
  /// **'Mer'**
  String get dayWedShort;

  /// No description provided for @dayThuShort.
  ///
  /// In fr, this message translates to:
  /// **'Jeu'**
  String get dayThuShort;

  /// No description provided for @dayFriShort.
  ///
  /// In fr, this message translates to:
  /// **'Ven'**
  String get dayFriShort;

  /// No description provided for @daySatShort.
  ///
  /// In fr, this message translates to:
  /// **'Sam'**
  String get daySatShort;

  /// No description provided for @daySunShort.
  ///
  /// In fr, this message translates to:
  /// **'Dim'**
  String get daySunShort;

  /// No description provided for @dashboardTitle.
  ///
  /// In fr, this message translates to:
  /// **'ScreenSteward — Parent'**
  String get dashboardTitle;

  /// No description provided for @dashboardReportsTooltip.
  ///
  /// In fr, this message translates to:
  /// **'Rapport d\'usage'**
  String get dashboardReportsTooltip;

  /// No description provided for @dashboardSettingsTooltip.
  ///
  /// In fr, this message translates to:
  /// **'Paramètres'**
  String get dashboardSettingsTooltip;

  /// No description provided for @dashboardToday.
  ///
  /// In fr, this message translates to:
  /// **'Aujourd\'hui'**
  String get dashboardToday;

  /// No description provided for @dashboardWindowOpen.
  ///
  /// In fr, this message translates to:
  /// **'Créneau ouvert'**
  String get dashboardWindowOpen;

  /// No description provided for @dashboardWindowClosed.
  ///
  /// In fr, this message translates to:
  /// **'Hors créneau autorisé'**
  String get dashboardWindowClosed;

  /// No description provided for @dashboardBlockedList.
  ///
  /// In fr, this message translates to:
  /// **'Bloquées : {list}'**
  String dashboardBlockedList(String list);

  /// No description provided for @dashboardCorePending.
  ///
  /// In fr, this message translates to:
  /// **'En attente des données du cœur…'**
  String get dashboardCorePending;

  /// No description provided for @dashboardUsageWithBudget.
  ///
  /// In fr, this message translates to:
  /// **'{used} / {budget} min utilisées'**
  String dashboardUsageWithBudget(int used, int budget);

  /// No description provided for @dashboardUsageNoBudget.
  ///
  /// In fr, this message translates to:
  /// **'{used} min utilisées (pas de budget)'**
  String dashboardUsageNoBudget(int used);

  /// No description provided for @dashboardPoliciesTitle.
  ///
  /// In fr, this message translates to:
  /// **'Règles actives'**
  String get dashboardPoliciesTitle;

  /// No description provided for @dashboardPoliciesEdit.
  ///
  /// In fr, this message translates to:
  /// **'Éditer'**
  String get dashboardPoliciesEdit;

  /// No description provided for @dashboardPoliciesEmpty.
  ///
  /// In fr, this message translates to:
  /// **'Aucune règle'**
  String get dashboardPoliciesEmpty;

  /// No description provided for @dashboardPendingTitle.
  ///
  /// In fr, this message translates to:
  /// **'Demandes en attente ({count})'**
  String dashboardPendingTitle(int count);

  /// No description provided for @dashboardPendingManage.
  ///
  /// In fr, this message translates to:
  /// **'Gérer'**
  String get dashboardPendingManage;

  /// No description provided for @dashboardPendingEmpty.
  ///
  /// In fr, this message translates to:
  /// **'Aucune demande'**
  String get dashboardPendingEmpty;

  /// No description provided for @dashboardPendingCreated.
  ///
  /// In fr, this message translates to:
  /// **'Créée {when}'**
  String dashboardPendingCreated(String when);

  /// No description provided for @ruleDailyBudgetSummary.
  ///
  /// In fr, this message translates to:
  /// **'Budget quotidien : {minutes} min'**
  String ruleDailyBudgetSummary(int minutes);

  /// No description provided for @ruleTimeWindowSummary.
  ///
  /// In fr, this message translates to:
  /// **'Créneau {start} → {end} (jours {days})'**
  String ruleTimeWindowSummary(String start, String end, String days);

  /// No description provided for @ruleBlocklistSummary.
  ///
  /// In fr, this message translates to:
  /// **'Blocklist — {count} application(s)'**
  String ruleBlocklistSummary(int count);

  /// No description provided for @ruleAllowlistSummary.
  ///
  /// In fr, this message translates to:
  /// **'Allowlist — {count} application(s)'**
  String ruleAllowlistSummary(int count);

  /// No description provided for @ruleUnknownSummary.
  ///
  /// In fr, this message translates to:
  /// **'Règle inconnue : {type}'**
  String ruleUnknownSummary(String type);

  /// No description provided for @timeJustNow.
  ///
  /// In fr, this message translates to:
  /// **'à l\'instant'**
  String get timeJustNow;

  /// No description provided for @timeMinutesAgo.
  ///
  /// In fr, this message translates to:
  /// **'il y a {n} min'**
  String timeMinutesAgo(int n);

  /// No description provided for @timeHoursAgo.
  ///
  /// In fr, this message translates to:
  /// **'il y a {n} h'**
  String timeHoursAgo(int n);

  /// No description provided for @timeDaysAgo.
  ///
  /// In fr, this message translates to:
  /// **'il y a {n} j'**
  String timeDaysAgo(int n);

  /// No description provided for @uptimeDhm.
  ///
  /// In fr, this message translates to:
  /// **'{d}j {h}h {m}min'**
  String uptimeDhm(int d, int h, int m);

  /// No description provided for @uptimeHm.
  ///
  /// In fr, this message translates to:
  /// **'{h}h {m}min'**
  String uptimeHm(int h, int m);

  /// No description provided for @uptimeM.
  ///
  /// In fr, this message translates to:
  /// **'{m}min'**
  String uptimeM(int m);

  /// No description provided for @policyEditorTitle.
  ///
  /// In fr, this message translates to:
  /// **'Éditer la règle'**
  String get policyEditorTitle;

  /// No description provided for @policyEditorBudgetSection.
  ///
  /// In fr, this message translates to:
  /// **'Budget quotidien'**
  String get policyEditorBudgetSection;

  /// No description provided for @policyEditorWindowSection.
  ///
  /// In fr, this message translates to:
  /// **'Créneau autorisé'**
  String get policyEditorWindowSection;

  /// No description provided for @extensionsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Demandes en attente'**
  String get extensionsTitle;

  /// No description provided for @extensionsEmpty.
  ///
  /// In fr, this message translates to:
  /// **'Aucune demande en attente'**
  String get extensionsEmpty;

  /// No description provided for @extensionsDeny.
  ///
  /// In fr, this message translates to:
  /// **'Refuser'**
  String get extensionsDeny;

  /// No description provided for @extensionsApprove.
  ///
  /// In fr, this message translates to:
  /// **'Approuver'**
  String get extensionsApprove;

  /// No description provided for @extensionsCreatedAt.
  ///
  /// In fr, this message translates to:
  /// **'Créée le {date}'**
  String extensionsCreatedAt(String date);

  /// No description provided for @extensionsDurationDialogTitle.
  ///
  /// In fr, this message translates to:
  /// **'Durée de l\'extension'**
  String get extensionsDurationDialogTitle;

  /// No description provided for @extensionsDurationValue.
  ///
  /// In fr, this message translates to:
  /// **'{n} min'**
  String extensionsDurationValue(int n);

  /// No description provided for @extensionsDurationConfirm.
  ///
  /// In fr, this message translates to:
  /// **'Valider'**
  String get extensionsDurationConfirm;

  /// No description provided for @extensionsApproveFailed.
  ///
  /// In fr, this message translates to:
  /// **'Approbation impossible : {error}'**
  String extensionsApproveFailed(String error);

  /// No description provided for @extensionsDenyFailed.
  ///
  /// In fr, this message translates to:
  /// **'Refus impossible : {error}'**
  String extensionsDenyFailed(String error);

  /// No description provided for @reportsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Rapport d\'usage'**
  String get reportsTitle;

  /// No description provided for @reportsEmpty.
  ///
  /// In fr, this message translates to:
  /// **'Pas encore de données'**
  String get reportsEmpty;

  /// No description provided for @reportsRange.
  ///
  /// In fr, this message translates to:
  /// **'Du {from} au {to}'**
  String reportsRange(String from, String to);

  /// No description provided for @settingsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Paramètres'**
  String get settingsTitle;

  /// No description provided for @settingsCoreSection.
  ///
  /// In fr, this message translates to:
  /// **'Statut du cœur'**
  String get settingsCoreSection;

  /// No description provided for @settingsCoreFieldVersion.
  ///
  /// In fr, this message translates to:
  /// **'Version'**
  String get settingsCoreFieldVersion;

  /// No description provided for @settingsCoreFieldUptime.
  ///
  /// In fr, this message translates to:
  /// **'Uptime'**
  String get settingsCoreFieldUptime;

  /// No description provided for @settingsCoreFieldTpm.
  ///
  /// In fr, this message translates to:
  /// **'TPM utilisé'**
  String get settingsCoreFieldTpm;

  /// No description provided for @settingsCoreFieldDb.
  ///
  /// In fr, this message translates to:
  /// **'Base de données'**
  String get settingsCoreFieldDb;

  /// No description provided for @settingsCoreFieldLastError.
  ///
  /// In fr, this message translates to:
  /// **'Dernière erreur'**
  String get settingsCoreFieldLastError;

  /// No description provided for @settingsPasswordSection.
  ///
  /// In fr, this message translates to:
  /// **'Changer le mot de passe'**
  String get settingsPasswordSection;

  /// No description provided for @settingsPasswordCurrentLabel.
  ///
  /// In fr, this message translates to:
  /// **'Mot de passe actuel'**
  String get settingsPasswordCurrentLabel;

  /// No description provided for @settingsPasswordNewLabel.
  ///
  /// In fr, this message translates to:
  /// **'Nouveau mot de passe'**
  String get settingsPasswordNewLabel;

  /// No description provided for @settingsPasswordConfirmLabel.
  ///
  /// In fr, this message translates to:
  /// **'Confirmation'**
  String get settingsPasswordConfirmLabel;

  /// No description provided for @settingsPasswordSubmit.
  ///
  /// In fr, this message translates to:
  /// **'Mettre à jour'**
  String get settingsPasswordSubmit;

  /// No description provided for @settingsPasswordSuccess.
  ///
  /// In fr, this message translates to:
  /// **'Mot de passe mis à jour'**
  String get settingsPasswordSuccess;

  /// No description provided for @settingsPasswordFailed.
  ///
  /// In fr, this message translates to:
  /// **'Échec : {error}'**
  String settingsPasswordFailed(String error);

  /// No description provided for @settingsPasswordEmptyCurrent.
  ///
  /// In fr, this message translates to:
  /// **'Saisis le mot de passe actuel'**
  String get settingsPasswordEmptyCurrent;

  /// No description provided for @settingsPasswordTooShort.
  ///
  /// In fr, this message translates to:
  /// **'Le nouveau mot de passe doit faire au moins 4 caractères'**
  String get settingsPasswordTooShort;

  /// No description provided for @settingsPasswordMismatch.
  ///
  /// In fr, this message translates to:
  /// **'La confirmation ne correspond pas'**
  String get settingsPasswordMismatch;

  /// No description provided for @settingsLogoutDescription.
  ///
  /// In fr, this message translates to:
  /// **'Terminer la session parent.'**
  String get settingsLogoutDescription;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'fr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'fr':
      return AppLocalizationsFr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
