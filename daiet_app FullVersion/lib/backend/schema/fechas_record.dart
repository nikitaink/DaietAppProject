import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'fechas_record.g.dart';

abstract class FechasRecord
    implements Built<FechasRecord, FechasRecordBuilder> {
  static Serializer<FechasRecord> get serializer => _$fechasRecordSerializer;

  @BuiltValueField(wireName: 'FechaPlanificacion')
  DateTime? get fechaPlanificacion;

  @BuiltValueField(wireName: 'Fechaplanificacion')
  DateTime? get fechaplanificacion;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(FechasRecordBuilder builder) => builder;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('fechas');

  static Stream<FechasRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<FechasRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  FechasRecord._();
  factory FechasRecord([void Function(FechasRecordBuilder) updates]) =
      _$FechasRecord;

  static FechasRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createFechasRecordData({
  DateTime? fechaPlanificacion,
  DateTime? fechaplanificacion,
}) {
  final firestoreData = serializers.toFirestore(
    FechasRecord.serializer,
    FechasRecord(
      (f) => f
        ..fechaPlanificacion = fechaPlanificacion
        ..fechaplanificacion = fechaplanificacion,
    ),
  );

  return firestoreData;
}
