import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'dias_semana_record.g.dart';

abstract class DiasSemanaRecord
    implements Built<DiasSemanaRecord, DiasSemanaRecordBuilder> {
  static Serializer<DiasSemanaRecord> get serializer =>
      _$diasSemanaRecordSerializer;

  @BuiltValueField(wireName: 'Lunes')
  String? get lunes;

  @BuiltValueField(wireName: 'Martes')
  String? get martes;

  @BuiltValueField(wireName: 'Miercoles')
  String? get miercoles;

  @BuiltValueField(wireName: 'Jueves')
  String? get jueves;

  @BuiltValueField(wireName: 'Viernes')
  String? get viernes;

  @BuiltValueField(wireName: 'Sabado')
  String? get sabado;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(DiasSemanaRecordBuilder builder) => builder
    ..lunes = ''
    ..martes = ''
    ..miercoles = ''
    ..jueves = ''
    ..viernes = ''
    ..sabado = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('diasSemana')
          : FirebaseFirestore.instance.collectionGroup('diasSemana');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('diasSemana').doc();

  static Stream<DiasSemanaRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<DiasSemanaRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  DiasSemanaRecord._();
  factory DiasSemanaRecord([void Function(DiasSemanaRecordBuilder) updates]) =
      _$DiasSemanaRecord;

  static DiasSemanaRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createDiasSemanaRecordData({
  String? lunes,
  String? martes,
  String? miercoles,
  String? jueves,
  String? viernes,
  String? sabado,
}) {
  final firestoreData = serializers.toFirestore(
    DiasSemanaRecord.serializer,
    DiasSemanaRecord(
      (d) => d
        ..lunes = lunes
        ..martes = martes
        ..miercoles = miercoles
        ..jueves = jueves
        ..viernes = viernes
        ..sabado = sabado,
    ),
  );

  return firestoreData;
}
