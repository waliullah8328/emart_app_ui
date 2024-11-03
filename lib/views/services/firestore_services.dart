import 'package:emart_app_ui/consts/consts.dart';

class FirestoreServices{



  // Get users data
  static getUser(uid){
    return firestore.collection(userCollection).where('id',isEqualTo: uid).snapshots();
  }



}