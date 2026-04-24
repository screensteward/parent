// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CoreStatus {

 String get version;@JsonKey(name: 'uptime_seconds') int get uptimeSeconds;@JsonKey(name: 'tpm_used') bool get tpmUsed;@JsonKey(name: 'db_ok') bool get dbOk;@JsonKey(name: 'last_enforcement_error') String? get lastEnforcementError;
/// Create a copy of CoreStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CoreStatusCopyWith<CoreStatus> get copyWith => _$CoreStatusCopyWithImpl<CoreStatus>(this as CoreStatus, _$identity);

  /// Serializes this CoreStatus to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CoreStatus&&(identical(other.version, version) || other.version == version)&&(identical(other.uptimeSeconds, uptimeSeconds) || other.uptimeSeconds == uptimeSeconds)&&(identical(other.tpmUsed, tpmUsed) || other.tpmUsed == tpmUsed)&&(identical(other.dbOk, dbOk) || other.dbOk == dbOk)&&(identical(other.lastEnforcementError, lastEnforcementError) || other.lastEnforcementError == lastEnforcementError));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,version,uptimeSeconds,tpmUsed,dbOk,lastEnforcementError);

@override
String toString() {
  return 'CoreStatus(version: $version, uptimeSeconds: $uptimeSeconds, tpmUsed: $tpmUsed, dbOk: $dbOk, lastEnforcementError: $lastEnforcementError)';
}


}

/// @nodoc
abstract mixin class $CoreStatusCopyWith<$Res>  {
  factory $CoreStatusCopyWith(CoreStatus value, $Res Function(CoreStatus) _then) = _$CoreStatusCopyWithImpl;
@useResult
$Res call({
 String version,@JsonKey(name: 'uptime_seconds') int uptimeSeconds,@JsonKey(name: 'tpm_used') bool tpmUsed,@JsonKey(name: 'db_ok') bool dbOk,@JsonKey(name: 'last_enforcement_error') String? lastEnforcementError
});




}
/// @nodoc
class _$CoreStatusCopyWithImpl<$Res>
    implements $CoreStatusCopyWith<$Res> {
  _$CoreStatusCopyWithImpl(this._self, this._then);

  final CoreStatus _self;
  final $Res Function(CoreStatus) _then;

/// Create a copy of CoreStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? version = null,Object? uptimeSeconds = null,Object? tpmUsed = null,Object? dbOk = null,Object? lastEnforcementError = freezed,}) {
  return _then(_self.copyWith(
version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,uptimeSeconds: null == uptimeSeconds ? _self.uptimeSeconds : uptimeSeconds // ignore: cast_nullable_to_non_nullable
as int,tpmUsed: null == tpmUsed ? _self.tpmUsed : tpmUsed // ignore: cast_nullable_to_non_nullable
as bool,dbOk: null == dbOk ? _self.dbOk : dbOk // ignore: cast_nullable_to_non_nullable
as bool,lastEnforcementError: freezed == lastEnforcementError ? _self.lastEnforcementError : lastEnforcementError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CoreStatus].
extension CoreStatusPatterns on CoreStatus {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CoreStatus value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CoreStatus() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CoreStatus value)  $default,){
final _that = this;
switch (_that) {
case _CoreStatus():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CoreStatus value)?  $default,){
final _that = this;
switch (_that) {
case _CoreStatus() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String version, @JsonKey(name: 'uptime_seconds')  int uptimeSeconds, @JsonKey(name: 'tpm_used')  bool tpmUsed, @JsonKey(name: 'db_ok')  bool dbOk, @JsonKey(name: 'last_enforcement_error')  String? lastEnforcementError)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CoreStatus() when $default != null:
return $default(_that.version,_that.uptimeSeconds,_that.tpmUsed,_that.dbOk,_that.lastEnforcementError);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String version, @JsonKey(name: 'uptime_seconds')  int uptimeSeconds, @JsonKey(name: 'tpm_used')  bool tpmUsed, @JsonKey(name: 'db_ok')  bool dbOk, @JsonKey(name: 'last_enforcement_error')  String? lastEnforcementError)  $default,) {final _that = this;
switch (_that) {
case _CoreStatus():
return $default(_that.version,_that.uptimeSeconds,_that.tpmUsed,_that.dbOk,_that.lastEnforcementError);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String version, @JsonKey(name: 'uptime_seconds')  int uptimeSeconds, @JsonKey(name: 'tpm_used')  bool tpmUsed, @JsonKey(name: 'db_ok')  bool dbOk, @JsonKey(name: 'last_enforcement_error')  String? lastEnforcementError)?  $default,) {final _that = this;
switch (_that) {
case _CoreStatus() when $default != null:
return $default(_that.version,_that.uptimeSeconds,_that.tpmUsed,_that.dbOk,_that.lastEnforcementError);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CoreStatus implements CoreStatus {
  const _CoreStatus({required this.version, @JsonKey(name: 'uptime_seconds') required this.uptimeSeconds, @JsonKey(name: 'tpm_used') required this.tpmUsed, @JsonKey(name: 'db_ok') required this.dbOk, @JsonKey(name: 'last_enforcement_error') this.lastEnforcementError});
  factory _CoreStatus.fromJson(Map<String, dynamic> json) => _$CoreStatusFromJson(json);

@override final  String version;
@override@JsonKey(name: 'uptime_seconds') final  int uptimeSeconds;
@override@JsonKey(name: 'tpm_used') final  bool tpmUsed;
@override@JsonKey(name: 'db_ok') final  bool dbOk;
@override@JsonKey(name: 'last_enforcement_error') final  String? lastEnforcementError;

/// Create a copy of CoreStatus
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CoreStatusCopyWith<_CoreStatus> get copyWith => __$CoreStatusCopyWithImpl<_CoreStatus>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CoreStatusToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CoreStatus&&(identical(other.version, version) || other.version == version)&&(identical(other.uptimeSeconds, uptimeSeconds) || other.uptimeSeconds == uptimeSeconds)&&(identical(other.tpmUsed, tpmUsed) || other.tpmUsed == tpmUsed)&&(identical(other.dbOk, dbOk) || other.dbOk == dbOk)&&(identical(other.lastEnforcementError, lastEnforcementError) || other.lastEnforcementError == lastEnforcementError));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,version,uptimeSeconds,tpmUsed,dbOk,lastEnforcementError);

@override
String toString() {
  return 'CoreStatus(version: $version, uptimeSeconds: $uptimeSeconds, tpmUsed: $tpmUsed, dbOk: $dbOk, lastEnforcementError: $lastEnforcementError)';
}


}

