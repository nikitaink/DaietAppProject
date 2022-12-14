// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lunes_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<LunesRecord> _$lunesRecordSerializer = new _$LunesRecordSerializer();

class _$LunesRecordSerializer implements StructuredSerializer<LunesRecord> {
  @override
  final Iterable<Type> types = const [LunesRecord, _$LunesRecord];
  @override
  final String wireName = 'LunesRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, LunesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.desayuno;
    if (value != null) {
      result
        ..add('Desayuno')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.mediodia;
    if (value != null) {
      result
        ..add('Mediodia')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.comida;
    if (value != null) {
      result
        ..add('Comida')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.merienda;
    if (value != null) {
      result
        ..add('Merienda')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.cena;
    if (value != null) {
      result
        ..add('Cena')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.postreC;
    if (value != null) {
      result
        ..add('postreC')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.postreCe;
    if (value != null) {
      result
        ..add('postreCe')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.bebidaDes;
    if (value != null) {
      result
        ..add('bebidaDes')
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
  LunesRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LunesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'Desayuno':
          result.desayuno = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Mediodia':
          result.mediodia = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Comida':
          result.comida = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Merienda':
          result.merienda = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Cena':
          result.cena = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'postreC':
          result.postreC = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'postreCe':
          result.postreCe = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'bebidaDes':
          result.bebidaDes = serializers.deserialize(value,
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

class _$LunesRecord extends LunesRecord {
  @override
  final String? desayuno;
  @override
  final String? mediodia;
  @override
  final String? comida;
  @override
  final String? merienda;
  @override
  final String? cena;
  @override
  final String? postreC;
  @override
  final String? postreCe;
  @override
  final String? bebidaDes;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$LunesRecord([void Function(LunesRecordBuilder)? updates]) =>
      (new LunesRecordBuilder()..update(updates))._build();

  _$LunesRecord._(
      {this.desayuno,
      this.mediodia,
      this.comida,
      this.merienda,
      this.cena,
      this.postreC,
      this.postreCe,
      this.bebidaDes,
      this.ffRef})
      : super._();

  @override
  LunesRecord rebuild(void Function(LunesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LunesRecordBuilder toBuilder() => new LunesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LunesRecord &&
        desayuno == other.desayuno &&
        mediodia == other.mediodia &&
        comida == other.comida &&
        merienda == other.merienda &&
        cena == other.cena &&
        postreC == other.postreC &&
        postreCe == other.postreCe &&
        bebidaDes == other.bebidaDes &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc($jc(0, desayuno.hashCode),
                                    mediodia.hashCode),
                                comida.hashCode),
                            merienda.hashCode),
                        cena.hashCode),
                    postreC.hashCode),
                postreCe.hashCode),
            bebidaDes.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'LunesRecord')
          ..add('desayuno', desayuno)
          ..add('mediodia', mediodia)
          ..add('comida', comida)
          ..add('merienda', merienda)
          ..add('cena', cena)
          ..add('postreC', postreC)
          ..add('postreCe', postreCe)
          ..add('bebidaDes', bebidaDes)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class LunesRecordBuilder implements Builder<LunesRecord, LunesRecordBuilder> {
  _$LunesRecord? _$v;

  String? _desayuno;
  String? get desayuno => _$this._desayuno;
  set desayuno(String? desayuno) => _$this._desayuno = desayuno;

  String? _mediodia;
  String? get mediodia => _$this._mediodia;
  set mediodia(String? mediodia) => _$this._mediodia = mediodia;

  String? _comida;
  String? get comida => _$this._comida;
  set comida(String? comida) => _$this._comida = comida;

  String? _merienda;
  String? get merienda => _$this._merienda;
  set merienda(String? merienda) => _$this._merienda = merienda;

  String? _cena;
  String? get cena => _$this._cena;
  set cena(String? cena) => _$this._cena = cena;

  String? _postreC;
  String? get postreC => _$this._postreC;
  set postreC(String? postreC) => _$this._postreC = postreC;

  String? _postreCe;
  String? get postreCe => _$this._postreCe;
  set postreCe(String? postreCe) => _$this._postreCe = postreCe;

  String? _bebidaDes;
  String? get bebidaDes => _$this._bebidaDes;
  set bebidaDes(String? bebidaDes) => _$this._bebidaDes = bebidaDes;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  LunesRecordBuilder() {
    LunesRecord._initializeBuilder(this);
  }

  LunesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _desayuno = $v.desayuno;
      _mediodia = $v.mediodia;
      _comida = $v.comida;
      _merienda = $v.merienda;
      _cena = $v.cena;
      _postreC = $v.postreC;
      _postreCe = $v.postreCe;
      _bebidaDes = $v.bebidaDes;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LunesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LunesRecord;
  }

  @override
  void update(void Function(LunesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  LunesRecord build() => _build();

  _$LunesRecord _build() {
    final _$result = _$v ??
        new _$LunesRecord._(
            desayuno: desayuno,
            mediodia: mediodia,
            comida: comida,
            merienda: merienda,
            cena: cena,
            postreC: postreC,
            postreCe: postreCe,
            bebidaDes: bebidaDes,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
