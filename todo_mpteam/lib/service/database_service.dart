
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_mpteam/service/user_model.dart';

const String USER_COLLECTION_REF = 'Users';

class DataBaseService {
  final _firestore = FirebaseFirestore.instance;

  late final CollectionReference _UsersRef;

  DataBaseService() {
    _UsersRef = _firestore.collection(USER_COLLECTION_REF).withConverter<UserModel>(
        fromFirestore: (snapShots, _) => UserModel.fromJson(
              snapShots.data()!,
            ),
        toFirestore: (UserModel, _) => UserModel.toJson());
  }
}
 