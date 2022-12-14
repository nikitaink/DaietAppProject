import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'viernes_record.g.dart';

abstract class ViernesRecord
    implements Built<ViernesRecord, ViernesRecordBuilder> {
  static Serializer<ViernesRecord> get serializer => _$viernesRecordSerializer;

  @BuiltValueField(wireName: 'Desayuno')
  String? get desayuno;

  @BuiltValueField(wireName: 'Mediodia')
  String? get mediodia;

  @BuiltValueField(wireName: 'Comida')
  String? get comida;

  @BuiltValueField(wireName: 'Merienda')
  String? get merienda;

  @BuiltValueField(wireName: 'Cena')
  String? get cena;

  String? get postreC;

  String? get postreCe;

  String? get bebidaDes;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(ViernesRecordBuilder builder) => builder
    ..desayuno = ''
    ..mediodia = ''
    ..comida = ''
    ..merienda = ''
    ..cena = ''
    ..postreC = ''
    ..postreCe = ''
    ..bebidaDes = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Viernes')
          : FirebaseFirestore.instance.collectionGroup('Viernes');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('Viernes').doc();

  static Stream<ViernesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ViernesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ViernesRecord._();
  factory ViernesRecord([void Function(ViernesRecordBuilder) updates]) =
      _$ViernesRecord;

  static ViernesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createViernesRecordData({
  String? desayuno,
  String? mediodia,
  String? comida,
  String? merienda,
  String? cena,
  String? postreC,
  String? postreCe,
  String? bebidaDes,
}) {
  final firestoreData = serializers.toFirestore(
    ViernesRecord.serializer,
    ViernesRecord(
      (v) => v
        ..desayuno = desayuno
        ..mediodia = mediodia
        ..comida = comida
        ..merienda = merienda
        ..cena = cena
        ..postreC = postreC
        ..postreCe = postreCe
        ..bebidaDes = bebidaDes,
    ),
  );

  return firestoreData;
}