/// @nodoc
abstract mixin class _$CoreStatusCopyWith<$Res> implements $CoreStatusCopyWith<$Res> {
  factory _$CoreStatusCopyWith(_CoreStatus value, $Res Function(_CoreStatus) _then) = __$CoreStatusCopyWithImpl;
@override @useResult
$Res call({
 String version,@JsonKey(name: 'uptime_seconds') int uptimeSeconds,@JsonKey(name: 'tpm_used') bool tpmUsed,@JsonKey(name: 'db_ok') bool dbOk,@JsonKey(name: 'last_enforcement_error') String? lastEnforcementError
});




}
/// @nodoc
class __$CoreStatusCopyWithImpl<$Res>
    implements _$CoreStatusCopyWith<$Res> {
  __$CoreStatusCopyWithImpl(this._self, this._then);

  final _CoreStatus _self;
  final $Res Function(_CoreStatus) _then;

/// Create a copy of CoreStatus
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? version = null,Object? uptimeSeconds = null,Object? tpmUsed = null,Object? dbOk = null,Object? lastEnforcementError = freezed,}) {
  return _then(_CoreStatus(
version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,uptimeSeconds: null == uptimeSeconds ? _self.uptimeSeconds : uptimeSeconds // ignore: cast_nullable_to_non_nullable
as int,tpmUsed: null == tpmUsed ? _self.tpmUsed : tpmUsed // ignore: cast_nullable_to_non_nullable
as bool,dbOk: null == dbOk ? _self.dbOk : dbOk // ignore: cast_nullable_to_non_nullable
as bool,lastEnforcementError: freezed == lastEnforcementError ? _self.lastEnforcementError : lastEnforcementError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ChildStatus {

@JsonKey(name: 'today_minutes_used') int get todayMinutesUsed;@JsonKey(name: 'today_budget_minutes') int? get todayBudgetMinutes;@JsonKey(name: 'current_window_open') bool get currentWindowOpen;@JsonKey(name: 'current_window_ends_at') DateTime? get currentWindowEndsAt;@JsonKey(name: 'active_blocklist_display') List<String> get activeBlocklistDisplay;@JsonKey(name: 'session_running') bool get sessionRunning;
/// Create a copy of ChildStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChildStatusCopyWith<ChildStatus> get copyWith => _$ChildStatusCopyWithImpl<ChildStatus>(this as ChildStatus, _$identity);

  /// Serializes this ChildStatus to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChildStatus&&(identical(other.todayMinutesUsed, todayMinutesUsed) || other.todayMinutesUsed == todayMinutesUsed)&&(identical(other.todayBudgetMinutes, todayBudgetMinutes) || other.todayBudgetMinutes == todayBudgetMinutes)&&(identical(other.currentWindowOpen, currentWindowOpen) || other.currentWindowOpen == currentWindowOpen)&&(identical(other.currentWindowEndsAt, currentWindowEndsAt) || other.currentWindowEndsAt == currentWindowEndsAt)&&const DeepCollectionEquality().equals(other.activeBlocklistDisplay, activeBlocklistDisplay)&&(identical(other.sessionRunning, sessionRunning) || other.sessionRunning == sessionRunning));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,todayMinutesUsed,todayBudgetMinutes,currentWindowOpen,currentWindowEndsAt,const DeepCollectionEquality().hash(activeBlocklistDisplay),sessionRunning);

@override
String toString() {
  return 'ChildStatus(todayMinutesUsed: $todayMinutesUsed, todayBudgetMinutes: $todayBudgetMinutes, currentWindowOpen: $currentWindowOpen, currentWindowEndsAt: $currentWindowEndsAt, activeBlocklistDisplay: $activeBlocklistDisplay, sessionRunning: $sessionRunning)';
}


}

/// @nodoc
abstract mixin class $ChildStatusCopyWith<$Res>  {
  factory $ChildStatusCopyWith(ChildStatus value, $Res Function(ChildStatus) _then) = _$ChildStatusCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'today_minutes_used') int todayMinutesUsed,@JsonKey(name: 'today_budget_minutes') int? todayBudgetMinutes,@JsonKey(name: 'current_window_open') bool currentWindowOpen,@JsonKey(name: 'current_window_ends_at') DateTime? currentWindowEndsAt,@JsonKey(name: 'active_blocklist_display') List<String> activeBlocklistDisplay,@JsonKey(name: 'session_running') bool sessionRunning
});




}
/// @nodoc
class _$ChildStatusCopyWithImpl<$Res>
    implements $ChildStatusCopyWith<$Res> {
  _$ChildStatusCopyWithImpl(this._self, this._then);

  final ChildStatus _self;
  final $Res Function(ChildStatus) _then;

/// Create a copy of ChildStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? todayMinutesUsed = null,Object? todayBudgetMinutes = freezed,Object? currentWindowOpen = null,Object? currentWindowEndsAt = freezed,Object? activeBlocklistDisplay = null,Object? sessionRunning = null,}) {
  return _then(_self.copyWith(
todayMinutesUsed: null == todayMinutesUsed ? _self.todayMinutesUsed : todayMinutesUsed // ignore: cast_nullable_to_non_nullable
as int,todayBudgetMinutes: freezed == todayBudgetMinutes ? _self.todayBudgetMinutes : todayBudgetMinutes // ignore: cast_nullable_to_non_nullable
as int?,currentWindowOpen: null == currentWindowOpen ? _self.currentWindowOpen : currentWindowOpen // ignore: cast_nullable_to_non_nullable
as bool,currentWindowEndsAt: freezed == currentWindowEndsAt ? _self.currentWindowEndsAt : currentWindowEndsAt // ignore: cast_nullable_to_non_nullable
as DateTime?,activeBlocklistDisplay: null == activeBlocklistDisplay ? _self.activeBlocklistDisplay : activeBlocklistDisplay // ignore: cast_nullable_to_non_nullable
as List<String>,sessionRunning: null == sessionRunning ? _self.sessionRunning : sessionRunning // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ChildStatus].
extension ChildStatusPatterns on ChildStatus {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChildStatus value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChildStatus() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChildStatus value)  $default,){
final _that = this;
switch (_that) {
case _ChildStatus():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChildStatus value)?  $default,){
final _that = this;
switch (_that) {
case _ChildStatus() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'today_minutes_used')  int todayMinutesUsed, @JsonKey(name: 'today_budget_minutes')  int? todayBudgetMinutes, @JsonKey(name: 'current_window_open')  bool currentWindowOpen, @JsonKey(name: 'current_window_ends_at')  DateTime? currentWindowEndsAt, @JsonKey(name: 'active_blocklist_display')  List<String> activeBlocklistDisplay, @JsonKey(name: 'session_running')  bool sessionRunning)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChildStatus() when $default != null:
return $default(_that.todayMinutesUsed,_that.todayBudgetMinutes,_that.currentWindowOpen,_that.currentWindowEndsAt,_that.activeBlocklistDisplay,_that.sessionRunning);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'today_minutes_used')  int todayMinutesUsed, @JsonKey(name: 'today_budget_minutes')  int? todayBudgetMinutes, @JsonKey(name: 'current_window_open')  bool currentWindowOpen, @JsonKey(name: 'current_window_ends_at')  DateTime? currentWindowEndsAt, @JsonKey(name: 'active_blocklist_display')  List<String> activeBlocklistDisplay, @JsonKey(name: 'session_running')  bool sessionRunning)  $default,) {final _that = this;
switch (_that) {
case _ChildStatus():
return $default(_that.todayMinutesUsed,_that.todayBudgetMinutes,_that.currentWindowOpen,_that.currentWindowEndsAt,_that.activeBlocklistDisplay,_that.sessionRunning);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'today_minutes_used')  int todayMinutesUsed, @JsonKey(name: 'today_budget_minutes')  int? todayBudgetMinutes, @JsonKey(name: 'current_window_open')  bool currentWindowOpen, @JsonKey(name: 'current_window_ends_at')  DateTime? currentWindowEndsAt, @JsonKey(name: 'active_blocklist_display')  List<String> activeBlocklistDisplay, @JsonKey(name: 'session_running')  bool sessionRunning)?  $default,) {final _that = this;
switch (_that) {
case _ChildStatus() when $default != null:
return $default(_that.todayMinutesUsed,_that.todayBudgetMinutes,_that.currentWindowOpen,_that.currentWindowEndsAt,_that.activeBlocklistDisplay,_that.sessionRunning);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChildStatus implements ChildStatus {
  const _ChildStatus({@JsonKey(name: 'today_minutes_used') required this.todayMinutesUsed, @JsonKey(name: 'today_budget_minutes') this.todayBudgetMinutes, @JsonKey(name: 'current_window_open') required this.currentWindowOpen, @JsonKey(name: 'current_window_ends_at') this.currentWindowEndsAt, @JsonKey(name: 'active_blocklist_display') required final  List<String> activeBlocklistDisplay, @JsonKey(name: 'session_running') required this.sessionRunning}): _activeBlocklistDisplay = activeBlocklistDisplay;
  factory _ChildStatus.fromJson(Map<String, dynamic> json) => _$ChildStatusFromJson(json);

@override@JsonKey(name: 'today_minutes_used') final  int todayMinutesUsed;
@override@JsonKey(name: 'today_budget_minutes') final  int? todayBudgetMinutes;
@override@JsonKey(name: 'current_window_open') final  bool currentWindowOpen;
@override@JsonKey(name: 'current_window_ends_at') final  DateTime? currentWindowEndsAt;
 final  List<String> _activeBlocklistDisplay;
@override@JsonKey(name: 'active_blocklist_display') List<String> get activeBlocklistDisplay {
  if (_activeBlocklistDisplay is EqualUnmodifiableListView) return _activeBlocklistDisplay;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_activeBlocklistDisplay);
}

@override@JsonKey(name: 'session_running') final  bool sessionRunning;

/// Create a copy of ChildStatus
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChildStatusCopyWith<_ChildStatus> get copyWith => __$ChildStatusCopyWithImpl<_ChildStatus>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChildStatusToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChildStatus&&(identical(other.todayMinutesUsed, todayMinutesUsed) || other.todayMinutesUsed == todayMinutesUsed)&&(identical(other.todayBudgetMinutes, todayBudgetMinutes) || other.todayBudgetMinutes == todayBudgetMinutes)&&(identical(other.currentWindowOpen, currentWindowOpen) || other.currentWindowOpen == currentWindowOpen)&&(identical(other.currentWindowEndsAt, currentWindowEndsAt) || other.currentWindowEndsAt == currentWindowEndsAt)&&const DeepCollectionEquality().equals(other._activeBlocklistDisplay, _activeBlocklistDisplay)&&(identical(other.sessionRunning, sessionRunning) || other.sessionRunning == sessionRunning));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,todayMinutesUsed,todayBudgetMinutes,currentWindowOpen,currentWindowEndsAt,const DeepCollectionEquality().hash(_activeBlocklistDisplay),sessionRunning);

@override
String toString() {
  return 'ChildStatus(todayMinutesUsed: $todayMinutesUsed, todayBudgetMinutes: $todayBudgetMinutes, currentWindowOpen: $currentWindowOpen, currentWindowEndsAt: $currentWindowEndsAt, activeBlocklistDisplay: $activeBlocklistDisplay, sessionRunning: $sessionRunning)';
}


}

