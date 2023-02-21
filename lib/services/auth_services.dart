import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/end_user.dart';

class AuthService {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  //Init Firebase user
  EndUser _userFirebaseUser(User? firebaseUser) {
    return EndUser(
      uid: firebaseUser!.uid,
    );
  }

  //Signin Email/Pass
  Future loginUser(String login, String password) async {
    try {
      UserCredential endUserCredentials = await _firebaseAuth
          .signInWithEmailAndPassword(email: login, password: password);
      User firebaseUser = endUserCredentials.user!;
      return _userFirebaseUser(firebaseUser);
    } catch (e) {
      print('Login failed, reason: ' + e.toString());
      return null;
    }
  }

//deconnexion du compte
  Future<void> logout() async {
    try {
      print('logging out...');
      await _firebaseAuth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  Future addUserToCollection(EndUser newUser, String? uid) async {
    await _firebaseFirestore.collection('users').doc(uid).set(newUser.toJson());
  }

//Signup Email/Pass
  Future registerUser(String email, String password) async {
    try {
      UserCredential endUserCredentials = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      User firebaseUser = endUserCredentials.user!;
      return _userFirebaseUser(firebaseUser);
    } catch (e) {
      print('sign up  failed, reason: ' + e.toString());
      return null;
    }
  }

  //creer le document de chaque utilisateur ayant fait le signup
  Future createUserDocument(String docId, EndUser mUser) async {
    try {
      await _firebaseFirestore
          .collection('users')
          .doc(docId)
          .set(mUser.toJson());
    } catch (e) {
      print(e);
    }
  }

  Future<DocumentSnapshot> getUserData(String userID) async {
    return _firebaseFirestore.collection('users').doc(userID).get();
  }
}
