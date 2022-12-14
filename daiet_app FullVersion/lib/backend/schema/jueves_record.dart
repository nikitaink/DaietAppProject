import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'jueves_record.g.dart';

abstract class JuevesRecord
    implements Built<JuevesRecord, JuevesRecordBuilder> {
  static Serializer<JuevesRecord> get serializer => _$juevesRecordSerializer;

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

  static void _initializeBuilder(JuevesRecordBuilder builder) => builder
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
          ? parent.collection('Jueves')
          : FirebaseFirestore.instance.collectionGroup('Jueves');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('Jueves').doc();

  static Stream<JuevesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<JuevesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  JuevesRecord._();
  factory JuevesRecord([void Function(JuevesRecordBuilder) updates]) =
      _$JuevesRecord;

  static JuevesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createJuevesRecordData({
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
    JuevesRecord.serializer,
    JuevesRecord(
      (j) => j
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
