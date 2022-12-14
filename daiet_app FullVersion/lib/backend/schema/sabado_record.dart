import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'sabado_record.g.dart';

abstract class SabadoRecord
    implements Built<SabadoRecord, SabadoRecordBuilder> {
  static Serializer<SabadoRecord> get serializer => _$sabadoRecordSerializer;

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

  static void _initializeBuilder(SabadoRecordBuilder builder) => builder
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
          ? parent.collection('Sabado')
          : FirebaseFirestore.instance.collectionGroup('Sabado');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('Sabado').doc();

  static Stream<SabadoRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<SabadoRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  SabadoRecord._();
  factory SabadoRecord([void Function(SabadoRecordBuilder) updates]) =
      _$SabadoRecord;

  static SabadoRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createSabadoRecordData({
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
    SabadoRecord.serializer,
    SabadoRecord(
      (s) => s
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
