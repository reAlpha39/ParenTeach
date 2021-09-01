import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:parenteach/models/agenda.dart';
import 'package:parenteach/models/kelas.dart';
import 'package:parenteach/models/nilai_raport.dart';
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

  Future<Users> getUser(String id) async {
    Users user = Users();
    try {
      CollectionReference collection =
          mainCollection().doc('users').collection('users');
      var data = await collection.doc(id).get();
      user = Users.fromMap(data.data() as Map<String, dynamic>);
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

  Future<bool> addKelas(Kelas data) async {
    bool isSuccess = false;
    try {
      CollectionReference collection =
          mainCollection().doc('kelas').collection('kelas');
      var querySnapshot = await collection.get();
      if (querySnapshot.size == 0) {
        data.idKelas = '1';
      } else {
        int lastId = searchLastId(querySnapshot)!;
        data.idKelas = (lastId + 1).toString();
      }
      isSuccess = true;
      await collection.doc(data.idKelas).set(data.toMap());
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

  Future<List<Kelas>> getKelas() async {
    List<Kelas> temp = [];
    try {
      CollectionReference collection =
          mainCollection().doc('kelas').collection('kelas');
      var querySnapshot = await collection.get();
      for (int i = 0; i <= querySnapshot.docs.length - 1; i++) {
        temp.add(Kelas.fromMap(
            querySnapshot.docs[i].data() as Map<String, dynamic>));
      }
    } catch (e) {
      print(e);
    }
    return temp;
  }

  Future<bool> updateKelas(Kelas data) async {
    bool isSuccess = false;
    try {
      CollectionReference collection =
          mainCollection().doc('kelas').collection('kelas');
      await collection.doc(data.idKelas).set(data.toMap());
      isSuccess = true;
    } catch (e) {
      isSuccess = false;
      print(e);
    }
    return isSuccess;
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

  Future<bool> deleteKelas(String idKelas) async {
    bool isSuccess = false;
    try {
      CollectionReference collection =
          mainCollection().doc('kelas').collection('kelas');
      await collection.doc(idKelas).delete();
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
        Guru data =
            Guru.fromMap(querySnapshot.docs[i].data() as Map<String, dynamic>);
        Users user = await getUser(data.idUser!);
        data.nama = user.nama;
        data.email = user.email;
        data.idUsers = user.idUsers;
        data.noHp = user.noHp;
        data.password = user.password;
        data.type = user.type;
        data.username = user.username;
        temp.add(data);
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
      await collection.doc(data.idUser).set(data.toMap());
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

  Future<List<NilaiRaport>> getNilaiRaport(String nis) async {
    List<NilaiRaport> temp = [];
    try {
      CollectionReference collection = mainCollection()
          .doc('siswa')
          .collection('siswa')
          .doc(nis)
          .collection('nilaiRaport');
      var querySnapshot = await collection.get();
      for (int i = 0; i <= querySnapshot.docs.length - 1; i++) {
        temp.add(NilaiRaport.fromMap(
            querySnapshot.docs[i].data() as Map<String, dynamic>));
      }
    } catch (e) {
      print(e);
    }
    return temp;
  }

  Future<List<Agenda>> getAgenda(String nis) async {
    List<Agenda> temp = [];
    try {
      CollectionReference collection = mainCollection()
          .doc('siswa')
          .collection('siswa')
          .doc(nis)
          .collection('agenda');
      var querySnapshot = await collection.get();
      for (int i = 0; i <= querySnapshot.docs.length - 1; i++) {
        temp.add(Agenda.fromMap(
            querySnapshot.docs[i].data() as Map<String, dynamic>));
      }
    } catch (e) {
      print(e);
    }
    return temp;
  }

  Future<bool> addNilaiRaport(NilaiRaport data) async {
    bool isSuccess = false;
    try {
      CollectionReference collection =
          mainCollection().doc('siswa').collection('siswa');
      await collection
          .doc(data.nis)
          .collection('nilaiRaport')
          .doc(data.idMapel)
          .set(data.toMap());
      isSuccess = true;
    } catch (e) {
      isSuccess = false;
      print(e);
    }
    return isSuccess;
  }

  Future<bool> addAgenda(String idUser, Agenda data) async {
    bool isSuccess = false;
    try {
      CollectionReference collection =
          mainCollection().doc('users').collection('users');
      await collection
          .doc(idUser)
          .collection('agenda')
          .doc(data.idAgenda)
          .set(data.toMap());
      isSuccess = true;
    } catch (e) {
      isSuccess = false;
      print(e);
    }
    return isSuccess;
  }
}
