import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:scrapingdart/screens/homepage.dart';
class AuthService extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  // Sign Up with email and password
  Future<String?> signUp(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
        
      );
      print(email);
      Get.snackbar("Success", "User Signup  successfully");
      return null;
      
      
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
              Get.snackbar("Weak", "Pasword provided is Weak");
        print(email);
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
          Get.snackbar("Used", "The account already exists for that email.");
        print(email);
        return 'The account already exists for that email.';
      }
      return e.message;
    } catch (e) {
      print(e);
      return e.toString();
    }
  }

  // Login with email and password
  Future<String?> login(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
       Get.snackbar("Success", "User Login Successfully");
       Get.to(()=>FirebaseGridView ());
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
         Get.snackbar("Not Found", "User not found");
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
         Get.snackbar("Incorrect", "Password is Incorrect");
        return 'Wrong password provided for that user.';
      }
      return e.message;
    } catch (e) {
      return e.toString();
    }
  }

  // Forget password
  Future<String?> forgetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
       Get.snackbar("Success", "Email Sent successfully");
      return null;

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
         Get.snackbar("UnSuccess", "No user found for email");
        return 'No user found for that email.';
      }
      return e.message;
    } catch (e) {
       Get.snackbar("Error", "${e}");
      return e.toString();
    }
  }
}