/// @nodoc
abstract mixin class _$ChildStatusCopyWith<$Res> implements $ChildStatusCopyWith<$Res> {
  factory _$ChildStatusCopyWith(_ChildStatus value, $Res Function(_ChildStatus) _then) = __$ChildStatusCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'today_minutes_used') int todayMinutesUsed,@JsonKey(name: 'today_budget_minutes') int? todayBudgetMinutes,@JsonKey(name: 'current_window_open') bool currentWindowOpen,@JsonKey(name: 'current_window_ends_at') DateTime? currentWindowEndsAt,@JsonKey(name: 'active_blocklist_display') List<String> activeBlocklistDisplay,@JsonKey(name: 'session_running') bool sessionRunning
});




}
/// @nodoc
class __$ChildStatusCopyWithImpl<$Res>
    implements _$ChildStatusCopyWith<$Res> {
  __$ChildStatusCopyWithImpl(this._self, this._then);

  final _ChildStatus _self;
  final $Res Function(_ChildStatus) _then;

/// Create a copy of ChildStatus
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? todayMinutesUsed = null,Object? todayBudgetMinutes = freezed,Object? currentWindowOpen = null,Object? currentWindowEndsAt = freezed,Object? activeBlocklistDisplay = null,Object? sessionRunning = null,}) {
  return _then(_ChildStatus(
todayMinutesUsed: null == todayMinutesUsed ? _self.todayMinutesUsed : todayMinutesUsed // ignore: cast_nullable_to_non_nullable
as int,todayBudgetMinutes: freezed == todayBudgetMinutes ? _self.todayBudgetMinutes : todayBudgetMinutes // ignore: cast_nullable_to_non_nullable
as int?,currentWindowOpen: null == currentWindowOpen ? _self.currentWindowOpen : currentWindowOpen // ignore: cast_nullable_to_non_nullable
as bool,currentWindowEndsAt: freezed == currentWindowEndsAt ? _self.currentWindowEndsAt : currentWindowEndsAt // ignore: cast_nullable_to_non_nullable
as DateTime?,activeBlocklistDisplay: null == activeBlocklistDisplay ? _self._activeBlocklistDisplay : activeBlocklistDisplay // ignore: cast_nullable_to_non_nullable
as List<String>,sessionRunning: null == sessionRunning ? _self.sessionRunning : sessionRunning // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$AppUsage {

@JsonKey(name: 'content_hash') String get contentHash;@JsonKey(name: 'display_name') String? get displayName; String get basename; int get minutes;
/// Create a copy of AppUsage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppUsageCopyWith<AppUsage> get copyWith => _$AppUsageCopyWithImpl<AppUsage>(this as AppUsage, _$identity);

  /// Serializes this AppUsage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppUsage&&(identical(other.contentHash, contentHash) || other.contentHash == contentHash)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.basename, basename) || other.basename == basename)&&(identical(other.minutes, minutes) || other.minutes == minutes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,contentHash,displayName,basename,minutes);

@override
String toString() {
  return 'AppUsage(contentHash: $contentHash, displayName: $displayName, basename: $basename, minutes: $minutes)';
}


}

/// @nodoc
abstract mixin class $AppUsageCopyWith<$Res>  {
  factory $AppUsageCopyWith(AppUsage value, $Res Function(AppUsage) _then) = _$AppUsageCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'content_hash') String contentHash,@JsonKey(name: 'display_name') String? displayName, String basename, int minutes
});




}
/// @nodoc
class _$AppUsageCopyWithImpl<$Res>
    implements $AppUsageCopyWith<$Res> {
  _$AppUsageCopyWithImpl(this._self, this._then);

  final AppUsage _self;
  final $Res Function(AppUsage) _then;

/// Create a copy of AppUsage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? contentHash = null,Object? displayName = freezed,Object? basename = null,Object? minutes = null,}) {
  return _then(_self.copyWith(
contentHash: null == contentHash ? _self.contentHash : contentHash // ignore: cast_nullable_to_non_nullable
as String,displayName: freezed == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String?,basename: null == basename ? _self.basename : basename // ignore: cast_nullable_to_non_nullable
as String,minutes: null == minutes ? _self.minutes : minutes // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [AppUsage].
extension AppUsagePatterns on AppUsage {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppUsage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppUsage() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppUsage value)  $default,){
final _that = this;
switch (_that) {
case _AppUsage():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppUsage value)?  $default,){
final _that = this;
switch (_that) {
case _AppUsage() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'content_hash')  String contentHash, @JsonKey(name: 'display_name')  String? displayName,  String basename,  int minutes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppUsage() when $default != null:
return $default(_that.contentHash,_that.displayName,_that.basename,_that.minutes);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'content_hash')  String contentHash, @JsonKey(name: 'display_name')  String? displayName,  String basename,  int minutes)  $default,) {final _that = this;
switch (_that) {
case _AppUsage():
return $default(_that.contentHash,_that.displayName,_that.basename,_that.minutes);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'content_hash')  String contentHash, @JsonKey(name: 'display_name')  String? displayName,  String basename,  int minutes)?  $default,) {final _that = this;
switch (_that) {
case _AppUsage() when $default != null:
return $default(_that.contentHash,_that.displayName,_that.basename,_that.minutes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppUsage implements AppUsage {
  const _AppUsage({@JsonKey(name: 'content_hash') required this.contentHash, @JsonKey(name: 'display_name') this.displayName, required this.basename, required this.minutes});
  factory _AppUsage.fromJson(Map<String, dynamic> json) => _$AppUsageFromJson(json);

@override@JsonKey(name: 'content_hash') final  String contentHash;
@override@JsonKey(name: 'display_name') final  String? displayName;
@override final  String basename;
@override final  int minutes;

/// Create a copy of AppUsage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppUsageCopyWith<_AppUsage> get copyWith => __$AppUsageCopyWithImpl<_AppUsage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppUsageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppUsage&&(identical(other.contentHash, contentHash) || other.contentHash == contentHash)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.basename, basename) || other.basename == basename)&&(identical(other.minutes, minutes) || other.minutes == minutes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,contentHash,displayName,basename,minutes);

@override
String toString() {
  return 'AppUsage(contentHash: $contentHash, displayName: $displayName, basename: $basename, minutes: $minutes)';
}


}

/// @nodoc
abstract mixin class _$AppUsageCopyWith<$Res> implements $AppUsageCopyWith<$Res> {
  factory _$AppUsageCopyWith(_AppUsage value, $Res Function(_AppUsage) _then) = __$AppUsageCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'content_hash') String contentHash,@JsonKey(name: 'display_name') String? displayName, String basename, int minutes
});




}
/// @nodoc
class __$AppUsageCopyWithImpl<$Res>
    implements _$AppUsageCopyWith<$Res> {
  __$AppUsageCopyWithImpl(this._self, this._then);

  final _AppUsage _self;
  final $Res Function(_AppUsage) _then;

/// Create a copy of AppUsage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? contentHash = null,Object? displayName = freezed,Object? basename = null,Object? minutes = null,}) {
  return _then(_AppUsage(
contentHash: null == contentHash ? _self.contentHash : contentHash // ignore: cast_nullable_to_non_nullable
as String,displayName: freezed == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String?,basename: null == basename ? _self.basename : basename // ignore: cast_nullable_to_non_nullable
as String,minutes: null == minutes ? _self.minutes : minutes // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$DailyReport {

 DateTime get date;@JsonKey(name: 'usage_by_app') List<AppUsage> get usageByApp;@JsonKey(name: 'total_minutes') int get totalMinutes;
/// Create a copy of DailyReport
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DailyReportCopyWith<DailyReport> get copyWith => _$DailyReportCopyWithImpl<DailyReport>(this as DailyReport, _$identity);

  /// Serializes this DailyReport to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyReport&&(identical(other.date, date) || other.date == date)&&const DeepCollectionEquality().equals(other.usageByApp, usageByApp)&&(identical(other.totalMinutes, totalMinutes) || other.totalMinutes == totalMinutes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,const DeepCollectionEquality().hash(usageByApp),totalMinutes);

@override
String toString() {
  return 'DailyReport(date: $date, usageByApp: $usageByApp, totalMinutes: $totalMinutes)';
}


}

/// @nodoc
abstract mixin class $DailyReportCopyWith<$Res>  {
  factory $DailyReportCopyWith(DailyReport value, $Res Function(DailyReport) _then) = _$DailyReportCopyWithImpl;
@useResult
$Res call({
 DateTime date,@JsonKey(name: 'usage_by_app') List<AppUsage> usageByApp,@JsonKey(name: 'total_minutes') int totalMinutes
});




}
/// @nodoc
class _$DailyReportCopyWithImpl<$Res>
    implements $DailyReportCopyWith<$Res> {
  _$DailyReportCopyWithImpl(this._self, this._then);

  final DailyReport _self;
  final $Res Function(DailyReport) _then;

/// Create a copy of DailyReport
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? usageByApp = null,Object? totalMinutes = null,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,usageByApp: null == usageByApp ? _self.usageByApp : usageByApp // ignore: cast_nullable_to_non_nullable
as List<AppUsage>,totalMinutes: null == totalMinutes ? _self.totalMinutes : totalMinutes // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [DailyReport].
extension DailyReportPatterns on DailyReport {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DailyReport value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DailyReport() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DailyReport value)  $default,){
final _that = this;
switch (_that) {
case _DailyReport():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DailyReport value)?  $default,){
final _that = this;
switch (_that) {
case _DailyReport() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime date, @JsonKey(name: 'usage_by_app')  List<AppUsage> usageByApp, @JsonKey(name: 'total_minutes')  int totalMinutes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DailyReport() when $default != null:
return $default(_that.date,_that.usageByApp,_that.totalMinutes);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime date, @JsonKey(name: 'usage_by_app')  List<AppUsage> usageByApp, @JsonKey(name: 'total_minutes')  int totalMinutes)  $default,) {final _that = this;
switch (_that) {
case _DailyReport():
return $default(_that.date,_that.usageByApp,_that.totalMinutes);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime date, @JsonKey(name: 'usage_by_app')  List<AppUsage> usageByApp, @JsonKey(name: 'total_minutes')  int totalMinutes)?  $default,) {final _that = this;
switch (_that) {
case _DailyReport() when $default != null:
return $default(_that.date,_that.usageByApp,_that.totalMinutes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DailyReport implements DailyReport {
  const _DailyReport({required this.date, @JsonKey(name: 'usage_by_app') required final  List<AppUsage> usageByApp, @JsonKey(name: 'total_minutes') required this.totalMinutes}): _usageByApp = usageByApp;
  factory _DailyReport.fromJson(Map<String, dynamic> json) => _$DailyReportFromJson(json);

@override final  DateTime date;
 final  List<AppUsage> _usageByApp;
@override@JsonKey(name: 'usage_by_app') List<AppUsage> get usageByApp {
  if (_usageByApp is EqualUnmodifiableListView) return _usageByApp;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_usageByApp);
}

@override@JsonKey(name: 'total_minutes') final  int totalMinutes;

/// Create a copy of DailyReport
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DailyReportCopyWith<_DailyReport> get copyWith => __$DailyReportCopyWithImpl<_DailyReport>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DailyReportToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DailyReport&&(identical(other.date, date) || other.date == date)&&const DeepCollectionEquality().equals(other._usageByApp, _usageByApp)&&(identical(other.totalMinutes, totalMinutes) || other.totalMinutes == totalMinutes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,const DeepCollectionEquality().hash(_usageByApp),totalMinutes);

@override
String toString() {
  return 'DailyReport(date: $date, usageByApp: $usageByApp, totalMinutes: $totalMinutes)';
}


}

/// @nodoc
abstract mixin class _$DailyReportCopyWith<$Res> implements $DailyReportCopyWith<$Res> {
  factory _$DailyReportCopyWith(_DailyReport value, $Res Function(_DailyReport) _then) = __$DailyReportCopyWithImpl;
@override @useResult
$Res call({
 DateTime date,@JsonKey(name: 'usage_by_app') List<AppUsage> usageByApp,@JsonKey(name: 'total_minutes') int totalMinutes
});




}
/// @nodoc
class __$DailyReportCopyWithImpl<$Res>
    implements _$DailyReportCopyWith<$Res> {
  __$DailyReportCopyWithImpl(this._self, this._then);

  final _DailyReport _self;
  final $Res Function(_DailyReport) _then;

/// Create a copy of DailyReport
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? usageByApp = null,Object? totalMinutes = null,}) {
  return _then(_DailyReport(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,usageByApp: null == usageByApp ? _self._usageByApp : usageByApp // ignore: cast_nullable_to_non_nullable
as List<AppUsage>,totalMinutes: null == totalMinutes ? _self.totalMinutes : totalMinutes // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$ParentView {

 String get id;@JsonKey(name: 'display_name') String get displayName;
/// Create a copy of ParentView
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ParentViewCopyWith<ParentView> get copyWith => _$ParentViewCopyWithImpl<ParentView>(this as ParentView, _$identity);

  /// Serializes this ParentView to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ParentView&&(identical(other.id, id) || other.id == id)&&(identical(other.displayName, displayName) || other.displayName == displayName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,displayName);

@override
String toString() {
  return 'ParentView(id: $id, displayName: $displayName)';
}


}

/// @nodoc
abstract mixin class $ParentViewCopyWith<$Res>  {
  factory $ParentViewCopyWith(ParentView value, $Res Function(ParentView) _then) = _$ParentViewCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'display_name') String displayName
});




}
/// @nodoc
class _$ParentViewCopyWithImpl<$Res>
    implements $ParentViewCopyWith<$Res> {
  _$ParentViewCopyWithImpl(this._self, this._then);

  final ParentView _self;
  final $Res Function(ParentView) _then;

/// Create a copy of ParentView
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? displayName = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ParentView].
extension ParentViewPatterns on ParentView {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ParentView value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ParentView() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ParentView value)  $default,){
final _that = this;
switch (_that) {
case _ParentView():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ParentView value)?  $default,){
final _that = this;
switch (_that) {
case _ParentView() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'display_name')  String displayName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ParentView() when $default != null:
return $default(_that.id,_that.displayName);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'display_name')  String displayName)  $default,) {final _that = this;
switch (_that) {
case _ParentView():
return $default(_that.id,_that.displayName);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'display_name')  String displayName)?  $default,) {final _that = this;
switch (_that) {
case _ParentView() when $default != null:
return $default(_that.id,_that.displayName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ParentView implements ParentView {
  const _ParentView({required this.id, @JsonKey(name: 'display_name') required this.displayName});
  factory _ParentView.fromJson(Map<String, dynamic> json) => _$ParentViewFromJson(json);

@override final  String id;
@override@JsonKey(name: 'display_name') final  String displayName;

/// Create a copy of ParentView
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ParentViewCopyWith<_ParentView> get copyWith => __$ParentViewCopyWithImpl<_ParentView>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ParentViewToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ParentView&&(identical(other.id, id) || other.id == id)&&(identical(other.displayName, displayName) || other.displayName == displayName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,displayName);

@override
String toString() {
  return 'ParentView(id: $id, displayName: $displayName)';
}


}

/// @nodoc
abstract mixin class _$ParentViewCopyWith<$Res> implements $ParentViewCopyWith<$Res> {
  factory _$ParentViewCopyWith(_ParentView value, $Res Function(_ParentView) _then) = __$ParentViewCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'display_name') String displayName
});




}
/// @nodoc
class __$ParentViewCopyWithImpl<$Res>
    implements _$ParentViewCopyWith<$Res> {
  __$ParentViewCopyWithImpl(this._self, this._then);

  final _ParentView _self;
  final $Res Function(_ParentView) _then;

/// Create a copy of ParentView
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? displayName = null,}) {
  return _then(_ParentView(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$ChildView {

 String get id;@JsonKey(name: 'display_name') String get displayName;@JsonKey(name: 'birth_year') int? get birthYear;
/// Create a copy of ChildView
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChildViewCopyWith<ChildView> get copyWith => _$ChildViewCopyWithImpl<ChildView>(this as ChildView, _$identity);

  /// Serializes this ChildView to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChildView&&(identical(other.id, id) || other.id == id)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.birthYear, birthYear) || other.birthYear == birthYear));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,displayName,birthYear);

@override
String toString() {
  return 'ChildView(id: $id, displayName: $displayName, birthYear: $birthYear)';
}


}

/// @nodoc
abstract mixin class $ChildViewCopyWith<$Res>  {
  factory $ChildViewCopyWith(ChildView value, $Res Function(ChildView) _then) = _$ChildViewCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'display_name') String displayName,@JsonKey(name: 'birth_year') int? birthYear
});




}
/// @nodoc
class _$ChildViewCopyWithImpl<$Res>
    implements $ChildViewCopyWith<$Res> {
  _$ChildViewCopyWithImpl(this._self, this._then);

  final ChildView _self;
  final $Res Function(ChildView) _then;

/// Create a copy of ChildView
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? displayName = null,Object? birthYear = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,birthYear: freezed == birthYear ? _self.birthYear : birthYear // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [ChildView].
extension ChildViewPatterns on ChildView {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChildView value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChildView() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChildView value)  $default,){
final _that = this;
switch (_that) {
case _ChildView():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChildView value)?  $default,){
final _that = this;
switch (_that) {
case _ChildView() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'display_name')  String displayName, @JsonKey(name: 'birth_year')  int? birthYear)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChildView() when $default != null:
return $default(_that.id,_that.displayName,_that.birthYear);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'display_name')  String displayName, @JsonKey(name: 'birth_year')  int? birthYear)  $default,) {final _that = this;
switch (_that) {
case _ChildView():
return $default(_that.id,_that.displayName,_that.birthYear);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'display_name')  String displayName, @JsonKey(name: 'birth_year')  int? birthYear)?  $default,) {final _that = this;
switch (_that) {
case _ChildView() when $default != null:
return $default(_that.id,_that.displayName,_that.birthYear);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChildView implements ChildView {
  const _ChildView({required this.id, @JsonKey(name: 'display_name') required this.displayName, @JsonKey(name: 'birth_year') this.birthYear});
  factory _ChildView.fromJson(Map<String, dynamic> json) => _$ChildViewFromJson(json);

@override final  String id;
@override@JsonKey(name: 'display_name') final  String displayName;
@override@JsonKey(name: 'birth_year') final  int? birthYear;

/// Create a copy of ChildView
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChildViewCopyWith<_ChildView> get copyWith => __$ChildViewCopyWithImpl<_ChildView>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChildViewToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChildView&&(identical(other.id, id) || other.id == id)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.birthYear, birthYear) || other.birthYear == birthYear));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,displayName,birthYear);

