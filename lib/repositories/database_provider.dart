import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:parenteach/models/users.dart';

class DatabaseProvider {
  late FirebaseFirestore firestore;

  //Inisialisasi Firebase instance
  Future<FirebaseApp> initializeFirebase() async {
    FirebaseApp? firebaseApp;
    await Firebase.initializeApp().then((value) => firebaseApp = value);
    return firebaseApp!;
  }

  Future<Users?> validateUser(String username) async {
    Users? user;
    try {
      firestore = FirebaseFirestore.instance;
      late List<QueryDocumentSnapshot> dataUser;
      await firestore
          .collection('users')
          .where('username', isEqualTo: username)
          .get()
          .then((value) => dataUser = value.docs);
      if (dataUser.length == 1) {
        user = Users.fromMap(dataUser[0].data() as Map<String, dynamic>);
      }
    } catch (e) {
      print(e);
    }
    return user;
  }
}
