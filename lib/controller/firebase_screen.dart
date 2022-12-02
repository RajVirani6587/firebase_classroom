
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

Future<String>singup(String e1,String p1) async{
  try {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
     await firebaseAuth.createUserWithEmailAndPassword(email: e1, password: p1);
     return "Success";
  }
  on FirebaseAuthException catch (e){
    if(e.code == "weak-password")
      {
          return "Password at list 6 Char";
      }
    else if (e.code == "email-already-in-use")
      {
          return "Email already Exist";
      }
  }
  return "not_found";
}


Future<String> loginEmailPassword(String email,String password) async{
   try {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth.signInWithEmailAndPassword(email: email.trim(), password: password.trim()).then((value) => print("Success")).catchError((error)=> print("$error"));
    return "Success";
      }
  on FirebaseAuthException catch (e){
    if(e.code == "user-not-found")
    {
      return "No user found for thst email.";
    }
    else if (e.code == 'wrong-password')
    {
      return 'Wrong password provided for that user.';
    }
  }
  return "not_found";
}

bool checkUser(){
  User? user = FirebaseAuth.instance.currentUser;
  if(user!=null)
    {
      return true;
    }
  return false;
}

void logout()async{
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  firebaseAuth.signOut();
  GoogleSignIn googleSignIn = GoogleSignIn();
  await googleSignIn.signOut();
}


Future<bool> googlelogin()async{
  GoogleSignInAccount? googleSignInAccount = await GoogleSignIn().signIn();
  GoogleSignInAuthentication? googleSignInAuthentication = await googleSignInAccount ?.authentication;
  var cred = GoogleAuthProvider.credential(
    accessToken: googleSignInAuthentication!.accessToken,
    idToken: googleSignInAuthentication.idToken,);
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  await firebaseAuth.signInWithCredential(cred).then((value) => print("Success")).catchError((error)=>print("Error $error"));
  return checkUser();
}


Future<List> userProfile()async{
  User ? user = FirebaseAuth.instance.currentUser;
  return [
    user!.email,
    user.displayName,
    user.photoURL,
  ];
}

//================================== firestore============================


void insertData(){
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  CollectionReference collectionReference = firebaseFirestore.collection("Student");
  collectionReference.add({}).then((value) => print("Success")).catchError((error)=>print("Error $error"));
}
