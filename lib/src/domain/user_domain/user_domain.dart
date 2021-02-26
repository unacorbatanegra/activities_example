import '../domain.dart';

class UserDomain extends Domain<User> {
  Future<User> get(String key) async {
    final user = await repository.get(
      (_) => User.fromJson(_),
      Collections.users,
      key,
    );
    if (user.uid == currentUserUid) {
      hiveRepository.put('user', 'currentUser', user);
    }
    return user;
  }

  Future<bool> checkExistUser(String uuid) async {
    final collection = repository.getFromCollection(Collections.users);
    final doc = await collection.doc(uuid).get();
    return doc.exists;
  }

  User get currentUser => hiveRepository.get('user', 'currentUser');

  Future<void> put(User user) async {
    return await repository.put(
      data: user.toJson(),
      collection: Collections.users,
      uuid: user.uid,
    );
  }

  Future<void> update(
    String uid,
    Map<String, dynamic> data,
  ) =>
      repository.update(
        data: data,
        collection: Collections.users,
        uuid: uid,
      );
}
