import 'package:flutter/material.dart';
import 'signup_screen.dart'; // 추가
import 'package:firebase_auth/firebase_auth.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String userType = 'user'; // 'user' 또는 'business'
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: const Text('로그인 오류'),
            content: Text(message),
            actions: [
              TextButton(
                child: const Text('확인'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
    );
  }

  Future<void> _login() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    if (email.isEmpty || password.isEmpty) {
      _showErrorDialog('이메일과 비밀번호를 모두 입력해주세요.');
      return;
    }
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Navigator.pushReplacementNamed(context, '/home');
    } on FirebaseAuthException catch (e) {
      String msg = '로그인 실패';
      if (e.code == 'user-not-found') {
        msg = '존재하지 않는 계정입니다.';
      } else if (e.code == 'wrong-password') {
        msg = '비밀번호가 일치하지 않습니다.';
      } else if (e.code == 'invalid-email') {
        msg = '유효하지 않은 이메일 형식입니다.';
      }
      _showErrorDialog(msg);
    } catch (e) {
      _showErrorDialog('알 수 없는 오류: $e');
    }
  }

  void _googleLogin() {
    // TODO: 구글 로그인 구현
    print('구글 로그인 시도');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Container(
            width: 380,
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x11000000),
                  blurRadius: 16,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // 로고와 인삿말
                Column(
                  children: [
                    Text(
                      'seatly',
                      style: TextStyle(
                        fontFamily: 'Pacifico', // pubspec.yaml에 등록 필요
                        fontSize: 36,
                        color: const Color(0xFFCFA857),
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.5,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      '환영합니다',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF374151),
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      '계정에 로그인하여 서비스를 이용하세요',
                      style: TextStyle(fontSize: 14, color: Color(0xFF6B7280)),
                    ),
                    const SizedBox(height: 20),
                    // 사용자 타입 버튼
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _userTypeButton('일반 회원', 'user'),
                        const SizedBox(width: 8),
                        _userTypeButton('가게 관리자', 'business'),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                // 구글 로그인 버튼
                ElevatedButton(
                  onPressed: _googleLogin,
                  style: ElevatedButton.styleFrom(
                    foregroundColor: const Color(0xFF374151),
                    backgroundColor: Colors.white,
                    minimumSize: const Size.fromHeight(48),
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: const BorderSide(color: Color(0xFFD1D5DB)),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 20,
                        height: 20,
                        child: Image.asset(
                          'assets/google_logo.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'Google로 계속하기',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                // 구분선
                Row(
                  children: [
                    const Expanded(child: Divider(color: Color(0xFFE5E7EB))),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      color: Colors.white,
                      child: const Text(
                        '또는',
                        style: TextStyle(
                          color: Color(0xFF6B7280),
                          fontSize: 13,
                        ),
                      ),
                    ),
                    const Expanded(child: Divider(color: Color(0xFFE5E7EB))),
                  ],
                ),
                const SizedBox(height: 20),
                // 로그인 폼
                Column(
                  children: [
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: '이메일',
                        hintText: '이메일 주소를 입력하세요',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                            color: Color(0xFFCFA857),
                            width: 2,
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        labelText: '비밀번호',
                        hintText: '비밀번호를 입력하세요',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                            color: Color(0xFFCFA857),
                            width: 2,
                          ),
                        ),
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(height: 18),
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: _login,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFCFA857),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        child: const Text('로그인'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // 회원가입 링크
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      '아직 회원이 아니신가요?',
                      style: TextStyle(fontSize: 13, color: Color(0xFF6B7280)),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignupScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        '회원가입',
                        style: TextStyle(
                          fontSize: 13,
                          color: Color(0xFFCFA857),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _userTypeButton(String label, String type) {
    final bool selected = userType == type;
    return Expanded(
      child: OutlinedButton(
        onPressed: () {
          setState(() {
            userType = type;
          });
        },
        style: OutlinedButton.styleFrom(
          backgroundColor: selected ? const Color(0xFFCFA857) : Colors.white,
          foregroundColor: selected ? Colors.white : const Color(0xFF6B7280),
          side:
              selected
                  ? BorderSide.none
                  : const BorderSide(color: Color(0xFFD1D5DB)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(999),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12),
          textStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
        ),
        child: Text(label),
      ),
    );
  }
}
