// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'interview_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<InterviewRecord> _$interviewRecordSerializer =
    new _$InterviewRecordSerializer();

class _$InterviewRecordSerializer
    implements StructuredSerializer<InterviewRecord> {
  @override
  final Iterable<Type> types = const [InterviewRecord, _$InterviewRecord];
  @override
  final String wireName = 'InterviewRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, InterviewRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.objetivo;
    if (value != null) {
      result
        ..add('objetivo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.peso;
    if (value != null) {
      result
        ..add('peso')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.altura;
    if (value != null) {
      result
        ..add('altura')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.cintura;
    if (value != null) {
      result
        ..add('cintura')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.cadera;
    if (value != null) {
      result
        ..add('cadera')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.cuello;
    if (value != null) {
      result
        ..add('cuello')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.patologia;
    if (value != null) {
      result
        ..add('patologia')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.otrasPatologias;
    if (value != null) {
      result
        ..add('otrasPatologias')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.alergias;
    if (value != null) {
      result
        ..add('alergias')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.medicacion;
    if (value != null) {
      result
        ..add('medicacion')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.estadoFisiologico;
    if (value != null) {
      result
        ..add('estadoFisiologico')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.deporte;
    if (value != null) {
      result
        ..add('deporte')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.actividadFisica;
    if (value != null) {
      result
        ..add('actividadFisica')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.otrosDatos;
    if (value != null) {
      result
        ..add('otrosDatos')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.interviewPerson;
    if (value != null) {
      result
        ..add('interviewPerson')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
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
  InterviewRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new InterviewRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'objetivo':
          result.objetivo = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'peso':
          result.peso = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'altura':
          result.altura = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'cintura':
          result.cintura = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'cadera':
          result.cadera = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'cuello':
          result.cuello = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'patologia':
          result.patologia = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'otrasPatologias':
          result.otrasPatologias = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'alergias':
          result.alergias = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'medicacion':
          result.medicacion = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'estadoFisiologico':
          result.estadoFisiologico = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'deporte':
          result.deporte = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'actividadFisica':
          result.actividadFisica = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'otrosDatos':
          result.otrosDatos = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'interviewPerson':
          result.interviewPerson = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
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

class _$InterviewRecord extends InterviewRecord {
  @override
  final String? objetivo;
  @override
  final int? peso;
  @override
  final int? altura;
  @override
  final int? cintura;
  @override
  final int? cadera;
  @override
  final int? cuello;
  @override
  final String? patologia;
  @override
  final String? otrasPatologias;
  @override
  final String? alergias;
  @override
  final String? medicacion;
  @override
  final String? estadoFisiologico;
  @override
  final String? deporte;
  @override
  final String? actividadFisica;
  @override
  final String? otrosDatos;
  @override
  final DocumentReference<Object?>? interviewPerson;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$InterviewRecord([void Function(InterviewRecordBuilder)? updates]) =>
      (new InterviewRecordBuilder()..update(updates))._build();

  _$InterviewRecord._(
      {this.objetivo,
      this.peso,
      this.altura,
      this.cintura,
      this.cadera,
      this.cuello,
      this.patologia,
      this.otrasPatologias,
      this.alergias,
      this.medicacion,
      this.estadoFisiologico,
      this.deporte,
      this.actividadFisica,
      this.otrosDatos,
      this.interviewPerson,
      this.ffRef})
      : super._();

  @override
  InterviewRecord rebuild(void Function(InterviewRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InterviewRecordBuilder toBuilder() =>
      new InterviewRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InterviewRecord &&
        objetivo == other.objetivo &&
        peso == other.peso &&
        altura == other.altura &&
        cintura == other.cintura &&
        cadera == other.cadera &&
        cuello == other.cuello &&
        patologia == other.patologia &&
        otrasPatologias == other.otrasPatologias &&
        alergias == other.alergias &&
        medicacion == other.medicacion &&
        estadoFisiologico == other.estadoFisiologico &&
        deporte == other.deporte &&
        actividadFisica == other.actividadFisica &&
        otrosDatos == other.otrosDatos &&
        interviewPerson == other.interviewPerson &&
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
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    0,
                                                                    objetivo
                                                                        .hashCode),
                                                                peso.hashCode),
                                                            altura.hashCode),
                                                        cintura.hashCode),
                                                    cadera.hashCode),
                                                cuello.hashCode),
                                            patologia.hashCode),
                                        otrasPatologias.hashCode),
                                    alergias.hashCode),
                                medicacion.hashCode),
                            estadoFisiologico.hashCode),
                        deporte.hashCode),
                    actividadFisica.hashCode),
                otrosDatos.hashCode),
            interviewPerson.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'InterviewRecord')
          ..add('objetivo', objetivo)
          ..add('peso', peso)
          ..add('altura', altura)
          ..add('cintura', cintura)
          ..add('cadera', cadera)
          ..add('cuello', cuello)
          ..add('patologia', patologia)
          ..add('otrasPatologias', otrasPatologias)
          ..add('alergias', alergias)
          ..add('medicacion', medicacion)
          ..add('estadoFisiologico', estadoFisiologico)
          ..add('deporte', deporte)
          ..add('actividadFisica', actividadFisica)
          ..add('otrosDatos', otrosDatos)
          ..add('interviewPerson', interviewPerson)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class InterviewRecordBuilder
    implements Builder<InterviewRecord, InterviewRecordBuilder> {
  _$InterviewRecord? _$v;

  String? _objetivo;
  String? get objetivo => _$this._objetivo;
  set objetivo(String? objetivo) => _$this._objetivo = objetivo;

  int? _peso;
  int? get peso => _$this._peso;
  set peso(int? peso) => _$this._peso = peso;

  int? _altura;
  int? get altura => _$this._altura;
  set altura(int? altura) => _$this._altura = altura;

  int? _cintura;
  int? get cintura => _$this._cintura;
  set cintura(int? cintura) => _$this._cintura = cintura;

  int? _cadera;
  int? get cadera => _$this._cadera;
  set cadera(int? cadera) => _$this._cadera = cadera;

  int? _cuello;
  int? get cuello => _$this._cuello;
  set cuello(int? cuello) => _$this._cuello = cuello;

  String? _patologia;
  String? get patologia => _$this._patologia;
  set patologia(String? patologia) => _$this._patologia = patologia;

  String? _otrasPatologias;
  String? get otrasPatologias => _$this._otrasPatologias;
  set otrasPatologias(String? otrasPatologias) =>
      _$this._otrasPatologias = otrasPatologias;

  String? _alergias;
  String? get alergias => _$this._alergias;
  set alergias(String? alergias) => _$this._alergias = alergias;

  String? _medicacion;
  String? get medicacion => _$this._medicacion;
  set medicacion(String? medicacion) => _$this._medicacion = medicacion;

  String? _estadoFisiologico;
  String? get estadoFisiologico => _$this._estadoFisiologico;
  set estadoFisiologico(String? estadoFisiologico) =>
      _$this._estadoFisiologico = estadoFisiologico;

  String? _deporte;
  String? get deporte => _$this._deporte;
  set deporte(String? deporte) => _$this._deporte = deporte;

  String? _actividadFisica;
  String? get actividadFisica => _$this._actividadFisica;
  set actividadFisica(String? actividadFisica) =>
      _$this._actividadFisica = actividadFisica;

  String? _otrosDatos;
  String? get otrosDatos => _$this._otrosDatos;
  set otrosDatos(String? otrosDatos) => _$this._otrosDatos = otrosDatos;

  DocumentReference<Object?>? _interviewPerson;
  DocumentReference<Object?>? get interviewPerson => _$this._interviewPerson;
  set interviewPerson(DocumentReference<Object?>? interviewPerson) =>
      _$this._interviewPerson = interviewPerson;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  InterviewRecordBuilder() {
    InterviewRecord._initializeBuilder(this);
  }

  InterviewRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _objetivo = $v.objetivo;
      _peso = $v.peso;
      _altura = $v.altura;
      _cintura = $v.cintura;
      _cadera = $v.cadera;
      _cuello = $v.cuello;
      _patologia = $v.patologia;
      _otrasPatologias = $v.otrasPatologias;
      _alergias = $v.alergias;
      _medicacion = $v.medicacion;
      _estadoFisiologico = $v.estadoFisiologico;
      _deporte = $v.deporte;
      _actividadFisica = $v.actividadFisica;
      _otrosDatos = $v.otrosDatos;
      _interviewPerson = $v.interviewPerson;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(InterviewRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$InterviewRecord;
  }

  @override
  void update(void Function(InterviewRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  InterviewRecord build() => _build();

  _$InterviewRecord _build() {
    final _$result = _$v ??
        new _$InterviewRecord._(
            objetivo: objetivo,
            peso: peso,
            altura: altura,
            cintura: cintura,
            cadera: cadera,
            cuello: cuello,
            patologia: patologia,
            otrasPatologias: otrasPatologias,
            alergias: alergias,
            medicacion: medicacion,
            estadoFisiologico: estadoFisiologico,
            deporte: deporte,
            actividadFisica: actividadFisica,
            otrosDatos: otrosDatos,
            interviewPerson: interviewPerson,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