@override
String toString() {
  return 'ChildView(id: $id, displayName: $displayName, birthYear: $birthYear)';
}


}

/// @nodoc
abstract mixin class _$ChildViewCopyWith<$Res> implements $ChildViewCopyWith<$Res> {
  factory _$ChildViewCopyWith(_ChildView value, $Res Function(_ChildView) _then) = __$ChildViewCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'display_name') String displayName,@JsonKey(name: 'birth_year') int? birthYear
});




}
/// @nodoc
class __$ChildViewCopyWithImpl<$Res>
    implements _$ChildViewCopyWith<$Res> {
  __$ChildViewCopyWithImpl(this._self, this._then);

  final _ChildView _self;
  final $Res Function(_ChildView) _then;

/// Create a copy of ChildView
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? displayName = null,Object? birthYear = freezed,}) {
  return _then(_ChildView(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,birthYear: freezed == birthYear ? _self.birthYear : birthYear // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$DeviceView {

 String get id;@JsonKey(name: 'child_id') String get childId; String get hostname; String get platform;@JsonKey(name: 'last_seen_at') DateTime get lastSeenAt;
/// Create a copy of DeviceView
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeviceViewCopyWith<DeviceView> get copyWith => _$DeviceViewCopyWithImpl<DeviceView>(this as DeviceView, _$identity);

  /// Serializes this DeviceView to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeviceView&&(identical(other.id, id) || other.id == id)&&(identical(other.childId, childId) || other.childId == childId)&&(identical(other.hostname, hostname) || other.hostname == hostname)&&(identical(other.platform, platform) || other.platform == platform)&&(identical(other.lastSeenAt, lastSeenAt) || other.lastSeenAt == lastSeenAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,childId,hostname,platform,lastSeenAt);

@override
String toString() {
  return 'DeviceView(id: $id, childId: $childId, hostname: $hostname, platform: $platform, lastSeenAt: $lastSeenAt)';
}


}

/// @nodoc
abstract mixin class $DeviceViewCopyWith<$Res>  {
  factory $DeviceViewCopyWith(DeviceView value, $Res Function(DeviceView) _then) = _$DeviceViewCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'child_id') String childId, String hostname, String platform,@JsonKey(name: 'last_seen_at') DateTime lastSeenAt
});




}
/// @nodoc
class _$DeviceViewCopyWithImpl<$Res>
    implements $DeviceViewCopyWith<$Res> {
  _$DeviceViewCopyWithImpl(this._self, this._then);

  final DeviceView _self;
  final $Res Function(DeviceView) _then;

/// Create a copy of DeviceView
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? childId = null,Object? hostname = null,Object? platform = null,Object? lastSeenAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,childId: null == childId ? _self.childId : childId // ignore: cast_nullable_to_non_nullable
as String,hostname: null == hostname ? _self.hostname : hostname // ignore: cast_nullable_to_non_nullable
as String,platform: null == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as String,lastSeenAt: null == lastSeenAt ? _self.lastSeenAt : lastSeenAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [DeviceView].
extension DeviceViewPatterns on DeviceView {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeviceView value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeviceView() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeviceView value)  $default,){
final _that = this;
switch (_that) {
case _DeviceView():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeviceView value)?  $default,){
final _that = this;
switch (_that) {
case _DeviceView() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'child_id')  String childId,  String hostname,  String platform, @JsonKey(name: 'last_seen_at')  DateTime lastSeenAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeviceView() when $default != null:
return $default(_that.id,_that.childId,_that.hostname,_that.platform,_that.lastSeenAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'child_id')  String childId,  String hostname,  String platform, @JsonKey(name: 'last_seen_at')  DateTime lastSeenAt)  $default,) {final _that = this;
switch (_that) {
case _DeviceView():
return $default(_that.id,_that.childId,_that.hostname,_that.platform,_that.lastSeenAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'child_id')  String childId,  String hostname,  String platform, @JsonKey(name: 'last_seen_at')  DateTime lastSeenAt)?  $default,) {final _that = this;
switch (_that) {
case _DeviceView() when $default != null:
return $default(_that.id,_that.childId,_that.hostname,_that.platform,_that.lastSeenAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DeviceView implements DeviceView {
  const _DeviceView({required this.id, @JsonKey(name: 'child_id') required this.childId, required this.hostname, required this.platform, @JsonKey(name: 'last_seen_at') required this.lastSeenAt});
  factory _DeviceView.fromJson(Map<String, dynamic> json) => _$DeviceViewFromJson(json);

@override final  String id;
@override@JsonKey(name: 'child_id') final  String childId;
@override final  String hostname;
@override final  String platform;
@override@JsonKey(name: 'last_seen_at') final  DateTime lastSeenAt;

/// Create a copy of DeviceView
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeviceViewCopyWith<_DeviceView> get copyWith => __$DeviceViewCopyWithImpl<_DeviceView>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeviceViewToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeviceView&&(identical(other.id, id) || other.id == id)&&(identical(other.childId, childId) || other.childId == childId)&&(identical(other.hostname, hostname) || other.hostname == hostname)&&(identical(other.platform, platform) || other.platform == platform)&&(identical(other.lastSeenAt, lastSeenAt) || other.lastSeenAt == lastSeenAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,childId,hostname,platform,lastSeenAt);

@override
String toString() {
  return 'DeviceView(id: $id, childId: $childId, hostname: $hostname, platform: $platform, lastSeenAt: $lastSeenAt)';
}


}

/// @nodoc
abstract mixin class _$DeviceViewCopyWith<$Res> implements $DeviceViewCopyWith<$Res> {
  factory _$DeviceViewCopyWith(_DeviceView value, $Res Function(_DeviceView) _then) = __$DeviceViewCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'child_id') String childId, String hostname, String platform,@JsonKey(name: 'last_seen_at') DateTime lastSeenAt
});




}
/// @nodoc
class __$DeviceViewCopyWithImpl<$Res>
    implements _$DeviceViewCopyWith<$Res> {
  __$DeviceViewCopyWithImpl(this._self, this._then);

  final _DeviceView _self;
  final $Res Function(_DeviceView) _then;

/// Create a copy of DeviceView
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? childId = null,Object? hostname = null,Object? platform = null,Object? lastSeenAt = null,}) {
  return _then(_DeviceView(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,childId: null == childId ? _self.childId : childId // ignore: cast_nullable_to_non_nullable
as String,hostname: null == hostname ? _self.hostname : hostname // ignore: cast_nullable_to_non_nullable
as String,platform: null == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as String,lastSeenAt: null == lastSeenAt ? _self.lastSeenAt : lastSeenAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$FamilySnapshot {

@JsonKey(name: 'family_id') String get familyId;@JsonKey(name: 'family_name') String get familyName; List<ParentView> get parents; List<ChildView> get children; List<DeviceView> get devices;
/// Create a copy of FamilySnapshot
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FamilySnapshotCopyWith<FamilySnapshot> get copyWith => _$FamilySnapshotCopyWithImpl<FamilySnapshot>(this as FamilySnapshot, _$identity);

  /// Serializes this FamilySnapshot to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FamilySnapshot&&(identical(other.familyId, familyId) || other.familyId == familyId)&&(identical(other.familyName, familyName) || other.familyName == familyName)&&const DeepCollectionEquality().equals(other.parents, parents)&&const DeepCollectionEquality().equals(other.children, children)&&const DeepCollectionEquality().equals(other.devices, devices));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,familyId,familyName,const DeepCollectionEquality().hash(parents),const DeepCollectionEquality().hash(children),const DeepCollectionEquality().hash(devices));

@override
String toString() {
  return 'FamilySnapshot(familyId: $familyId, familyName: $familyName, parents: $parents, children: $children, devices: $devices)';
}


}

/// @nodoc
abstract mixin class $FamilySnapshotCopyWith<$Res>  {
  factory $FamilySnapshotCopyWith(FamilySnapshot value, $Res Function(FamilySnapshot) _then) = _$FamilySnapshotCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'family_id') String familyId,@JsonKey(name: 'family_name') String familyName, List<ParentView> parents, List<ChildView> children, List<DeviceView> devices
});




}
/// @nodoc
class _$FamilySnapshotCopyWithImpl<$Res>
    implements $FamilySnapshotCopyWith<$Res> {
  _$FamilySnapshotCopyWithImpl(this._self, this._then);

  final FamilySnapshot _self;
  final $Res Function(FamilySnapshot) _then;

/// Create a copy of FamilySnapshot
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? familyId = null,Object? familyName = null,Object? parents = null,Object? children = null,Object? devices = null,}) {
  return _then(_self.copyWith(
familyId: null == familyId ? _self.familyId : familyId // ignore: cast_nullable_to_non_nullable
as String,familyName: null == familyName ? _self.familyName : familyName // ignore: cast_nullable_to_non_nullable
as String,parents: null == parents ? _self.parents : parents // ignore: cast_nullable_to_non_nullable
as List<ParentView>,children: null == children ? _self.children : children // ignore: cast_nullable_to_non_nullable
as List<ChildView>,devices: null == devices ? _self.devices : devices // ignore: cast_nullable_to_non_nullable
as List<DeviceView>,
  ));
}

}


