// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CoreStatus _$CoreStatusFromJson(Map<String, dynamic> json) => _CoreStatus(
  version: json['version'] as String,
  uptimeSeconds: (json['uptime_seconds'] as num).toInt(),
  tpmUsed: json['tpm_used'] as bool,
  dbOk: json['db_ok'] as bool,
  lastEnforcementError: json['last_enforcement_error'] as String?,
);

Map<String, dynamic> _$CoreStatusToJson(_CoreStatus instance) =>
    <String, dynamic>{
      'version': instance.version,
      'uptime_seconds': instance.uptimeSeconds,
      'tpm_used': instance.tpmUsed,
      'db_ok': instance.dbOk,
      'last_enforcement_error': instance.lastEnforcementError,
    };

_ChildStatus _$ChildStatusFromJson(Map<String, dynamic> json) => _ChildStatus(
  todayMinutesUsed: (json['today_minutes_used'] as num).toInt(),
  todayBudgetMinutes: (json['today_budget_minutes'] as num?)?.toInt(),
  currentWindowOpen: json['current_window_open'] as bool,
  currentWindowEndsAt: json['current_window_ends_at'] == null
      ? null
      : DateTime.parse(json['current_window_ends_at'] as String),
  activeBlocklistDisplay: (json['active_blocklist_display'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  sessionRunning: json['session_running'] as bool,
);

Map<String, dynamic> _$ChildStatusToJson(_ChildStatus instance) =>
    <String, dynamic>{
      'today_minutes_used': instance.todayMinutesUsed,
      'today_budget_minutes': instance.todayBudgetMinutes,
      'current_window_open': instance.currentWindowOpen,
      'current_window_ends_at': instance.currentWindowEndsAt?.toIso8601String(),
      'active_blocklist_display': instance.activeBlocklistDisplay,
      'session_running': instance.sessionRunning,
    };

_AppUsage _$AppUsageFromJson(Map<String, dynamic> json) => _AppUsage(
  contentHash: json['content_hash'] as String,
  displayName: json['display_name'] as String?,
  basename: json['basename'] as String,
  minutes: (json['minutes'] as num).toInt(),
);

Map<String, dynamic> _$AppUsageToJson(_AppUsage instance) => <String, dynamic>{
  'content_hash': instance.contentHash,
  'display_name': instance.displayName,
  'basename': instance.basename,
  'minutes': instance.minutes,
};

_DailyReport _$DailyReportFromJson(Map<String, dynamic> json) => _DailyReport(
  date: DateTime.parse(json['date'] as String),
  usageByApp: (json['usage_by_app'] as List<dynamic>)
      .map((e) => AppUsage.fromJson(e as Map<String, dynamic>))
      .toList(),
  totalMinutes: (json['total_minutes'] as num).toInt(),
);

Map<String, dynamic> _$DailyReportToJson(_DailyReport instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'usage_by_app': instance.usageByApp,
      'total_minutes': instance.totalMinutes,
    };

_ParentView _$ParentViewFromJson(Map<String, dynamic> json) => _ParentView(
  id: json['id'] as String,
  displayName: json['display_name'] as String,
);

Map<String, dynamic> _$ParentViewToJson(_ParentView instance) =>
    <String, dynamic>{'id': instance.id, 'display_name': instance.displayName};

_ChildView _$ChildViewFromJson(Map<String, dynamic> json) => _ChildView(
  id: json['id'] as String,
  displayName: json['display_name'] as String,
  birthYear: (json['birth_year'] as num?)?.toInt(),
);

Map<String, dynamic> _$ChildViewToJson(_ChildView instance) =>
    <String, dynamic>{
      'id': instance.id,
      'display_name': instance.displayName,
      'birth_year': instance.birthYear,
    };

_DeviceView _$DeviceViewFromJson(Map<String, dynamic> json) => _DeviceView(
  id: json['id'] as String,
  childId: json['child_id'] as String,
  hostname: json['hostname'] as String,
  platform: json['platform'] as String,
  lastSeenAt: DateTime.parse(json['last_seen_at'] as String),
);

Map<String, dynamic> _$DeviceViewToJson(_DeviceView instance) =>
    <String, dynamic>{
      'id': instance.id,
      'child_id': instance.childId,
      'hostname': instance.hostname,
      'platform': instance.platform,
      'last_seen_at': instance.lastSeenAt.toIso8601String(),
    };

_FamilySnapshot _$FamilySnapshotFromJson(Map<String, dynamic> json) =>
    _FamilySnapshot(
      familyId: json['family_id'] as String,
      familyName: json['family_name'] as String,
      parents: (json['parents'] as List<dynamic>)
          .map((e) => ParentView.fromJson(e as Map<String, dynamic>))
          .toList(),
      children: (json['children'] as List<dynamic>)
          .map((e) => ChildView.fromJson(e as Map<String, dynamic>))
          .toList(),
      devices: (json['devices'] as List<dynamic>)
          .map((e) => DeviceView.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FamilySnapshotToJson(_FamilySnapshot instance) =>
    <String, dynamic>{
      'family_id': instance.familyId,
      'family_name': instance.familyName,
      'parents': instance.parents,
      'children': instance.children,
      'devices': instance.devices,
    };

_PolicyView _$PolicyViewFromJson(Map<String, dynamic> json) => _PolicyView(
  id: json['id'] as String,
  childId: json['child_id'] as String,
  scope: json['scope'] as Map<String, dynamic>,
  rules: (json['rules'] as List<dynamic>)
      .map((e) => e as Map<String, dynamic>)
      .toList(),
  priority: (json['priority'] as num).toInt(),
  activeFrom: json['active_from'] == null
      ? null
      : DateTime.parse(json['active_from'] as String),
  activeUntil: json['active_until'] == null
      ? null
      : DateTime.parse(json['active_until'] as String),
);

Map<String, dynamic> _$PolicyViewToJson(_PolicyView instance) =>
    <String, dynamic>{
      'id': instance.id,
      'child_id': instance.childId,
      'scope': instance.scope,
      'rules': instance.rules,
      'priority': instance.priority,
      'active_from': instance.activeFrom?.toIso8601String(),
      'active_until': instance.activeUntil?.toIso8601String(),
    };
