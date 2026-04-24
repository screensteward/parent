// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String commonError(String error) {
    return 'Erreur : $error';
  }

  @override
  String get commonCancel => 'Annuler';

  @override
  String get commonSave => 'Enregistrer';

  @override
  String get commonSaving => 'Enregistrement…';

  @override
  String get commonBack => 'Retour';

  @override
  String get commonNext => 'Suivant';

  @override
  String get commonFinish => 'Terminer';

  @override
  String get commonFinishing => 'En cours…';

  @override
  String get commonSending => 'Envoi…';

  @override
  String get commonRefresh => 'Rafraîchir';

  @override
  String get commonNoReason => '(sans motif)';

  @override
  String get commonUnavailable => 'Non disponible';

  @override
  String get commonYes => 'oui';

  @override
  String get commonNo => 'non';

  @override
  String get commonOk => 'OK';

  @override
  String get commonErrorState => 'erreur';

  @override
  String get commonLogout => 'Se déconnecter';

  @override
  String get loginTitle => 'Connexion';

  @override
  String get loginPasswordLabel => 'Mot de passe parent';

  @override
  String get loginSubmitting => 'Connexion…';

  @override
  String get loginSubmit => 'Se connecter';

  @override
  String loginFailed(String error) {
    return 'Échec de connexion : $error';
  }

  @override
  String get onboardingTitle => 'Premier lancement';

  @override
  String get onboardingFamilyStep => 'Famille';

  @override
  String get onboardingFamilyNameLabel => 'Nom de la famille';

  @override
  String get onboardingParentStep => 'Parent';

  @override
  String get onboardingParentNameLabel => 'Votre prénom';

  @override
  String get onboardingParentPasswordLabel =>
      'Mot de passe parent (≥ 4 caractères)';

  @override
  String get onboardingChildStep => 'Enfant';

  @override
  String get onboardingChildNameLabel => 'Prénom de l\'enfant';

  @override
  String get onboardingPolicyStep => 'Règles initiales';

  @override
  String get onboardingBudgetLabel => 'Budget quotidien :';

  @override
  String get onboardingWindowLabel => 'Créneau :';

  @override
  String get dayMonShort => 'Lun';

  @override
  String get dayTueShort => 'Mar';

  @override
  String get dayWedShort => 'Mer';

  @override
  String get dayThuShort => 'Jeu';

  @override
  String get dayFriShort => 'Ven';

  @override
  String get daySatShort => 'Sam';

  @override
  String get daySunShort => 'Dim';

  @override
  String get dashboardTitle => 'ScreenSteward — Parent';

  @override
  String get dashboardReportsTooltip => 'Rapport d\'usage';

  @override
  String get dashboardSettingsTooltip => 'Paramètres';

  @override
  String get dashboardToday => 'Aujourd\'hui';

  @override
  String get dashboardWindowOpen => 'Créneau ouvert';

  @override
  String get dashboardWindowClosed => 'Hors créneau autorisé';

  @override
  String dashboardBlockedList(String list) {
    return 'Bloquées : $list';
  }

  @override
  String get dashboardCorePending => 'En attente des données du cœur…';

  @override
  String dashboardUsageWithBudget(int used, int budget) {
    return '$used / $budget min utilisées';
  }

  @override
  String dashboardUsageNoBudget(int used) {
    return '$used min utilisées (pas de budget)';
  }

  @override
  String get dashboardPoliciesTitle => 'Règles actives';

  @override
  String get dashboardPoliciesEdit => 'Éditer';

  @override
  String get dashboardPoliciesEmpty => 'Aucune règle';

  @override
  String dashboardPendingTitle(int count) {
    return 'Demandes en attente ($count)';
  }

  @override
  String get dashboardPendingManage => 'Gérer';

  @override
  String get dashboardPendingEmpty => 'Aucune demande';

  @override
  String dashboardPendingCreated(String when) {
    return 'Créée $when';
  }

  @override
  String ruleDailyBudgetSummary(int minutes) {
    return 'Budget quotidien : $minutes min';
  }

  @override
  String ruleTimeWindowSummary(String start, String end, String days) {
    return 'Créneau $start → $end (jours $days)';
  }

  @override
  String ruleBlocklistSummary(int count) {
    return 'Blocklist — $count application(s)';
  }

  @override
  String ruleAllowlistSummary(int count) {
    return 'Allowlist — $count application(s)';
  }

  @override
  String ruleUnknownSummary(String type) {
    return 'Règle inconnue : $type';
  }

  @override
  String get timeJustNow => 'à l\'instant';

  @override
  String timeMinutesAgo(int n) {
    return 'il y a $n min';
  }

  @override
  String timeHoursAgo(int n) {
    return 'il y a $n h';
  }

  @override
  String timeDaysAgo(int n) {
    return 'il y a $n j';
  }

  @override
  String uptimeDhm(int d, int h, int m) {
    return '${d}j ${h}h ${m}min';
  }

  @override
  String uptimeHm(int h, int m) {
    return '${h}h ${m}min';
  }

  @override
  String uptimeM(int m) {
    return '${m}min';
  }

  @override
  String get policyEditorTitle => 'Éditer la règle';

  @override
  String get policyEditorBudgetSection => 'Budget quotidien';

  @override
  String get policyEditorWindowSection => 'Créneau autorisé';

  @override
  String get extensionsTitle => 'Demandes en attente';

  @override
  String get extensionsEmpty => 'Aucune demande en attente';

  @override
  String get extensionsDeny => 'Refuser';

  @override
  String get extensionsApprove => 'Approuver';

  @override
  String extensionsCreatedAt(String date) {
    return 'Créée le $date';
  }

  @override
  String get extensionsDurationDialogTitle => 'Durée de l\'extension';

  @override
  String extensionsDurationValue(int n) {
    return '$n min';
  }

  @override
  String get extensionsDurationConfirm => 'Valider';

  @override
  String extensionsApproveFailed(String error) {
    return 'Approbation impossible : $error';
  }

  @override
  String extensionsDenyFailed(String error) {
    return 'Refus impossible : $error';
  }

  @override
  String get reportsTitle => 'Rapport d\'usage';

  @override
  String get reportsEmpty => 'Pas encore de données';

  @override
  String reportsRange(String from, String to) {
    return 'Du $from au $to';
  }

  @override
  String get settingsTitle => 'Paramètres';

  @override
  String get settingsCoreSection => 'Statut du cœur';

  @override
  String get settingsCoreFieldVersion => 'Version';

  @override
  String get settingsCoreFieldUptime => 'Uptime';

  @override
  String get settingsCoreFieldTpm => 'TPM utilisé';

  @override
  String get settingsCoreFieldDb => 'Base de données';

  @override
  String get settingsCoreFieldLastError => 'Dernière erreur';

  @override
  String get settingsPasswordSection => 'Changer le mot de passe';

  @override
  String get settingsPasswordCurrentLabel => 'Mot de passe actuel';

  @override
  String get settingsPasswordNewLabel => 'Nouveau mot de passe';

  @override
  String get settingsPasswordConfirmLabel => 'Confirmation';

  @override
  String get settingsPasswordSubmit => 'Mettre à jour';

  @override
  String get settingsPasswordSuccess => 'Mot de passe mis à jour';

  @override
  String settingsPasswordFailed(String error) {
    return 'Échec : $error';
  }

  @override
  String get settingsPasswordEmptyCurrent => 'Saisis le mot de passe actuel';

  @override
  String get settingsPasswordTooShort =>
      'Le nouveau mot de passe doit faire au moins 4 caractères';

  @override
  String get settingsPasswordMismatch => 'La confirmation ne correspond pas';

  @override
  String get settingsLogoutDescription => 'Terminer la session parent.';
}
