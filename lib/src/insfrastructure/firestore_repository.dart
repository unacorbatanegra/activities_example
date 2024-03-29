import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

typedef FromJson<T> = T Function(Map<String, dynamic> json);

class FirestoreRepository<T> {
  FirebaseFirestore db = FirebaseFirestore.instance;

  final _auth = FirebaseAuth.instance;

  DocumentSnapshot? lastDocument;
  int? lastLength;
  String? lastCollection;

  String? get currentUser => _auth.currentUser?.uid;

  Future<void> put({
    required Map<String, dynamic> data,
    required String collection,
    required String? uuid,
  }) =>
      db.collection(collection).doc(uuid).set(
            data,
            SetOptions(merge: true),
          );

  Future<void> update({
    required Map<String, dynamic> data,
    required String collection,
    required String uuid,
  }) =>
      db.collection(collection).doc(uuid).update(
            data,
          );

  Future<List<T?>> getList<T>(
    FromJson<T> fromJson,
    String collection, {
    int limit = 20,
    required bool startAfterTheLastDocument,
    Object? orderBy,
    bool descendent = false,
  }) async {
    final list = <T?>[];
    if (lastLength != null &&
        lastLength! % limit != 0 &&
        collection == (lastCollection ?? '')) return list;
    final cF = orderBy != null
        ? db
            .collection(collection)
            .limit(limit)
            .orderBy(orderBy, descending: descendent)
        : db.collection(collection).limit(limit);

    final ref = startAfterTheLastDocument && lastDocument != null
        ? await cF.startAfterDocument(lastDocument!).get()
        : await cF.get();

    if (ref.docs.isNotEmpty) {
      list.addAll(ref.docs.map((e) => fromJson(e.data())));
      lastDocument = ref.docs.last;
      lastCollection = collection;
      lastLength = ref.docs.length;
    }
    return list;
  }

  List<T> getFromDocuments<T>(
          FromJson<T> fromJson, List<QueryDocumentSnapshot> documents) =>
      documents.map((e) => fromJson(e.data() as Map<String, dynamic>)).toList();

  CollectionReference getFromCollection(String collection) =>
      db.collection(collection);

  Future<T?> get<T>(
    FromJson<T> fromJson,
    String collection,
    String? uuid,
  ) async {
    final ref = await db.collection(collection).doc(uuid).get();
    return ref.data() != null
        ? fromJson(ref.data() as Map<String, dynamic>)
        : null;
  }

  Future<void> delete({
    required String? uuid,
    required String collection,
  }) =>
      db.collection(collection).doc(uuid).delete();

  void clearPagination() {
    lastDocument = null;
    lastCollection = null;
    lastLength = null;
  }
}
