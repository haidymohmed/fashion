import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';


class AuthContraller{
  late FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  
  signUp( email , password , name )async{
    var userAccount = await auth.createUserWithEmailAndPassword(email: email, password: password);
    await auth.currentUser!.sendEmailVerification();
    await firestore.collection("Users").doc(userAccount.user!.uid).set(
    {
      'email' : email,
      'name' : name,
      'id' : userAccount.user!.uid
    }
    );
    auth.currentUser!.emailVerified;
  }
  logIn( email , password )async{
    await auth.signInWithEmailAndPassword(email: email, password: password);
  }
  forgotPassword(email)async{
    await auth.sendPasswordResetEmail(email: email);
  }
  signInWithGoogle()async{
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    var credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    await auth.signInWithCredential(credential);
  }
}