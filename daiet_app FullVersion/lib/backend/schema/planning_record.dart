import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'planning_record.g.dart';

abstract class PlanningRecord
    implements Built<PlanningRecord, PlanningRecordBuilder> {
  static Serializer<PlanningRecord> get serializer =>
      _$planningRecordSerializer;

  String? get meal1;

  String? get meal2;

  String? get meal3;

  String? get meal4;

  String? get meal5;

  @BuiltValueField(wireName: 'FechaPlanificacion')
  DateTime? get fechaPlanificacion;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(PlanningRecordBuilder builder) => builder
    ..meal1 = ''
    ..meal2 = ''
    ..meal3 = ''
    ..meal4 = ''
    ..meal5 = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('planning');

  static Stream<PlanningRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<PlanningRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  PlanningRecord._();
  factory PlanningRecord([void Function(PlanningRecordBuilder) updates]) =
      _$PlanningRecord;

  static PlanningRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createPlanningRecordData({
  String? meal1,
  String? meal2,
  String? meal3,
  String? meal4,
  String? meal5,
  DateTime? fechaPlanificacion,
}) {
  final firestoreData = serializers.toFirestore(
    PlanningRecord.serializer,
    PlanningRecord(
      (p) => p
        ..meal1 = meal1
        ..meal2 = meal2
        ..meal3 = meal3
        ..meal4 = meal4
        ..meal5 = meal5
        ..fechaPlanificacion = fechaPlanificacion,
    ),
  );

  return firestoreData;
}
