// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String commonError(String error) {
    return 'Error: $error';
  }

  @override
  String get commonCancel => 'Cancel';

  @override
  String get commonSave => 'Save';

  @override
  String get commonSaving => 'Saving…';

  @override
  String get commonBack => 'Back';

  @override
  String get commonNext => 'Next';

  @override
  String get commonFinish => 'Finish';

  @override
  String get commonFinishing => 'Working…';

  @override
  String get commonSending => 'Sending…';

  @override
  String get commonRefresh => 'Refresh';

  @override
  String get commonNoReason => '(no reason given)';

  @override
  String get commonUnavailable => 'Unavailable';

  @override
  String get commonYes => 'yes';

  @override
  String get commonNo => 'no';

  @override
  String get commonOk => 'OK';

  @override
  String get commonErrorState => 'error';

  @override
  String get commonLogout => 'Sign out';

  @override
  String get loginTitle => 'Sign in';

  @override
  String get loginPasswordLabel => 'Parent password';

  @override
  String get loginSubmitting => 'Signing in…';

  @override
  String get loginSubmit => 'Sign in';

  @override
  String loginFailed(String error) {
    return 'Sign-in failed: $error';
  }

  @override
  String get onboardingTitle => 'First-run setup';

  @override
  String get onboardingFamilyStep => 'Family';

  @override
  String get onboardingFamilyNameLabel => 'Family name';

  @override
  String get onboardingParentStep => 'Parent';

  @override
  String get onboardingParentNameLabel => 'Your first name';

  @override
  String get onboardingParentPasswordLabel =>
      'Parent password (≥ 4 characters)';

  @override
  String get onboardingChildStep => 'Child';

  @override
  String get onboardingChildNameLabel => 'Child\'s first name';

  @override
  String get onboardingPolicyStep => 'Initial rules';

  @override
  String get onboardingBudgetLabel => 'Daily budget:';

  @override
  String get onboardingWindowLabel => 'Window:';

  @override
  String get dayMonShort => 'Mon';

  @override
  String get dayTueShort => 'Tue';

  @override
  String get dayWedShort => 'Wed';

  @override
  String get dayThuShort => 'Thu';

  @override
  String get dayFriShort => 'Fri';

  @override
  String get daySatShort => 'Sat';

  @override
  String get daySunShort => 'Sun';

  @override
  String get dashboardTitle => 'ScreenSteward — Parent';

  @override
  String get dashboardReportsTooltip => 'Usage report';

  @override
  String get dashboardSettingsTooltip => 'Settings';

  @override
  String get dashboardToday => 'Today';

  @override
  String get dashboardWindowOpen => 'Window open';

  @override
  String get dashboardWindowClosed => 'Outside allowed window';

  @override
  String dashboardBlockedList(String list) {
    return 'Blocked: $list';
  }

  @override
  String get dashboardCorePending => 'Waiting for core data…';

  @override
  String dashboardUsageWithBudget(int used, int budget) {
    return '$used of $budget min used';
  }

  @override
  String dashboardUsageNoBudget(int used) {
    return '$used min used (no budget)';
  }

  @override
  String get dashboardPoliciesTitle => 'Active rules';

  @override
  String get dashboardPoliciesEdit => 'Edit';

  @override
  String get dashboardPoliciesEmpty => 'No rule';

  @override
  String dashboardPendingTitle(int count) {
    return 'Pending requests ($count)';
  }

  @override
  String get dashboardPendingManage => 'Manage';

  @override
  String get dashboardPendingEmpty => 'No pending request';

  @override
  String dashboardPendingCreated(String when) {
    return 'Created $when';
  }

  @override
  String ruleDailyBudgetSummary(int minutes) {
    return 'Daily budget: $minutes min';
  }

  @override
  String ruleTimeWindowSummary(String start, String end, String days) {
    return 'Window $start → $end (days $days)';
  }

  @override
  String ruleBlocklistSummary(int count) {
    return 'Blocklist — $count app(s)';
  }

  @override
  String ruleAllowlistSummary(int count) {
    return 'Allowlist — $count app(s)';
  }

  @override
  String ruleUnknownSummary(String type) {
    return 'Unknown rule: $type';
  }

  @override
  String get timeJustNow => 'just now';

  @override
  String timeMinutesAgo(int n) {
    return '$n min ago';
  }

  @override
  String timeHoursAgo(int n) {
    return '$n h ago';
  }

  @override
  String timeDaysAgo(int n) {
    return '$n d ago';
  }

  @override
  String uptimeDhm(int d, int h, int m) {
    return '${d}d ${h}h ${m}min';
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
  String get policyEditorTitle => 'Edit rule';

  @override
  String get policyEditorBudgetSection => 'Daily budget';

  @override
  String get policyEditorWindowSection => 'Allowed window';

  @override
  String get extensionsTitle => 'Pending requests';

  @override
  String get extensionsEmpty => 'No pending request';

  @override
  String get extensionsDeny => 'Deny';

  @override
  String get extensionsApprove => 'Approve';

  @override
  String extensionsCreatedAt(String date) {
    return 'Created on $date';
  }

  @override
  String get extensionsDurationDialogTitle => 'Extension duration';

  @override
  String extensionsDurationValue(int n) {
    return '$n min';
  }

  @override
  String get extensionsDurationConfirm => 'Confirm';

  @override
  String extensionsApproveFailed(String error) {
    return 'Approval failed: $error';
  }

  @override
  String extensionsDenyFailed(String error) {
    return 'Denial failed: $error';
  }

  @override
  String get reportsTitle => 'Usage report';

  @override
  String get reportsEmpty => 'No data yet';

  @override
  String reportsRange(String from, String to) {
    return 'From $from to $to';
  }

  @override
  String get settingsTitle => 'Settings';

  @override
  String get settingsCoreSection => 'Core status';

  @override
  String get settingsCoreFieldVersion => 'Version';

  @override
  String get settingsCoreFieldUptime => 'Uptime';

  @override
  String get settingsCoreFieldTpm => 'TPM used';

  @override
  String get settingsCoreFieldDb => 'Database';

  @override
  String get settingsCoreFieldLastError => 'Last error';

  @override
  String get settingsPasswordSection => 'Change password';

  @override
  String get settingsPasswordCurrentLabel => 'Current password';

  @override
  String get settingsPasswordNewLabel => 'New password';

  @override
  String get settingsPasswordConfirmLabel => 'Confirmation';

  @override
  String get settingsPasswordSubmit => 'Update';

  @override
  String get settingsPasswordSuccess => 'Password updated';

  @override
  String settingsPasswordFailed(String error) {
    return 'Failed: $error';
  }

  @override
  String get settingsPasswordEmptyCurrent => 'Enter the current password';

  @override
  String get settingsPasswordTooShort =>
      'The new password must be at least 4 characters long';

  @override
  String get settingsPasswordMismatch => 'Confirmation does not match';

  @override
  String get settingsLogoutDescription => 'End the parent session.';
}
