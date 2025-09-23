import 'package:bitkub/page/settings.dart';
import 'package:bitkub/widget/AppColors.dart';
import 'package:flutter/material.dart';

class MenuAppbar extends StatefulWidget {
  final bool obscure;
  final VoidCallback? onToggleObscure;
  final bool showMoreVertIcon;
  final bool showEyeIcon;
  final bool showSearchIcon;
  final bool showNotificationIcon;
  final VoidCallback? onLogoTapped; // เพิ่ม callback สำหรับการกดโลโก้
  const MenuAppbar({
    super.key,
    this.obscure = false,
    this.onToggleObscure,
    this.showMoreVertIcon = true,
    this.showEyeIcon = true,
    this.showSearchIcon = true,
    this.showNotificationIcon = true,
    this.onLogoTapped,
  });

  @override
  State<MenuAppbar> createState() => _MenuAppbarState();
}

class _MenuAppbarState extends State<MenuAppbar> {
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _searchFocusNode.addListener(() {});
  }

  @override
  void dispose() {
    _searchFocusNode.dispose();
    super.dispose();
  }

  void _handleLogoTap() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SettingsPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.buttonColor,
      elevation: 2,
      shadowColor: Colors.black.withOpacity(0.3),
      title: _isSearching
          ? TextField(
              controller: _searchController,
              // focusNode: _searchFocusNode,
              // autofocus: false,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white.withOpacity(0.2),
                hintText: "Search...",
                hintStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 15,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.white.withOpacity(0.7),
                ),
              ),
              style: TextStyle(color: Colors.white, fontSize: 16),
              cursorColor: Colors.white,
            )
          : Row(
              children: [
                // เปลี่ยน Container เป็น InkWell เพื่อให้กดได้
                InkWell(
                  onTap: _handleLogoTap,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Image.asset(
                        'assets/images/sji_logo.jpeg',
                        width: 24,
                        height: 24,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "SJI Investment",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Financial Management",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
      actions: [
        if (widget.showSearchIcon && !_isSearching)
          _buildModernIconButton(
            icon: Icons.search,
            onPressed: () {
              setState(() {
                _isSearching = true;
                Future.delayed(const Duration(milliseconds: 100), () {
                  FocusScope.of(context).requestFocus(_searchFocusNode);
                });
              });
            },
          ),

        if (_isSearching)
          _buildModernIconButton(
            icon: Icons.close,
            onPressed: () {
              setState(() {
                _isSearching = false;
                _searchController.clear();
                _searchFocusNode.unfocus();
              });
            },
          ),

        if (widget.showEyeIcon && !_isSearching)
          _buildModernIconButton(
            icon: widget.obscure ? Icons.visibility_off : Icons.visibility,
            onPressed: widget.onToggleObscure ?? () {},
          ),

        if (widget.showNotificationIcon && !_isSearching)
          Container(
            width: 48,
            height: 48,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Center(
                  child: _buildModernIconButton(
                    icon: Icons.notifications_outlined,
                    onPressed: () {},
                  ),
                ),
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    width: 18,
                    height: 18,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.orange.shade800,
                        width: 2,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "12",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 9,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

        if (widget.showMoreVertIcon && !_isSearching)
          _buildModernIconButton(icon: Icons.more_vert, onPressed: () {}),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(4),
        child: Container(
          height: 4,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.orange.shade900,
                Colors.orange.shade700,
                Colors.orange.shade500,
              ],
              stops: [0.0, 0.5, 1.0],
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 2,
                offset: Offset(0, 1),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildModernIconButton({
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return Container(
      width: 40,
      height: 40,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      child: IconButton(
        icon: Icon(icon, size: 22, color: Colors.white),
        style: IconButton.styleFrom(
          backgroundColor: Colors.white.withOpacity(0.1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        padding: EdgeInsets.zero,
        constraints: BoxConstraints(),
        onPressed: onPressed,
      ),
    );
  }
}
