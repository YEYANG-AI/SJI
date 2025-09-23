import 'package:bitkub/page/auth/pinSet.dart';
import 'package:bitkub/widget/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  // เพิ่มฟังก์ชันสำหรับเช็ค registration status
  Future<void> _checkRegistrationAndNavigate() async {
    final prefs = await SharedPreferences.getInstance();
    final isRegistered = prefs.getBool('isRegistered') ?? false;

    if (!mounted) return; // ป้องกัน memory leak

    if (isRegistered) {
      // ถ้าลงทะเบียนแล้วให้ไปหน้า setupPin
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PinScreen(isLogin: true)),
      );
    } else {
      Navigator.pushNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.transparent,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppColors.primaryColor, AppColors.secondColor],
          ),
        ),
        child: Stack(
          children: [
            // Main content
            Column(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 200,
                            height: 200,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.deepPurpleAccent,
                                width: 4,
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset(
                                "assets/images/sji_logo.jpeg",
                                width: 160,
                                height: 160,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 40),
                      Text(
                        "SJI INVESTMENT",
                        style: TextStyle(
                          color: AppColors.textColor,
                          fontSize: 32,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 2.5,
                          shadows: [
                            Shadow(
                              color: AppColors.blackTextColor.withOpacity(0.2),
                              blurRadius: 4,
                              offset: Offset(1, 1),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15),
                      Text(
                        "The Big Data For You Win",
                        style: TextStyle(
                          color: AppColors.textColor.withOpacity(0.9),
                          fontSize: 16,
                          letterSpacing: 1.5,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(height: 30),
                    ],
                  ),
                ),

                // Bottom buttons section
                Container(
                  padding: EdgeInsets.all(24),
                  child: Column(
                    children: [
                      // SIGN IN button
                      Container(
                        width: double.infinity,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppColors.textColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 15,
                              offset: Offset(0, 6),
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: Material(
                          color: AppColors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(15),
                            onTap: _checkRegistrationAndNavigate,
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'SIGN IN',
                                    style: TextStyle(
                                      color: AppColors.blackTextColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w800,
                                      letterSpacing: 1.5,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),

                      // SIGN UP button
                      Container(
                        width: double.infinity,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppColors.transparent,
                          border: Border.all(
                            color: AppColors.textColor,
                            width: 2,
                          ),
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(15),
                            onTap: () {
                              Navigator.pushNamed(context, '/register');
                            },
                            child: Center(
                              child: Text(
                                'SIGN UP',
                                style: TextStyle(
                                  color: AppColors.textColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800,
                                  letterSpacing: 1.5,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 40),

                      // Contact section
                      Text(
                        "Need help? Contact our support team",
                        style: TextStyle(
                          color: AppColors.textColor.withOpacity(0.8),
                          fontSize: 14,
                          letterSpacing: 0.5,
                        ),
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.email,
                            color: AppColors.textColor,
                            size: 18,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "sji_investment@gmail.com",
                            style: TextStyle(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.phone,
                            color: AppColors.textColor,
                            size: 18,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "+856 20 9659 6959",
                            style: TextStyle(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
