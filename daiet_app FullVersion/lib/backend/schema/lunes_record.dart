import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'lunes_record.g.dart';

abstract class LunesRecord implements Built<LunesRecord, LunesRecordBuilder> {
  static Serializer<LunesRecord> get serializer => _$lunesRecordSerializer;

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

  static void _initializeBuilder(LunesRecordBuilder builder) => builder
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
          ? parent.collection('Lunes')
          : FirebaseFirestore.instance.collectionGroup('Lunes');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('Lunes').doc();

  static Stream<LunesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<LunesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  LunesRecord._();
  factory LunesRecord([void Function(LunesRecordBuilder) updates]) =
      _$LunesRecord;

  static LunesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createLunesRecordData({
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
    LunesRecord.serializer,
    LunesRecord(
      (l) => l
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
