// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'planning_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PlanningRecord> _$planningRecordSerializer =
    new _$PlanningRecordSerializer();

class _$PlanningRecordSerializer
    implements StructuredSerializer<PlanningRecord> {
  @override
  final Iterable<Type> types = const [PlanningRecord, _$PlanningRecord];
  @override
  final String wireName = 'PlanningRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, PlanningRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.meal1;
    if (value != null) {
      result
        ..add('meal1')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.meal2;
    if (value != null) {
      result
        ..add('meal2')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.meal3;
    if (value != null) {
      result
        ..add('meal3')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.meal4;
    if (value != null) {
      result
        ..add('meal4')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.meal5;
    if (value != null) {
      result
        ..add('meal5')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.fechaPlanificacion;
    if (value != null) {
      result
        ..add('FechaPlanificacion')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  PlanningRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PlanningRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'meal1':
          result.meal1 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'meal2':
          result.meal2 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'meal3':
          result.meal3 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'meal4':
          result.meal4 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'meal5':
          result.meal5 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'FechaPlanificacion':
          result.fechaPlanificacion = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$PlanningRecord extends PlanningRecord {
  @override
  final String? meal1;
  @override
  final String? meal2;
  @override
  final String? meal3;
  @override
  final String? meal4;
  @override
  final String? meal5;
  @override
  final DateTime? fechaPlanificacion;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$PlanningRecord([void Function(PlanningRecordBuilder)? updates]) =>
      (new PlanningRecordBuilder()..update(updates))._build();

  _$PlanningRecord._(
      {this.meal1,
      this.meal2,
      this.meal3,
      this.meal4,
      this.meal5,
      this.fechaPlanificacion,
      this.ffRef})
      : super._();

  @override
  PlanningRecord rebuild(void Function(PlanningRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PlanningRecordBuilder toBuilder() =>
      new PlanningRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PlanningRecord &&
        meal1 == other.meal1 &&
        meal2 == other.meal2 &&
        meal3 == other.meal3 &&
        meal4 == other.meal4 &&
        meal5 == other.meal5 &&
        fechaPlanificacion == other.fechaPlanificacion &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, meal1.hashCode), meal2.hashCode),
                        meal3.hashCode),
                    meal4.hashCode),
                meal5.hashCode),
            fechaPlanificacion.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PlanningRecord')
          ..add('meal1', meal1)
          ..add('meal2', meal2)
          ..add('meal3', meal3)
          ..add('meal4', meal4)
          ..add('meal5', meal5)
          ..add('fechaPlanificacion', fechaPlanificacion)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class PlanningRecordBuilder
    implements Builder<PlanningRecord, PlanningRecordBuilder> {
  _$PlanningRecord? _$v;

  String? _meal1;
  String? get meal1 => _$this._meal1;
  set meal1(String? meal1) => _$this._meal1 = meal1;

  String? _meal2;
  String? get meal2 => _$this._meal2;
  set meal2(String? meal2) => _$this._meal2 = meal2;

  String? _meal3;
  String? get meal3 => _$this._meal3;
  set meal3(String? meal3) => _$this._meal3 = meal3;

  String? _meal4;
  String? get meal4 => _$this._meal4;
  set meal4(String? meal4) => _$this._meal4 = meal4;

  String? _meal5;
  String? get meal5 => _$this._meal5;
  set meal5(String? meal5) => _$this._meal5 = meal5;

  DateTime? _fechaPlanificacion;
  DateTime? get fechaPlanificacion => _$this._fechaPlanificacion;
  set fechaPlanificacion(DateTime? fechaPlanificacion) =>
      _$this._fechaPlanificacion = fechaPlanificacion;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  PlanningRecordBuilder() {
    PlanningRecord._initializeBuilder(this);
  }

  PlanningRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meal1 = $v.meal1;
      _meal2 = $v.meal2;
      _meal3 = $v.meal3;
      _meal4 = $v.meal4;
      _meal5 = $v.meal5;
      _fechaPlanificacion = $v.fechaPlanificacion;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PlanningRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PlanningRecord;
  }

  @override
  void update(void Function(PlanningRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PlanningRecord build() => _build();

  _$PlanningRecord _build() {
    final _$result = _$v ??
        new _$PlanningRecord._(
            meal1: meal1,
            meal2: meal2,
            meal3: meal3,
            meal4: meal4,
            meal5: meal5,
            fechaPlanificacion: fechaPlanificacion,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
