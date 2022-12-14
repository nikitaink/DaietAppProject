// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dias_semana_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DiasSemanaRecord> _$diasSemanaRecordSerializer =
    new _$DiasSemanaRecordSerializer();

class _$DiasSemanaRecordSerializer
    implements StructuredSerializer<DiasSemanaRecord> {
  @override
  final Iterable<Type> types = const [DiasSemanaRecord, _$DiasSemanaRecord];
  @override
  final String wireName = 'DiasSemanaRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, DiasSemanaRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.lunes;
    if (value != null) {
      result
        ..add('Lunes')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.martes;
    if (value != null) {
      result
        ..add('Martes')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.miercoles;
    if (value != null) {
      result
        ..add('Miercoles')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.jueves;
    if (value != null) {
      result
        ..add('Jueves')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.viernes;
    if (value != null) {
      result
        ..add('Viernes')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.sabado;
    if (value != null) {
      result
        ..add('Sabado')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
  DiasSemanaRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DiasSemanaRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'Lunes':
          result.lunes = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Martes':
          result.martes = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Miercoles':
          result.miercoles = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Jueves':
          result.jueves = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Viernes':
          result.viernes = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Sabado':
          result.sabado = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
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

class _$DiasSemanaRecord extends DiasSemanaRecord {
  @override
  final String? lunes;
  @override
  final String? martes;
  @override
  final String? miercoles;
  @override
  final String? jueves;
  @override
  final String? viernes;
  @override
  final String? sabado;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$DiasSemanaRecord(
          [void Function(DiasSemanaRecordBuilder)? updates]) =>
      (new DiasSemanaRecordBuilder()..update(updates))._build();

  _$DiasSemanaRecord._(
      {this.lunes,
      this.martes,
      this.miercoles,
      this.jueves,
      this.viernes,
      this.sabado,
      this.ffRef})
      : super._();

  @override
  DiasSemanaRecord rebuild(void Function(DiasSemanaRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DiasSemanaRecordBuilder toBuilder() =>
      new DiasSemanaRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DiasSemanaRecord &&
        lunes == other.lunes &&
        martes == other.martes &&
        miercoles == other.miercoles &&
        jueves == other.jueves &&
        viernes == other.viernes &&
        sabado == other.sabado &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, lunes.hashCode), martes.hashCode),
                        miercoles.hashCode),
                    jueves.hashCode),
                viernes.hashCode),
            sabado.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DiasSemanaRecord')
          ..add('lunes', lunes)
          ..add('martes', martes)
          ..add('miercoles', miercoles)
          ..add('jueves', jueves)
          ..add('viernes', viernes)
          ..add('sabado', sabado)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class DiasSemanaRecordBuilder
    implements Builder<DiasSemanaRecord, DiasSemanaRecordBuilder> {
  _$DiasSemanaRecord? _$v;

  String? _lunes;
  String? get lunes => _$this._lunes;
  set lunes(String? lunes) => _$this._lunes = lunes;

  String? _martes;
  String? get martes => _$this._martes;
  set martes(String? martes) => _$this._martes = martes;

  String? _miercoles;
  String? get miercoles => _$this._miercoles;
  set miercoles(String? miercoles) => _$this._miercoles = miercoles;

  String? _jueves;
  String? get jueves => _$this._jueves;
  set jueves(String? jueves) => _$this._jueves = jueves;

  String? _viernes;
  String? get viernes => _$this._viernes;
  set viernes(String? viernes) => _$this._viernes = viernes;

  String? _sabado;
  String? get sabado => _$this._sabado;
  set sabado(String? sabado) => _$this._sabado = sabado;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  DiasSemanaRecordBuilder() {
    DiasSemanaRecord._initializeBuilder(this);
  }

  DiasSemanaRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _lunes = $v.lunes;
      _martes = $v.martes;
      _miercoles = $v.miercoles;
      _jueves = $v.jueves;
      _viernes = $v.viernes;
      _sabado = $v.sabado;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DiasSemanaRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DiasSemanaRecord;
  }

  @override
  void update(void Function(DiasSemanaRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DiasSemanaRecord build() => _build();

  _$DiasSemanaRecord _build() {
    final _$result = _$v ??
        new _$DiasSemanaRecord._(
            lunes: lunes,
            martes: martes,
            miercoles: miercoles,
            jueves: jueves,
            viernes: viernes,
            sabado: sabado,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
