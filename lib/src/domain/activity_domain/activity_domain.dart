import 'package:cloud_firestore/cloud_firestore.dart';

import '../domain.dart';
import '../domains.dart';

class ActivityDomain extends Domain<Activity> {
  DocumentSnapshot? lastDocument;
  int? lastLength;

  UserDomain userDomain = UserDomain();

  Future<List<Activity?>> getList({
    bool startAfterTheLastDocument = false,
  }) =>
      repository.getList(
         Activity.fromJson,
        Collections.activities,
        startAfterTheLastDocument: startAfterTheLastDocument,
      );

  Future<List<Activity>> getListQuery({
    int limit = 20,
    bool startAfterTheLastDocument = false,
    String? name,
  }) async {
    var list = <Activity>[];
    if (lastLength != null && lastLength! % limit != 0) return list;
    final collection = repository.getFromCollection(Collections.activities);
    var ref = collection.limit(limit);
    if (name != null && name.isNotEmpty) {
      name = name.toLowerCase();
      ref = ref
          .where(
            'searchName',
            isGreaterThanOrEqualTo: name,
          )
          .where(
            'searchName',
            // ignore: prefer_interpolation_to_compose_strings
            isLessThanOrEqualTo: name + '\uf8ff',
          );
    }

    final documents = startAfterTheLastDocument && lastDocument != null
        ? await ref.startAfterDocument(lastDocument!).get()
        : await ref.get();
    if (documents.docs.isNotEmpty) {
      lastDocument = documents.docs.last;
      lastLength = documents.docs.length;
      list = repository.getFromDocuments(
         Activity.fromJson,
        documents.docs,
      );
    }
    print(documents.docs.length);
    return list;
  }

  Future<List<Activity>> getListOrg({
    int limit = 20,
    bool startAfterTheLastDocument = false,
    String? name,
  }) async {
    var list = <Activity>[];
    if (lastLength != null && lastLength! % limit != 0) return list;
    final collection = repository.getFromCollection(Collections.activities);

    var ref = collection.limit(limit).where(
          'organization.uid',
          isEqualTo: repository.currentUser,
        );

    if (name != null && name.isNotEmpty) {
      name = name.toLowerCase();
      ref = ref
          .where(
            'searchName',
            isGreaterThanOrEqualTo: name,
          )
          .where(
            'searchName',
            // ignore: prefer_interpolation_to_compose_strings
            isLessThanOrEqualTo: name + '\uf8ff',
          );
    }

    final documents = startAfterTheLastDocument && lastDocument != null
        ? await ref.startAfterDocument(lastDocument!).get()
        : await ref.get();

    if (documents.docs.isNotEmpty) {
      lastDocument = documents.docs.last;
      lastLength = documents.docs.length;
      list = repository.getFromDocuments(
        Activity.fromJson,
        documents.docs,
      );
    }
    print(documents.docs.length);
    return list;
  }

  Future<void> put(Activity activity) async {
    activity.uuid ??= uidV1;
    activity.organization ??= userDomain.currentUser;
    return repository.put(
      data: activity.toJson(),
      collection: Collections.activities,
      uuid: activity.uuid,
    );
  }

  Future<void> delete(String? uuid) => repository.delete(
        uuid: uuid,
        collection: Collections.activities,
      );

  @override
  void clearPagination() {
    lastDocument = null;
    lastLength = null;
    super.clearPagination();
  }
}