/// Adds pattern-matching-related methods to [FamilySnapshot].
extension FamilySnapshotPatterns on FamilySnapshot {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FamilySnapshot value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FamilySnapshot() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FamilySnapshot value)  $default,){
final _that = this;
switch (_that) {
case _FamilySnapshot():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FamilySnapshot value)?  $default,){
final _that = this;
switch (_that) {
case _FamilySnapshot() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'family_id')  String familyId, @JsonKey(name: 'family_name')  String familyName,  List<ParentView> parents,  List<ChildView> children,  List<DeviceView> devices)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FamilySnapshot() when $default != null:
return $default(_that.familyId,_that.familyName,_that.parents,_that.children,_that.devices);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'family_id')  String familyId, @JsonKey(name: 'family_name')  String familyName,  List<ParentView> parents,  List<ChildView> children,  List<DeviceView> devices)  $default,) {final _that = this;
switch (_that) {
case _FamilySnapshot():
return $default(_that.familyId,_that.familyName,_that.parents,_that.children,_that.devices);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'family_id')  String familyId, @JsonKey(name: 'family_name')  String familyName,  List<ParentView> parents,  List<ChildView> children,  List<DeviceView> devices)?  $default,) {final _that = this;
switch (_that) {
case _FamilySnapshot() when $default != null:
return $default(_that.familyId,_that.familyName,_that.parents,_that.children,_that.devices);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FamilySnapshot implements FamilySnapshot {
  const _FamilySnapshot({@JsonKey(name: 'family_id') required this.familyId, @JsonKey(name: 'family_name') required this.familyName, required final  List<ParentView> parents, required final  List<ChildView> children, required final  List<DeviceView> devices}): _parents = parents,_children = children,_devices = devices;
  factory _FamilySnapshot.fromJson(Map<String, dynamic> json) => _$FamilySnapshotFromJson(json);

@override@JsonKey(name: 'family_id') final  String familyId;
@override@JsonKey(name: 'family_name') final  String familyName;
 final  List<ParentView> _parents;
@override List<ParentView> get parents {
  if (_parents is EqualUnmodifiableListView) return _parents;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_parents);
}

 final  List<ChildView> _children;
@override List<ChildView> get children {
  if (_children is EqualUnmodifiableListView) return _children;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_children);
}

 final  List<DeviceView> _devices;
@override List<DeviceView> get devices {
  if (_devices is EqualUnmodifiableListView) return _devices;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_devices);
}


