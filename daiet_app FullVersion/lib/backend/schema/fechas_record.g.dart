// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fechas_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<FechasRecord> _$fechasRecordSerializer =
    new _$FechasRecordSerializer();

class _$FechasRecordSerializer implements StructuredSerializer<FechasRecord> {
  @override
  final Iterable<Type> types = const [FechasRecord, _$FechasRecord];
  @override
  final String wireName = 'FechasRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, FechasRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.fechaPlanificacion;
    if (value != null) {
      result
        ..add('FechaPlanificacion')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.fechaplanificacion;
    if (value != null) {
      result
        ..add('Fechaplanificacion')
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
  FechasRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FechasRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'FechaPlanificacion':
          result.fechaPlanificacion = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'Fechaplanificacion':
          result.fechaplanificacion = serializers.deserialize(value,
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

class _$FechasRecord extends FechasRecord {
  @override
  final DateTime? fechaPlanificacion;
  @override
  final DateTime? fechaplanificacion;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$FechasRecord([void Function(FechasRecordBuilder)? updates]) =>
      (new FechasRecordBuilder()..update(updates))._build();

  _$FechasRecord._(
      {this.fechaPlanificacion, this.fechaplanificacion, this.ffRef})
      : super._();

  @override
  FechasRecord rebuild(void Function(FechasRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FechasRecordBuilder toBuilder() => new FechasRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FechasRecord &&
        fechaPlanificacion == other.fechaPlanificacion &&
        fechaplanificacion == other.fechaplanificacion &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, fechaPlanificacion.hashCode), fechaplanificacion.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FechasRecord')
          ..add('fechaPlanificacion', fechaPlanificacion)
          ..add('fechaplanificacion', fechaplanificacion)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class FechasRecordBuilder
    implements Builder<FechasRecord, FechasRecordBuilder> {
  _$FechasRecord? _$v;

  DateTime? _fechaPlanificacion;
  DateTime? get fechaPlanificacion => _$this._fechaPlanificacion;
  set fechaPlanificacion(DateTime? fechaPlanificacion) =>
      _$this._fechaPlanificacion = fechaPlanificacion;

  DateTime? _fechaplanificacion;
  DateTime? get fechaplanificacion => _$this._fechaplanificacion;
  set fechaplanificacion(DateTime? fechaplanificacion) =>
      _$this._fechaplanificacion = fechaplanificacion;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  FechasRecordBuilder() {
    FechasRecord._initializeBuilder(this);
  }

  FechasRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _fechaPlanificacion = $v.fechaPlanificacion;
      _fechaplanificacion = $v.fechaplanificacion;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FechasRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FechasRecord;
  }

  @override
  void update(void Function(FechasRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FechasRecord build() => _build();

  _$FechasRecord _build() {
    final _$result = _$v ??
        new _$FechasRecord._(
            fechaPlanificacion: fechaPlanificacion,
            fechaplanificacion: fechaplanificacion,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
