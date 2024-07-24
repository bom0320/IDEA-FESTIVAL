import 'package:firebase_auth/firebase_auth.dart';

// FirebaseAuth 인스턴스 생성
final FirebaseAuth _auth = FirebaseAuth.instance;

// 사용자 회원가입 함수
Future<void> _signUp(String email, String password, String name) async {
  try {
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    await userCredential.user.updateProfile(displayName: name);
    print('회원가입 성공: ${userCredential.user}');
  } catch (e) {
    print('회원가입 오류 발생: $e');
  }
}

// 사용자 로그인 함수
Future<void> _signIn(String email, String password) async {
  try {
    UserCredential userCredential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    print('로그인 성공: ${userCredential.user}');
  } catch (e) {
    print('로그인 오류 발생: $e');
  }
}