/// Create a copy of FamilySnapshot
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FamilySnapshotCopyWith<_FamilySnapshot> get copyWith => __$FamilySnapshotCopyWithImpl<_FamilySnapshot>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FamilySnapshotToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FamilySnapshot&&(identical(other.familyId, familyId) || other.familyId == familyId)&&(identical(other.familyName, familyName) || other.familyName == familyName)&&const DeepCollectionEquality().equals(other._parents, _parents)&&const DeepCollectionEquality().equals(other._children, _children)&&const DeepCollectionEquality().equals(other._devices, _devices));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,familyId,familyName,const DeepCollectionEquality().hash(_parents),const DeepCollectionEquality().hash(_children),const DeepCollectionEquality().hash(_devices));

@override
String toString() {
  return 'FamilySnapshot(familyId: $familyId, familyName: $familyName, parents: $parents, children: $children, devices: $devices)';
}


}

/// @nodoc
abstract mixin class _$FamilySnapshotCopyWith<$Res> implements $FamilySnapshotCopyWith<$Res> {
  factory _$FamilySnapshotCopyWith(_FamilySnapshot value, $Res Function(_FamilySnapshot) _then) = __$FamilySnapshotCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'family_id') String familyId,@JsonKey(name: 'family_name') String familyName, List<ParentView> parents, List<ChildView> children, List<DeviceView> devices
});




}
/// @nodoc
class __$FamilySnapshotCopyWithImpl<$Res>
    implements _$FamilySnapshotCopyWith<$Res> {
  __$FamilySnapshotCopyWithImpl(this._self, this._then);

  final _FamilySnapshot _self;
  final $Res Function(_FamilySnapshot) _then;

/// Create a copy of FamilySnapshot
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? familyId = null,Object? familyName = null,Object? parents = null,Object? children = null,Object? devices = null,}) {
  return _then(_FamilySnapshot(
familyId: null == familyId ? _self.familyId : familyId // ignore: cast_nullable_to_non_nullable
as String,familyName: null == familyName ? _self.familyName : familyName // ignore: cast_nullable_to_non_nullable
as String,parents: null == parents ? _self._parents : parents // ignore: cast_nullable_to_non_nullable
as List<ParentView>,children: null == children ? _self._children : children // ignore: cast_nullable_to_non_nullable
as List<ChildView>,devices: null == devices ? _self._devices : devices // ignore: cast_nullable_to_non_nullable
as List<DeviceView>,
  ));
}


}


/// @nodoc
mixin _$PolicyView {

 String get id;@JsonKey(name: 'child_id') String get childId;@JsonKey(fromJson: _scopeFromJson) Object get scope; List<Map<String, dynamic>> get rules; int get priority;@JsonKey(name: 'active_from') DateTime? get activeFrom;@JsonKey(name: 'active_until') DateTime? get activeUntil;
/// Create a copy of PolicyView
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PolicyViewCopyWith<PolicyView> get copyWith => _$PolicyViewCopyWithImpl<PolicyView>(this as PolicyView, _$identity);

  /// Serializes this PolicyView to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PolicyView&&(identical(other.id, id) || other.id == id)&&(identical(other.childId, childId) || other.childId == childId)&&const DeepCollectionEquality().equals(other.scope, scope)&&const DeepCollectionEquality().equals(other.rules, rules)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.activeFrom, activeFrom) || other.activeFrom == activeFrom)&&(identical(other.activeUntil, activeUntil) || other.activeUntil == activeUntil));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,childId,const DeepCollectionEquality().hash(scope),const DeepCollectionEquality().hash(rules),priority,activeFrom,activeUntil);

@override
String toString() {
  return 'PolicyView(id: $id, childId: $childId, scope: $scope, rules: $rules, priority: $priority, activeFrom: $activeFrom, activeUntil: $activeUntil)';
}


}

/// @nodoc
abstract mixin class $PolicyViewCopyWith<$Res>  {
  factory $PolicyViewCopyWith(PolicyView value, $Res Function(PolicyView) _then) = _$PolicyViewCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'child_id') String childId,@JsonKey(fromJson: _scopeFromJson) Object scope, List<Map<String, dynamic>> rules, int priority,@JsonKey(name: 'active_from') DateTime? activeFrom,@JsonKey(name: 'active_until') DateTime? activeUntil
});




}
/// @nodoc
class _$PolicyViewCopyWithImpl<$Res>
    implements $PolicyViewCopyWith<$Res> {
  _$PolicyViewCopyWithImpl(this._self, this._then);

  final PolicyView _self;
  final $Res Function(PolicyView) _then;

/// Create a copy of PolicyView
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? childId = null,Object? scope = null,Object? rules = null,Object? priority = null,Object? activeFrom = freezed,Object? activeUntil = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,childId: null == childId ? _self.childId : childId // ignore: cast_nullable_to_non_nullable
as String,scope: null == scope ? _self.scope : scope ,rules: null == rules ? _self.rules : rules // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as int,activeFrom: freezed == activeFrom ? _self.activeFrom : activeFrom // ignore: cast_nullable_to_non_nullable
as DateTime?,activeUntil: freezed == activeUntil ? _self.activeUntil : activeUntil // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [PolicyView].
extension PolicyViewPatterns on PolicyView {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PolicyView value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PolicyView() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PolicyView value)  $default,){
final _that = this;
switch (_that) {
case _PolicyView():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PolicyView value)?  $default,){
final _that = this;
switch (_that) {
case _PolicyView() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'child_id')  String childId, @JsonKey(fromJson: _scopeFromJson)  Object scope,  List<Map<String, dynamic>> rules,  int priority, @JsonKey(name: 'active_from')  DateTime? activeFrom, @JsonKey(name: 'active_until')  DateTime? activeUntil)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PolicyView() when $default != null:
return $default(_that.id,_that.childId,_that.scope,_that.rules,_that.priority,_that.activeFrom,_that.activeUntil);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'child_id')  String childId, @JsonKey(fromJson: _scopeFromJson)  Object scope,  List<Map<String, dynamic>> rules,  int priority, @JsonKey(name: 'active_from')  DateTime? activeFrom, @JsonKey(name: 'active_until')  DateTime? activeUntil)  $default,) {final _that = this;
switch (_that) {
case _PolicyView():
return $default(_that.id,_that.childId,_that.scope,_that.rules,_that.priority,_that.activeFrom,_that.activeUntil);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'child_id')  String childId, @JsonKey(fromJson: _scopeFromJson)  Object scope,  List<Map<String, dynamic>> rules,  int priority, @JsonKey(name: 'active_from')  DateTime? activeFrom, @JsonKey(name: 'active_until')  DateTime? activeUntil)?  $default,) {final _that = this;
switch (_that) {
case _PolicyView() when $default != null:
return $default(_that.id,_that.childId,_that.scope,_that.rules,_that.priority,_that.activeFrom,_that.activeUntil);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PolicyView implements PolicyView {
  const _PolicyView({required this.id, @JsonKey(name: 'child_id') required this.childId, @JsonKey(fromJson: _scopeFromJson) required this.scope, required final  List<Map<String, dynamic>> rules, required this.priority, @JsonKey(name: 'active_from') this.activeFrom, @JsonKey(name: 'active_until') this.activeUntil}): _rules = rules;
  factory _PolicyView.fromJson(Map<String, dynamic> json) => _$PolicyViewFromJson(json);

@override final  String id;
@override@JsonKey(name: 'child_id') final  String childId;
@override@JsonKey(fromJson: _scopeFromJson) final  Object scope;
 final  List<Map<String, dynamic>> _rules;
@override List<Map<String, dynamic>> get rules {
  if (_rules is EqualUnmodifiableListView) return _rules;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_rules);
}

@override final  int priority;
@override@JsonKey(name: 'active_from') final  DateTime? activeFrom;
@override@JsonKey(name: 'active_until') final  DateTime? activeUntil;

/// Create a copy of PolicyView
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PolicyViewCopyWith<_PolicyView> get copyWith => __$PolicyViewCopyWithImpl<_PolicyView>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PolicyViewToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PolicyView&&(identical(other.id, id) || other.id == id)&&(identical(other.childId, childId) || other.childId == childId)&&const DeepCollectionEquality().equals(other.scope, scope)&&const DeepCollectionEquality().equals(other._rules, _rules)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.activeFrom, activeFrom) || other.activeFrom == activeFrom)&&(identical(other.activeUntil, activeUntil) || other.activeUntil == activeUntil));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,childId,const DeepCollectionEquality().hash(scope),const DeepCollectionEquality().hash(_rules),priority,activeFrom,activeUntil);

