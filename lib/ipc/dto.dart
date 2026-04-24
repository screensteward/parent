import 'package:freezed_annotation/freezed_annotation.dart';

part 'dto.freezed.dart';
part 'dto.g.dart';

// ─── Child-side DTOs (mirrors of ss-core-ipc::dto) ────────────────────────

@freezed
abstract class CoreStatus with _$CoreStatus {
  const factory CoreStatus({
    required String version,
    @JsonKey(name: 'uptime_seconds') required int uptimeSeconds,
    @JsonKey(name: 'tpm_used') required bool tpmUsed,
    @JsonKey(name: 'db_ok') required bool dbOk,
    @JsonKey(name: 'last_enforcement_error') String? lastEnforcementError,
  }) = _CoreStatus;
  factory CoreStatus.fromJson(Map<String, dynamic> j) =>
      _$CoreStatusFromJson(j);
}

@freezed
abstract class ChildStatus with _$ChildStatus {
  const factory ChildStatus({
    @JsonKey(name: 'today_minutes_used') required int todayMinutesUsed,
    @JsonKey(name: 'today_budget_minutes') int? todayBudgetMinutes,
    @JsonKey(name: 'current_window_open') required bool currentWindowOpen,
    @JsonKey(name: 'current_window_ends_at') DateTime? currentWindowEndsAt,
    @JsonKey(name: 'active_blocklist_display')
    required List<String> activeBlocklistDisplay,
    @JsonKey(name: 'session_running') required bool sessionRunning,
  }) = _ChildStatus;
  factory ChildStatus.fromJson(Map<String, dynamic> j) =>
      _$ChildStatusFromJson(j);
}

@freezed
abstract class AppUsage with _$AppUsage {
  const factory AppUsage({
    @JsonKey(name: 'content_hash') required String contentHash,
    @JsonKey(name: 'display_name') String? displayName,
    required String basename,
    required int minutes,
  }) = _AppUsage;
  factory AppUsage.fromJson(Map<String, dynamic> j) => _$AppUsageFromJson(j);
}

@freezed
abstract class DailyReport with _$DailyReport {
  const factory DailyReport({
    required DateTime date,
    @JsonKey(name: 'usage_by_app') required List<AppUsage> usageByApp,
    @JsonKey(name: 'total_minutes') required int totalMinutes,
  }) = _DailyReport;
  factory DailyReport.fromJson(Map<String, dynamic> j) =>
      _$DailyReportFromJson(j);
}

// ─── Parent-side DTOs ─────────────────────────────────────────────────────

@freezed
abstract class ParentView with _$ParentView {
  const factory ParentView({
    required String id,
    @JsonKey(name: 'display_name') required String displayName,
  }) = _ParentView;
  factory ParentView.fromJson(Map<String, dynamic> j) =>
      _$ParentViewFromJson(j);
}

@freezed
abstract class ChildView with _$ChildView {
  const factory ChildView({
    required String id,
    @JsonKey(name: 'display_name') required String displayName,
    @JsonKey(name: 'birth_year') int? birthYear,
  }) = _ChildView;
  factory ChildView.fromJson(Map<String, dynamic> j) => _$ChildViewFromJson(j);
}

@freezed
abstract class DeviceView with _$DeviceView {
  const factory DeviceView({
    required String id,
    @JsonKey(name: 'child_id') required String childId,
    required String hostname,
    required String platform,
    @JsonKey(name: 'last_seen_at') required DateTime lastSeenAt,
  }) = _DeviceView;
  factory DeviceView.fromJson(Map<String, dynamic> j) =>
      _$DeviceViewFromJson(j);
}

@freezed
abstract class FamilySnapshot with _$FamilySnapshot {
  const factory FamilySnapshot({
    @JsonKey(name: 'family_id') required String familyId,
    @JsonKey(name: 'family_name') required String familyName,
    required List<ParentView> parents,
    required List<ChildView> children,
    required List<DeviceView> devices,
  }) = _FamilySnapshot;
  factory FamilySnapshot.fromJson(Map<String, dynamic> j) =>
      _$FamilySnapshotFromJson(j);
}

@freezed
abstract class PolicyView with _$PolicyView {
  const factory PolicyView({
    required String id,
    @JsonKey(name: 'child_id') required String childId,
    @JsonKey(fromJson: _scopeFromJson) required Object scope,
    required List<Map<String, dynamic>> rules,
    required int priority,
    @JsonKey(name: 'active_from') DateTime? activeFrom,
    @JsonKey(name: 'active_until') DateTime? activeUntil,
  }) = _PolicyView;
  factory PolicyView.fromJson(Map<String, dynamic> j) =>
      _$PolicyViewFromJson(j);
}

/// The server serialises `Scope::Child` as the bare string `"child"` and
/// other variants as `{"device": {...}}` / `{"category": {...}}`. Accept
/// both shapes without coercion.
Object _scopeFromJson(Object? v) {
  if (v is String) return v;
  if (v is Map) return Map<String, dynamic>.from(v);
  throw ArgumentError('Unrecognised scope payload: $v');
}

@freezed
abstract class PendingExtension with _$PendingExtension {
  const factory PendingExtension({
    required String id,
    @JsonKey(name: 'child_id') required String childId,
    @JsonKey(name: 'granted_by_parent_id') String? grantedByParentId,
    required String status,
    String? reason,
    @JsonKey(name: 'duration_minutes') int? durationMinutes,
    @JsonKey(name: 'granted_at') DateTime? grantedAt,
    @JsonKey(name: 'expires_at') DateTime? expiresAt,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _PendingExtension;
  factory PendingExtension.fromJson(Map<String, dynamic> j) =>
      _$PendingExtensionFromJson(j);
}
