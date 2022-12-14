// Al final no usé esta BBDD y creé una nueva "entrevista"
import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'interview_record.g.dart';

abstract class InterviewRecord
    implements Built<InterviewRecord, InterviewRecordBuilder> {
  static Serializer<InterviewRecord> get serializer =>
      _$interviewRecordSerializer;

  String? get objetivo;

  int? get peso;

  int? get altura;

  int? get cintura;

  int? get cadera;

  int? get cuello;

  String? get patologia;

  String? get otrasPatologias;

  String? get alergias;

  String? get medicacion;

  String? get estadoFisiologico;

  String? get deporte;

  String? get actividadFisica;

  String? get otrosDatos;

  DocumentReference? get interviewPerson;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(InterviewRecordBuilder builder) => builder
    ..objetivo = ''
    ..peso = 0
    ..altura = 0
    ..cintura = 0
    ..cadera = 0
    ..cuello = 0
    ..patologia = ''
    ..otrasPatologias = ''
    ..alergias = ''
    ..medicacion = ''
    ..estadoFisiologico = ''
    ..deporte = ''
    ..actividadFisica = ''
    ..otrosDatos = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('interview');

  static Stream<InterviewRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<InterviewRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  InterviewRecord._();
  factory InterviewRecord([void Function(InterviewRecordBuilder) updates]) =
      _$InterviewRecord;

  static InterviewRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createInterviewRecordData({
  String? objetivo,
  int? peso,
  int? altura,
  int? cintura,
  int? cadera,
  int? cuello,
  String? patologia,
  String? otrasPatologias,
  String? alergias,
  String? medicacion,
  String? estadoFisiologico,
  String? deporte,
  String? actividadFisica,
  String? otrosDatos,
  DocumentReference? interviewPerson,
}) {
  final firestoreData = serializers.toFirestore(
    InterviewRecord.serializer,
    InterviewRecord(
      (i) => i
        ..objetivo = objetivo
        ..peso = peso
        ..altura = altura
        ..cintura = cintura
        ..cadera = cadera
        ..cuello = cuello
        ..patologia = patologia
        ..otrasPatologias = otrasPatologias
        ..alergias = alergias
        ..medicacion = medicacion
        ..estadoFisiologico = estadoFisiologico
        ..deporte = deporte
        ..actividadFisica = actividadFisica
        ..otrosDatos = otrosDatos
        ..interviewPerson = interviewPerson,
    ),
  );

  return firestoreData;
}
