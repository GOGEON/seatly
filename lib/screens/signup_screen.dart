import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();

  double passwordStrength = 0;
  Color strengthColor = Colors.transparent;

  // 비밀번호 강도 계산
  void _checkPasswordStrength(String password) {
    int strength = 0;
    if (password.length >= 8) strength += 1;
    if (RegExp(r'[A-Z]').hasMatch(password)) strength += 1;
    if (RegExp(r'[0-9]').hasMatch(password)) strength += 1;
    if (RegExp(r'[^A-Za-z0-9]').hasMatch(password)) strength += 1;

    setState(() {
      passwordStrength = strength / 4;
      if (strength <= 1) {
        strengthColor = Colors.red;
      } else if (strength == 2 || strength == 3) {
        strengthColor = Colors.yellow[700]!;
      } else {
        strengthColor = Colors.green;
      }
    });
  }

  // 이메일 유효성 검사
  bool _isValidEmail(String email) {
    final re = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$');
    return re.hasMatch(email);
  }

  // 에러 다이얼로그
  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: const Text('회원가입 오류'),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('확인'),
              ),
            ],
          ),
    );
  }

  // 성공 다이얼로그
  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: Colors.green[100],
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.check, color: Colors.green, size: 32),
                ),
                const SizedBox(height: 16),
                const Text(
                  '회원가입 성공',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(height: 8),
                const Text('계정이 성공적으로 생성되었습니다.'),
                const SizedBox(height: 18),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFCFA857),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop(); // 로그인 화면으로 이동
                  },
                  child: const Text('로그인하기'),
                ),
              ],
            ),
          ),
    );
  }

  Future<void> _submit() async {
    final email = emailController.text.trim();
    final password = passwordController.text;
    final confirm = confirmController.text;

    if (email.isEmpty || password.isEmpty || confirm.isEmpty) {
      _showErrorDialog('모든 필드를 입력해주세요.');
      return;
    }
    if (!_isValidEmail(email)) {
      _showErrorDialog('유효한 이메일 주소를 입력해주세요.');
      return;
    }
    if (password.length < 8) {
      _showErrorDialog('비밀번호는 최소 8자 이상이어야 합니다.');
      return;
    }
    if (password != confirm) {
      _showErrorDialog('비밀번호가 일치하지 않습니다.');
      return;
    }
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      _showSuccessDialog();
    } on FirebaseAuthException catch (e) {
      String msg = '회원가입 실패';
      if (e.code == 'email-already-in-use') {
        msg = '이미 사용 중인 이메일입니다.';
      } else if (e.code == 'invalid-email') {
        msg = '유효하지 않은 이메일 형식입니다.';
      } else if (e.code == 'weak-password') {
        msg = '비밀번호가 너무 약합니다.';
      }
      _showErrorDialog(msg);
    } catch (e) {
      _showErrorDialog('알 수 없는 오류: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                Container(
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 뒤로가기
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Color(0xFF6B7280),
                        ),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                      const SizedBox(height: 8),
                      // 로고 및 안내
                      Center(
                        child: Column(
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
                              '새로운 계정 만들기',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF374151),
                              ),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              '정보를 입력하여 계정을 생성하세요',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF6B7280),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      // 폼
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
                          // 비밀번호
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextField(
                                controller: passwordController,
                                obscureText: true,
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
                                onChanged: _checkPasswordStrength,
                              ),
                              const SizedBox(height: 4),
                              if (passwordController.text.isNotEmpty)
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Container(
                                    height: 6,
                                    width: double.infinity,
                                    color: Colors.grey[200],
                                    child: FractionallySizedBox(
                                      widthFactor: passwordStrength,
                                      alignment: Alignment.centerLeft,
                                      child: Container(color: strengthColor),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          // 비밀번호 확인
                          TextField(
                            controller: confirmController,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: '비밀번호 확인',
                              hintText: '비밀번호를 다시 입력하세요',
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
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: double.infinity,
                            height: 48,
                            child: ElevatedButton(
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
                              onPressed: _submit,
                              child: const Text('회원가입'),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      // 로그인 안내
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              '이미 계정이 있으신가요?',
                              style: TextStyle(
                                fontSize: 13,
                                color: Color(0xFF6B7280),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text(
                                '로그인',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Color(0xFFCFA857),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                // 하단 안내
                Column(
                  children: [
                    Text.rich(
                      TextSpan(
                        text: '회원가입하면 Seatly의 ',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF6B7280),
                        ),
                        children: [
                          TextSpan(
                            text: '서비스 약관',
                            style: const TextStyle(
                              color: Color(0xFFCFA857),
                              decoration: TextDecoration.underline,
                            ),
                            // onTap 등은 GestureDetector로 확장 가능
                          ),
                          const TextSpan(text: ' 및 '),
                          TextSpan(
                            text: '개인정보처리방침',
                            style: const TextStyle(
                              color: Color(0xFFCFA857),
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          const TextSpan(text: '에 동의하게 됩니다.'),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      '© 2025 Seatly. 모든 권리 보유.',
                      style: TextStyle(fontSize: 12, color: Color(0xFF6B7280)),
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
}
