import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'miercoles_record.g.dart';

abstract class MiercolesRecord
    implements Built<MiercolesRecord, MiercolesRecordBuilder> {
  static Serializer<MiercolesRecord> get serializer =>
      _$miercolesRecordSerializer;

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

  static void _initializeBuilder(MiercolesRecordBuilder builder) => builder
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
          ? parent.collection('Miercoles')
          : FirebaseFirestore.instance.collectionGroup('Miercoles');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('Miercoles').doc();

  static Stream<MiercolesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<MiercolesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  MiercolesRecord._();
  factory MiercolesRecord([void Function(MiercolesRecordBuilder) updates]) =
      _$MiercolesRecord;

  static MiercolesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createMiercolesRecordData({
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
    MiercolesRecord.serializer,
    MiercolesRecord(
      (m) => m
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
