import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import '../models/guru.dart';
import '../models/qna.dart';
import '../models/reminding.dart';
import '../models/siswa.dart';
import '../models/users.dart';

class DatabaseProvider {
  late FirebaseFirestore firestore;
  String sekolah = 'sekolahA';

  CollectionReference mainCollection() {
    firestore = FirebaseFirestore.instance;
    CollectionReference collection = firestore.collection(sekolah);
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
      late List<QueryDocumentSnapshot> dataUser;
      await mainCollection()
          .doc('users')
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

  Future<String> addUser(Users data) async {
    String userId = "";
    try {
      CollectionReference collection =
          mainCollection().doc('users').collection('users');
      var querySnapshot = await collection.get();
      if (querySnapshot.size == 0) {
        data.idUsers = '100000001';
      } else {
        int lastId = searchLastId(querySnapshot)!;
        data.idUsers = (lastId + 1).toString();
      }
      userId = data.idUsers!;
      await collection.doc(data.idUsers).set(data.toMap());
    } catch (e) {
      userId = "";
      print(e);
    }
    return userId;
  }

  Future<bool> updateUser(Users data) async {
    bool isSuccess = false;
    try {
      CollectionReference collection =
          mainCollection().doc('users').collection('users');
      await collection.doc(data.idUsers).set(data.toMap());
      isSuccess = true;
    } catch (e) {
      isSuccess = false;
      print(e);
    }
    return isSuccess;
  }

  Future<bool> deleteUser(String idUser) async {
    bool isSuccess = false;
    try {
      CollectionReference collection =
          mainCollection().doc('users').collection('users');
      await collection.doc(idUser).delete();
      isSuccess = true;
    } catch (e) {
      isSuccess = false;
      print(e);
    }
    return isSuccess;
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

  Future<bool> addReminding(Reminding data) async {
    bool isSuccess = false;
    try {
      CollectionReference collection =
          mainCollection().doc('reminding').collection('reminding');
      var querySnapshot = await collection.get();
      if (querySnapshot.size == 0) {
        data.idReminding = '500000001';
      } else {
        int lastId = searchLastId(querySnapshot)!;
        data.idReminding = (lastId + 1).toString();
      }
      isSuccess = true;
      await collection.doc(data.idReminding).set(data.toMap());
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

  Future<List<Qna>> getListQna() async {
    List<Qna> temp = [];
    try {
      CollectionReference collection =
          mainCollection().doc('qna').collection('qna');
      var querySnapshot = await collection.get();
      for (int i = 0; i <= querySnapshot.docs.length - 1; i++) {
        temp.add(
            Qna.fromMap(querySnapshot.docs[i].data() as Map<String, dynamic>));
      }
    } catch (e) {
      print(e);
    }
    return temp;
  }

  Future<List<Reminding>> getListReminding() async {
    List<Reminding> temp = [];
    try {
      CollectionReference collection =
          mainCollection().doc('reminding').collection('reminding');
      var querySnapshot = await collection.get();
      for (int i = 0; i <= querySnapshot.docs.length - 1; i++) {
        temp.add(Reminding.fromMap(
            querySnapshot.docs[i].data() as Map<String, dynamic>));
      }
    } catch (e) {
      print(e);
    }
    return temp;
  }

  Future<bool> updateQna(Qna data) async {
    bool isSuccess = false;
    try {
      CollectionReference collection =
          mainCollection().doc('qna').collection('qna');
      await collection.doc(data.idQna).set(data.toMap());
      isSuccess = true;
    } catch (e) {
      isSuccess = false;
      print(e);
    }
    return isSuccess;
  }

  Future<bool> updateReminding(Reminding data) async {
    bool isSuccess = false;
    try {
      CollectionReference collection =
          mainCollection().doc('reminding').collection('reminding');
      await collection.doc(data.idReminding).set(data.toMap());
      isSuccess = true;
    } catch (e) {
      isSuccess = false;
      print(e);
    }
    return isSuccess;
  }

  Future<bool> deleteQna(String idQna) async {
    bool isSuccess = false;
    try {
      CollectionReference collection =
          mainCollection().doc('qna').collection('qna');
      await collection.doc(idQna).delete();
      isSuccess = true;
    } catch (e) {
      isSuccess = false;
      print(e);
    }
    return isSuccess;
  }

  Future<bool> deleteReminding(String idReminding) async {
    bool isSuccess = false;
    try {
      CollectionReference collection =
          mainCollection().doc('reminding').collection('reminding');
      await collection.doc(idReminding).delete();
      isSuccess = true;
    } catch (e) {
      isSuccess = false;
      print(e);
    }
    return isSuccess;
  }

  Future<String> uploadImage(
    File image,
    String filename,
    String folderName,
  ) async {
    String downloadUrl = "";
    try {
      if (image.existsSync()) {
        var task = await firebase_storage.FirebaseStorage.instance
            .ref(sekolah + "/" + folderName)
            .child(filename)
            .putFile(image);
        downloadUrl = await task.ref.getDownloadURL();
      }
    } catch (e) {
      print(e);
    }
    return downloadUrl;
  }

  Future<bool> addSiswa(Siswa data) async {
    bool isSuccess = false;
    try {
      CollectionReference collection =
          mainCollection().doc('siswa').collection('siswa');
      await collection.doc(data.nis).set(data.toMap());
      isSuccess = true;
    } catch (e) {
      isSuccess = false;
      print(e);
    }
    return isSuccess;
  }

  Future<List<Siswa>> getSiswaList() async {
    List<Siswa> siswas = [];
    try {
      CollectionReference collection =
          mainCollection().doc('siswa').collection('siswa');
      var querySnapshot = await collection.get();
      for (int i = 0; i <= querySnapshot.docs.length - 1; i++) {
        siswas.add(
          Siswa.fromMap(querySnapshot.docs[i].data() as Map<String, dynamic>),
        );
      }
    } catch (e) {
      print(e);
    }
    return siswas;
  }

  Future<bool> deleteSiswa(String nis, String imageUrl) async {
    bool isSuccess = false;
    try {
      CollectionReference collection =
          mainCollection().doc('siswa').collection('siswa');
      if (imageUrl != '') {
        await firebase_storage.FirebaseStorage.instance
            .refFromURL(imageUrl)
            .delete();
      }
      await collection.doc(nis).delete();
      isSuccess = true;
    } catch (e) {
      isSuccess = false;
      print(e);
    }
    return isSuccess;
  }

  Future<List<Guru>> getGuruList() async {
    List<Guru> temp = [];
    try {
      CollectionReference collection =
          mainCollection().doc('guru').collection('guru');
      var querySnapshot = await collection.get();
      for (int i = 0; i <= querySnapshot.docs.length - 1; i++) {
        temp.add(
            Guru.fromMap(querySnapshot.docs[i].data() as Map<String, dynamic>));
      }
    } catch (e) {
      print(e);
    }
    return temp;
  }

  Future<bool> addGuru(Guru data) async {
    bool isSuccess = false;
    try {
      CollectionReference collection =
          mainCollection().doc('guru').collection('guru');
      await collection.doc(data.nip).set(data.toMap());
      isSuccess = true;
    } catch (e) {
      isSuccess = false;
      print(e);
    }
    return isSuccess;
  }

  Future<bool> deleteGuru(String idUser, String imageUrl) async {
    bool isSuccess = false;
    try {
      CollectionReference collection =
          mainCollection().doc('guru').collection('guru');
      await collection.doc(idUser).delete();
      await deleteUser(idUser);
      if (imageUrl != '') {
        await firebase_storage.FirebaseStorage.instance
            .refFromURL(imageUrl)
            .delete();
      }
      isSuccess = true;
    } catch (e) {
      isSuccess = false;
      print(e);
    }
    return isSuccess;
  }
}