@override
String toString() {
  return 'PolicyView(id: $id, childId: $childId, scope: $scope, rules: $rules, priority: $priority, activeFrom: $activeFrom, activeUntil: $activeUntil)';
}


}

/// @nodoc
abstract mixin class _$PolicyViewCopyWith<$Res> implements $PolicyViewCopyWith<$Res> {
  factory _$PolicyViewCopyWith(_PolicyView value, $Res Function(_PolicyView) _then) = __$PolicyViewCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'child_id') String childId,@JsonKey(fromJson: _scopeFromJson) Object scope, List<Map<String, dynamic>> rules, int priority,@JsonKey(name: 'active_from') DateTime? activeFrom,@JsonKey(name: 'active_until') DateTime? activeUntil
});




}
/// @nodoc
class __$PolicyViewCopyWithImpl<$Res>
    implements _$PolicyViewCopyWith<$Res> {
  __$PolicyViewCopyWithImpl(this._self, this._then);

  final _PolicyView _self;
  final $Res Function(_PolicyView) _then;

/// Create a copy of PolicyView
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? childId = null,Object? scope = null,Object? rules = null,Object? priority = null,Object? activeFrom = freezed,Object? activeUntil = freezed,}) {
  return _then(_PolicyView(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,childId: null == childId ? _self.childId : childId // ignore: cast_nullable_to_non_nullable
as String,scope: null == scope ? _self.scope : scope ,rules: null == rules ? _self._rules : rules // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as int,activeFrom: freezed == activeFrom ? _self.activeFrom : activeFrom // ignore: cast_nullable_to_non_nullable
as DateTime?,activeUntil: freezed == activeUntil ? _self.activeUntil : activeUntil // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$DailyUsage {

 DateTime get date; int get minutes;
/// Create a copy of DailyUsage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DailyUsageCopyWith<DailyUsage> get copyWith => _$DailyUsageCopyWithImpl<DailyUsage>(this as DailyUsage, _$identity);

  /// Serializes this DailyUsage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyUsage&&(identical(other.date, date) || other.date == date)&&(identical(other.minutes, minutes) || other.minutes == minutes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,minutes);

@override
String toString() {
  return 'DailyUsage(date: $date, minutes: $minutes)';
}


}

/// @nodoc
abstract mixin class $DailyUsageCopyWith<$Res>  {
  factory $DailyUsageCopyWith(DailyUsage value, $Res Function(DailyUsage) _then) = _$DailyUsageCopyWithImpl;
@useResult
$Res call({
 DateTime date, int minutes
});




}
/// @nodoc
class _$DailyUsageCopyWithImpl<$Res>
    implements $DailyUsageCopyWith<$Res> {
  _$DailyUsageCopyWithImpl(this._self, this._then);

  final DailyUsage _self;
  final $Res Function(DailyUsage) _then;

/// Create a copy of DailyUsage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? minutes = null,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,minutes: null == minutes ? _self.minutes : minutes // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [DailyUsage].
extension DailyUsagePatterns on DailyUsage {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DailyUsage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DailyUsage() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DailyUsage value)  $default,){
final _that = this;
switch (_that) {
case _DailyUsage():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DailyUsage value)?  $default,){
final _that = this;
switch (_that) {
case _DailyUsage() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime date,  int minutes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DailyUsage() when $default != null:
return $default(_that.date,_that.minutes);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime date,  int minutes)  $default,) {final _that = this;
switch (_that) {
case _DailyUsage():
return $default(_that.date,_that.minutes);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime date,  int minutes)?  $default,) {final _that = this;
switch (_that) {
case _DailyUsage() when $default != null:
return $default(_that.date,_that.minutes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DailyUsage implements DailyUsage {
  const _DailyUsage({required this.date, required this.minutes});
  factory _DailyUsage.fromJson(Map<String, dynamic> json) => _$DailyUsageFromJson(json);

@override final  DateTime date;
@override final  int minutes;

/// Create a copy of DailyUsage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DailyUsageCopyWith<_DailyUsage> get copyWith => __$DailyUsageCopyWithImpl<_DailyUsage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DailyUsageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DailyUsage&&(identical(other.date, date) || other.date == date)&&(identical(other.minutes, minutes) || other.minutes == minutes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,minutes);

@override
String toString() {
  return 'DailyUsage(date: $date, minutes: $minutes)';
}


}

/// @nodoc
abstract mixin class _$DailyUsageCopyWith<$Res> implements $DailyUsageCopyWith<$Res> {
  factory _$DailyUsageCopyWith(_DailyUsage value, $Res Function(_DailyUsage) _then) = __$DailyUsageCopyWithImpl;
@override @useResult
$Res call({
 DateTime date, int minutes
});




}
/// @nodoc
class __$DailyUsageCopyWithImpl<$Res>
    implements _$DailyUsageCopyWith<$Res> {
  __$DailyUsageCopyWithImpl(this._self, this._then);

  final _DailyUsage _self;
  final $Res Function(_DailyUsage) _then;

/// Create a copy of DailyUsage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? minutes = null,}) {
  return _then(_DailyUsage(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,minutes: null == minutes ? _self.minutes : minutes // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$UsageReport {

@JsonKey(name: 'child_id') String get childId; DateTime get from; DateTime get to; List<DailyUsage> get days;
/// Create a copy of UsageReport
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UsageReportCopyWith<UsageReport> get copyWith => _$UsageReportCopyWithImpl<UsageReport>(this as UsageReport, _$identity);

  /// Serializes this UsageReport to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UsageReport&&(identical(other.childId, childId) || other.childId == childId)&&(identical(other.from, from) || other.from == from)&&(identical(other.to, to) || other.to == to)&&const DeepCollectionEquality().equals(other.days, days));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,childId,from,to,const DeepCollectionEquality().hash(days));

@override
String toString() {
  return 'UsageReport(childId: $childId, from: $from, to: $to, days: $days)';
}


}

/// @nodoc
abstract mixin class $UsageReportCopyWith<$Res>  {
  factory $UsageReportCopyWith(UsageReport value, $Res Function(UsageReport) _then) = _$UsageReportCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'child_id') String childId, DateTime from, DateTime to, List<DailyUsage> days
});




}
/// @nodoc
class _$UsageReportCopyWithImpl<$Res>
    implements $UsageReportCopyWith<$Res> {
  _$UsageReportCopyWithImpl(this._self, this._then);

  final UsageReport _self;
  final $Res Function(UsageReport) _then;

/// Create a copy of UsageReport
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? childId = null,Object? from = null,Object? to = null,Object? days = null,}) {
  return _then(_self.copyWith(
childId: null == childId ? _self.childId : childId // ignore: cast_nullable_to_non_nullable
as String,from: null == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as DateTime,to: null == to ? _self.to : to // ignore: cast_nullable_to_non_nullable
as DateTime,days: null == days ? _self.days : days // ignore: cast_nullable_to_non_nullable
as List<DailyUsage>,
  ));
}

}


/// Adds pattern-matching-related methods to [UsageReport].
extension UsageReportPatterns on UsageReport {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UsageReport value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UsageReport() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UsageReport value)  $default,){
final _that = this;
switch (_that) {
case _UsageReport():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UsageReport value)?  $default,){
final _that = this;
switch (_that) {
case _UsageReport() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'child_id')  String childId,  DateTime from,  DateTime to,  List<DailyUsage> days)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UsageReport() when $default != null:
return $default(_that.childId,_that.from,_that.to,_that.days);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'child_id')  String childId,  DateTime from,  DateTime to,  List<DailyUsage> days)  $default,) {final _that = this;
switch (_that) {
case _UsageReport():
return $default(_that.childId,_that.from,_that.to,_that.days);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'child_id')  String childId,  DateTime from,  DateTime to,  List<DailyUsage> days)?  $default,) {final _that = this;
switch (_that) {
case _UsageReport() when $default != null:
return $default(_that.childId,_that.from,_that.to,_that.days);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UsageReport implements UsageReport {
  const _UsageReport({@JsonKey(name: 'child_id') required this.childId, required this.from, required this.to, required final  List<DailyUsage> days}): _days = days;
  factory _UsageReport.fromJson(Map<String, dynamic> json) => _$UsageReportFromJson(json);

@override@JsonKey(name: 'child_id') final  String childId;
@override final  DateTime from;
@override final  DateTime to;
 final  List<DailyUsage> _days;
@override List<DailyUsage> get days {
  if (_days is EqualUnmodifiableListView) return _days;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_days);
}


/// Create a copy of UsageReport
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UsageReportCopyWith<_UsageReport> get copyWith => __$UsageReportCopyWithImpl<_UsageReport>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UsageReportToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UsageReport&&(identical(other.childId, childId) || other.childId == childId)&&(identical(other.from, from) || other.from == from)&&(identical(other.to, to) || other.to == to)&&const DeepCollectionEquality().equals(other._days, _days));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,childId,from,to,const DeepCollectionEquality().hash(_days));

@override
String toString() {
  return 'UsageReport(childId: $childId, from: $from, to: $to, days: $days)';
}


}

