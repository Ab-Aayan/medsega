import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class HelperFunctions {
  //keys
  static String userLoggedInKey = "LOGGEDINKEY";
  static String userNameKey = "USERNAMEKEY";
  static String userEmailKey = "USEREMAILKEY";

  // saving the data to SF

  static Future<bool> saveUserLoggedInStatus(bool isUserLoggedIn) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setBool(userLoggedInKey, isUserLoggedIn);
  }

  static Future<bool> saveUserNameSF(String userName) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setString(userNameKey, userName);
  }

  static Future<bool> saveUserEmailSF(String userEmail) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setString(userEmailKey, userEmail);
  }

  // getting the data from SF

  static Future<bool?> getUserLoggedInStatus() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getBool(userLoggedInKey);
  }

  static Future<String?> getUserEmailFromSF() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString(userEmailKey);
  }

  static Future<String?> getUserNameFromSF() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString(userNameKey);
  }
}

final firebaseInstance = FirebaseFirestore.instance;

class AuthController {
  // Replace this with your actual authentication implementation

  String get userId {
    // Retrieve the current user from Firebase Authentication
    User? user = FirebaseAuth.instance.currentUser;

    // Check if the user is signed in and return the user ID
    if (user != null) {
      return user.uid;
    } else {
      return '';
    }
  }
}

class DataController {
  AuthController authController = AuthController();
  Map userProfileData = {'userName': '', 'email': ''};

  void onReady() {
    getUserProfileData();
  }

  Future<void> getUserProfileData() async {
    try {
      var response = await firebaseInstance
          .collection('users')
          .where('uid', isEqualTo: authController.userId)
          .get();

      if (response.docs.length > 0) {
        userProfileData['userName'] = response.docs[0]['fullName'];
        userProfileData['email'] = response.docs[0]['email'];
      }

      print(userProfileData);
    } on FirebaseException catch (e) {
      print(e);
    } catch (error) {
      print(error);
    }
  }
}

class DataController2 {
  AuthController authController = AuthController();
  Map userProfileData = {'userName': '', 'email': ''};

  void onReady() {
    getUserProfileData();
  }

  Future<void> getUserProfileData() async {
    try {
      var response = await firebaseInstance
          .collection('admins')
          .where('uid', isEqualTo: authController.userId)
          .get();

      if (response.docs.length > 0) {
        userProfileData['userName'] = response.docs[0]['name'];
        userProfileData['email'] = response.docs[0]['email'];
      }

      print(userProfileData);
    } on FirebaseException catch (e) {
      print(e);
    } catch (error) {
      print(error);
    }
  }
}
