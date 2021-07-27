import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:parenteach/models/qna.dart';
import 'package:parenteach/models/users.dart';

class DatabaseProvider {
  late FirebaseFirestore firestore;

  CollectionReference mainCollection() {
    firestore = FirebaseFirestore.instance;
    CollectionReference collection = firestore.collection('sekolahA');
    return collection;
  }

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

  Future<bool> addQna(Qna data) async {
    bool isSuccess = false;
    try {
      CollectionReference collection =
          mainCollection().doc('qna').collection('qna');
      var querySnapshot = await collection.get();
      if (querySnapshot.size == 0) {
        data.idQna = '500000001';
      } else {
        int lastId = searchLastId(querySnapshot)!;
        data.idQna = (lastId + 1).toString();
      }
      isSuccess = true;
      await collection.doc(data.idQna).set(data.toMap());
    } catch (e) {
      isSuccess = false;
      print(e);
    }
    return isSuccess;
  }

  int? searchLastId(QuerySnapshot querySnapshot) {
    int? id;
    var data = querySnapshot.docs.last.id;
    id = int.tryParse(data);
    return id;
  }
}
