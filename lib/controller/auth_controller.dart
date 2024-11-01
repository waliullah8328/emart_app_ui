import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_app_ui/consts/consts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController{

  var isLoading = false.obs;


  // text Controller
  var emailTeController = TextEditingController();
  var passwordTeController = TextEditingController();

  // Login Method
  Future<UserCredential?> loginMethod({context})async{
    UserCredential? userCredential;

    try{
      userCredential = await auth.signInWithEmailAndPassword(email: emailTeController.text, password: passwordTeController.text);

    }on FirebaseAuthException catch(e){
      VxToast.show(context, msg: e.toString());
      
    }
    return userCredential;

  }



// SignUp Method

  Future<UserCredential?> signupMethod({email,password,context})async{
    UserCredential? userCredential;

    try{
      userCredential = await auth.createUserWithEmailAndPassword(email: email, password: password);

    }on FirebaseAuthException catch(e){
      VxToast.show(context, msg: e.toString());

    }
    return userCredential;

  }

  //Storing Data Method

  storeUserData({name,email,password})async{
    DocumentReference store =  firestore.collection(userCollection).doc(currentUser!.uid);
    store.set({
      "name":name,
      "password":password,
      "email":email,
      "imageUrl":"",
      "id":currentUser!.uid,

    });

  }

  // Sign out Method

  signoutMethod({context})async{
    try{
      await auth.signOut();

    }catch(e){
      VxToast.show(context, msg: e.toString());

    }

  }



}