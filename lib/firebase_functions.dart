

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseFunctions{

  static loginUser(String emailAddress,String password,
  { required Function onSuccess,required Function onError})async{
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailAddress,
          password: password,

      );
       onSuccess(credential.user?.displayName ??"");
    } on FirebaseAuthException catch (e) {
      onError(e.message);
    }catch(e){
      onError(e.toString());
      print(e.toString());
    }
  }

 static createAccountAuth(String emailAddress,String password,
   String fullName, int age,{ required Function onSuccess}
     )async{
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,

      );
      await FirebaseFirestore.instance
          .collection('users')
          .doc(credential.user?.uid)
          .set({
        'fullName': fullName,
        'age': age,
        'email': emailAddress,
      });

      onSuccess();
     await credential.user?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
}

