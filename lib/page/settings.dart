import 'dart:ui';
import 'package:bitkub/widget/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
// ต้อง import BiometricService
import 'package:bitkub/page/auth/widget/PIN/BiometricService.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool notificationsEnabled = true;
  bool biometricEnabled = false;
  bool locationEnabled = false;

  // สร้าง instance ของ BiometricService
  final BiometricService _biometricService = BiometricService();

  @override
  void initState() {
    super.initState();
    _loadBiometricSetting();
  }

  Future<void> _loadBiometricSetting() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      setState(() {
        biometricEnabled = prefs.getBool('biometric_enabled') ?? false;
      });
    } catch (e) {
      print('Error loading biometric setting: $e');
    }
  }

  Future<void> _saveBiometricSetting(bool value) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('biometric_enabled', value);
    } catch (e) {
      print('Error saving biometric setting: $e');
    }
  }

  Future<void> _handleBiometricToggle(bool newValue) async {
    if (newValue) {
      final isAuthenticated = await _biometricService.authenticate(
        context: context,
        onAuthSuccess: () {
          setState(() {
            biometricEnabled = true;
          });
          _saveBiometricSetting(true);

          // แสดงข้อความแจ้งเตือน
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Enable Biometric Sucessful'),
              backgroundColor: Colors.green,
            ),
          );
        },
      );

      if (!isAuthenticated) {
        // การยืนยันล้มเหลว - ไม่เปลี่ยนค่า
        setState(() {
          biometricEnabled = false;
        });
        // แสดงข้อความแจ้งเตือน
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Fail to verify biometric'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } else {
      // ถ้าต้องการปิดใช้งาน Biometric
      final isAuthenticated = await _biometricService.authenticate(
        context: context,
        onAuthSuccess: () {
          // การยืนยันสำเร็จ - เปลี่ยนค่าและบันทึก
          setState(() {
            biometricEnabled = false;
          });
          _saveBiometricSetting(false);

          // แสดงข้อความแจ้งเตือน
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Disable Biometric sucesssful'),
              backgroundColor: Colors.green,
            ),
          );
        },
      );

      if (!isAuthenticated) {
        // การยืนยันล้มเหลว - ไม่เปลี่ยนค่า
        setState(() {
          biometricEnabled = true;
        });
        // แสดงข้อความแจ้งเตือน
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Fail to verify biometric'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.buttonColor,
        elevation: 0,
        title: Text(
          'Settings',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.keyboard_arrow_left,
            size: 30,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppColors.primaryColor, AppColors.secondColor],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Settings List
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(16),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: ListView(
                        padding: EdgeInsets.only(top: 8, bottom: 8),
                        children: [
                          _buildSettingItem(
                            icon: Icons.person_outline,
                            title: 'Profile',
                            onTap: () {},
                            hasArrow: true,
                          ),
                          _buildSwitchItem(
                            icon: Icons.notifications_outlined,
                            title: 'Notification',
                            value: notificationsEnabled,
                            onChanged: (value) {
                              setState(() {
                                notificationsEnabled = value;
                              });
                            },
                          ),
                          _buildSwitchItem(
                            icon: Icons.fingerprint,
                            title: 'Login With Biometric',
                            value: biometricEnabled,
                            onChanged:
                                _handleBiometricToggle, // เปลี่ยนมาใช้ฟังก์ชันใหม่
                          ),
                          _buildSettingItem(
                            icon: Icons.lock_outline,
                            title: 'Change PIN 4 Digits Login',
                            onTap: () {},
                            hasArrow: true,
                          ),
                          _buildSettingItem(
                            icon: Icons.language,
                            title: 'Languege',
                            onTap: () {},
                            hasArrow: true,
                          ),
                          _buildSettingItem(
                            icon: Icons.help_outline,
                            title: 'Device Manage',
                            onTap: () {},
                            hasArrow: true,
                          ),
                          _buildSettingItem(
                            icon: Icons.exit_to_app,
                            title: 'Log Out',
                            onTap: () {},
                            hasArrow: false,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSettingItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    bool hasArrow = false,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.white.withOpacity(0.1),
              width: 0.5,
            ),
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.effectsColor.withOpacity(0.3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: Colors.white, size: 22),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            if (hasArrow)
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.white.withOpacity(0.6),
                size: 16,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildSwitchItem({
    required IconData icon,
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.white.withOpacity(0.1), width: 0.5),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.effectsColor.withOpacity(0.3),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: Colors.white, size: 22),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Transform.scale(
            scale: 0.9,
            child: Switch(
              value: value,
              onChanged: onChanged,
              activeColor: AppColors.effectsColor,
              activeTrackColor: AppColors.effectsColor.withOpacity(0.5),
              inactiveThumbColor: Colors.grey[300],
              inactiveTrackColor: Colors.grey.withOpacity(0.3),
            ),
          ),
        ],
      ),
    );
  }
}