/// @nodoc
abstract mixin class _$UsageReportCopyWith<$Res> implements $UsageReportCopyWith<$Res> {
  factory _$UsageReportCopyWith(_UsageReport value, $Res Function(_UsageReport) _then) = __$UsageReportCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'child_id') String childId, DateTime from, DateTime to, List<DailyUsage> days
});




}
/// @nodoc
class __$UsageReportCopyWithImpl<$Res>
    implements _$UsageReportCopyWith<$Res> {
  __$UsageReportCopyWithImpl(this._self, this._then);

  final _UsageReport _self;
  final $Res Function(_UsageReport) _then;

/// Create a copy of UsageReport
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? childId = null,Object? from = null,Object? to = null,Object? days = null,}) {
  return _then(_UsageReport(
childId: null == childId ? _self.childId : childId // ignore: cast_nullable_to_non_nullable
as String,from: null == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as DateTime,to: null == to ? _self.to : to // ignore: cast_nullable_to_non_nullable
as DateTime,days: null == days ? _self._days : days // ignore: cast_nullable_to_non_nullable
as List<DailyUsage>,
  ));
}


}


/// @nodoc
mixin _$PendingExtension {

 String get id;@JsonKey(name: 'child_id') String get childId;@JsonKey(name: 'granted_by_parent_id') String? get grantedByParentId; String get status; String? get reason;@JsonKey(name: 'duration_minutes') int? get durationMinutes;@JsonKey(name: 'granted_at') DateTime? get grantedAt;@JsonKey(name: 'expires_at') DateTime? get expiresAt;@JsonKey(name: 'created_at') DateTime get createdAt;
/// Create a copy of PendingExtension
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PendingExtensionCopyWith<PendingExtension> get copyWith => _$PendingExtensionCopyWithImpl<PendingExtension>(this as PendingExtension, _$identity);

  /// Serializes this PendingExtension to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PendingExtension&&(identical(other.id, id) || other.id == id)&&(identical(other.childId, childId) || other.childId == childId)&&(identical(other.grantedByParentId, grantedByParentId) || other.grantedByParentId == grantedByParentId)&&(identical(other.status, status) || other.status == status)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.durationMinutes, durationMinutes) || other.durationMinutes == durationMinutes)&&(identical(other.grantedAt, grantedAt) || other.grantedAt == grantedAt)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,childId,grantedByParentId,status,reason,durationMinutes,grantedAt,expiresAt,createdAt);

@override
String toString() {
  return 'PendingExtension(id: $id, childId: $childId, grantedByParentId: $grantedByParentId, status: $status, reason: $reason, durationMinutes: $durationMinutes, grantedAt: $grantedAt, expiresAt: $expiresAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $PendingExtensionCopyWith<$Res>  {
  factory $PendingExtensionCopyWith(PendingExtension value, $Res Function(PendingExtension) _then) = _$PendingExtensionCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'child_id') String childId,@JsonKey(name: 'granted_by_parent_id') String? grantedByParentId, String status, String? reason,@JsonKey(name: 'duration_minutes') int? durationMinutes,@JsonKey(name: 'granted_at') DateTime? grantedAt,@JsonKey(name: 'expires_at') DateTime? expiresAt,@JsonKey(name: 'created_at') DateTime createdAt
});




}
/// @nodoc
class _$PendingExtensionCopyWithImpl<$Res>
    implements $PendingExtensionCopyWith<$Res> {
  _$PendingExtensionCopyWithImpl(this._self, this._then);

  final PendingExtension _self;
  final $Res Function(PendingExtension) _then;

/// Create a copy of PendingExtension
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? childId = null,Object? grantedByParentId = freezed,Object? status = null,Object? reason = freezed,Object? durationMinutes = freezed,Object? grantedAt = freezed,Object? expiresAt = freezed,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,childId: null == childId ? _self.childId : childId // ignore: cast_nullable_to_non_nullable
as String,grantedByParentId: freezed == grantedByParentId ? _self.grantedByParentId : grantedByParentId // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,durationMinutes: freezed == durationMinutes ? _self.durationMinutes : durationMinutes // ignore: cast_nullable_to_non_nullable
as int?,grantedAt: freezed == grantedAt ? _self.grantedAt : grantedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [PendingExtension].
extension PendingExtensionPatterns on PendingExtension {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PendingExtension value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PendingExtension() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PendingExtension value)  $default,){
final _that = this;
switch (_that) {
case _PendingExtension():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PendingExtension value)?  $default,){
final _that = this;
switch (_that) {
case _PendingExtension() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'child_id')  String childId, @JsonKey(name: 'granted_by_parent_id')  String? grantedByParentId,  String status,  String? reason, @JsonKey(name: 'duration_minutes')  int? durationMinutes, @JsonKey(name: 'granted_at')  DateTime? grantedAt, @JsonKey(name: 'expires_at')  DateTime? expiresAt, @JsonKey(name: 'created_at')  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PendingExtension() when $default != null:
return $default(_that.id,_that.childId,_that.grantedByParentId,_that.status,_that.reason,_that.durationMinutes,_that.grantedAt,_that.expiresAt,_that.createdAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'child_id')  String childId, @JsonKey(name: 'granted_by_parent_id')  String? grantedByParentId,  String status,  String? reason, @JsonKey(name: 'duration_minutes')  int? durationMinutes, @JsonKey(name: 'granted_at')  DateTime? grantedAt, @JsonKey(name: 'expires_at')  DateTime? expiresAt, @JsonKey(name: 'created_at')  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _PendingExtension():
return $default(_that.id,_that.childId,_that.grantedByParentId,_that.status,_that.reason,_that.durationMinutes,_that.grantedAt,_that.expiresAt,_that.createdAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'child_id')  String childId, @JsonKey(name: 'granted_by_parent_id')  String? grantedByParentId,  String status,  String? reason, @JsonKey(name: 'duration_minutes')  int? durationMinutes, @JsonKey(name: 'granted_at')  DateTime? grantedAt, @JsonKey(name: 'expires_at')  DateTime? expiresAt, @JsonKey(name: 'created_at')  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _PendingExtension() when $default != null:
return $default(_that.id,_that.childId,_that.grantedByParentId,_that.status,_that.reason,_that.durationMinutes,_that.grantedAt,_that.expiresAt,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PendingExtension implements PendingExtension {
  const _PendingExtension({required this.id, @JsonKey(name: 'child_id') required this.childId, @JsonKey(name: 'granted_by_parent_id') this.grantedByParentId, required this.status, this.reason, @JsonKey(name: 'duration_minutes') this.durationMinutes, @JsonKey(name: 'granted_at') this.grantedAt, @JsonKey(name: 'expires_at') this.expiresAt, @JsonKey(name: 'created_at') required this.createdAt});
  factory _PendingExtension.fromJson(Map<String, dynamic> json) => _$PendingExtensionFromJson(json);

@override final  String id;
@override@JsonKey(name: 'child_id') final  String childId;
@override@JsonKey(name: 'granted_by_parent_id') final  String? grantedByParentId;
@override final  String status;
@override final  String? reason;
@override@JsonKey(name: 'duration_minutes') final  int? durationMinutes;
@override@JsonKey(name: 'granted_at') final  DateTime? grantedAt;
@override@JsonKey(name: 'expires_at') final  DateTime? expiresAt;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;

/// Create a copy of PendingExtension
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PendingExtensionCopyWith<_PendingExtension> get copyWith => __$PendingExtensionCopyWithImpl<_PendingExtension>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PendingExtensionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PendingExtension&&(identical(other.id, id) || other.id == id)&&(identical(other.childId, childId) || other.childId == childId)&&(identical(other.grantedByParentId, grantedByParentId) || other.grantedByParentId == grantedByParentId)&&(identical(other.status, status) || other.status == status)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.durationMinutes, durationMinutes) || other.durationMinutes == durationMinutes)&&(identical(other.grantedAt, grantedAt) || other.grantedAt == grantedAt)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,childId,grantedByParentId,status,reason,durationMinutes,grantedAt,expiresAt,createdAt);

@override
String toString() {
  return 'PendingExtension(id: $id, childId: $childId, grantedByParentId: $grantedByParentId, status: $status, reason: $reason, durationMinutes: $durationMinutes, grantedAt: $grantedAt, expiresAt: $expiresAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$PendingExtensionCopyWith<$Res> implements $PendingExtensionCopyWith<$Res> {
  factory _$PendingExtensionCopyWith(_PendingExtension value, $Res Function(_PendingExtension) _then) = __$PendingExtensionCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'child_id') String childId,@JsonKey(name: 'granted_by_parent_id') String? grantedByParentId, String status, String? reason,@JsonKey(name: 'duration_minutes') int? durationMinutes,@JsonKey(name: 'granted_at') DateTime? grantedAt,@JsonKey(name: 'expires_at') DateTime? expiresAt,@JsonKey(name: 'created_at') DateTime createdAt
});




}
/// @nodoc
class __$PendingExtensionCopyWithImpl<$Res>
    implements _$PendingExtensionCopyWith<$Res> {
  __$PendingExtensionCopyWithImpl(this._self, this._then);

  final _PendingExtension _self;
  final $Res Function(_PendingExtension) _then;

/// Create a copy of PendingExtension
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? childId = null,Object? grantedByParentId = freezed,Object? status = null,Object? reason = freezed,Object? durationMinutes = freezed,Object? grantedAt = freezed,Object? expiresAt = freezed,Object? createdAt = null,}) {
  return _then(_PendingExtension(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,childId: null == childId ? _self.childId : childId // ignore: cast_nullable_to_non_nullable
as String,grantedByParentId: freezed == grantedByParentId ? _self.grantedByParentId : grantedByParentId // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,durationMinutes: freezed == durationMinutes ? _self.durationMinutes : durationMinutes // ignore: cast_nullable_to_non_nullable
as int?,grantedAt: freezed == grantedAt ? _self.grantedAt : grantedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
