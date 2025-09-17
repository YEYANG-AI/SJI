import 'package:flutter/material.dart';

class MenuAppbar extends StatefulWidget {
  final bool obscure;
  final VoidCallback? onToggleObscure;
  final bool showMoreVertIcon;
  final bool showEyeIcon;
  final showSearchIcon;
  final showNotificationIcon;
  const MenuAppbar({
    super.key,
    this.obscure = false,
    this.onToggleObscure,
    this.showMoreVertIcon = true,
    this.showEyeIcon = true,
    this.showSearchIcon = true,
    this.showNotificationIcon = true,
  });

  @override
  State<MenuAppbar> createState() => _MenuAppbarState();
}

class _MenuAppbarState extends State<MenuAppbar> {
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.orange.shade800,
      leading: Icon(Icons.menu, size: 30, color: Colors.white),
      title: _isSearching
          ? TextField(
              controller: _searchController,
              autofocus: true,
              decoration: InputDecoration(
                fillColor: Colors.white,
                hintText: "Search...",
                hintStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
              style: TextStyle(color: Colors.white, fontSize: 18),
              cursorColor: Colors.white,
            )
          : Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Row(
                children: [
                  Text(
                    "SJI investment",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
      actions: [
        // ใช้ Row แบบ紧凑มากขึ้น
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min, // 重要: ทำให้ Row มีขนาดเท่าที่จำเป็น
          children: [
            if (widget.showSearchIcon)
              _isSearching
                  ? _buildCompactIconButton(
                      icon: Icons.close,
                      onPressed: () {
                        setState(() {
                          _isSearching = false;
                        });
                      },
                    )
                  : _buildCompactIconButton(
                      icon: Icons.search,
                      onPressed: () {
                        setState(() {
                          _isSearching = true;
                        });
                      },
                    ),

            if (widget.showEyeIcon)
              _buildCompactIconButton(
                icon: widget.obscure
                    ? Icons.visibility_off
                    : Icons.remove_red_eye,
                onPressed: widget.onToggleObscure ?? () {},
              ),

            if (widget.showNotificationIcon)
              // ใช้ Container แทน Stack เพื่อลดความซับซ้อน
              Container(
                width: 40, // กำหนดความกว้างคงที่
                height: 40, // กำหนดความสูงคงที่
                child: Stack(
                  clipBehavior:
                      Clip.none, // อนุญาตให้ลูกศูนย์วางตำแหน่งนอกขอบเขต
                  children: [
                    Center(
                      child: _buildCompactIconButton(
                        icon: Icons.notifications,
                        onPressed: () {},
                      ),
                    ),
                    Positioned(
                      right: 8, // ปรับตำแหน่ง notification badge
                      top: 8,
                      child: Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            "12",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            if (widget.showMoreVertIcon)
              _buildCompactIconButton(icon: Icons.more_vert, onPressed: () {}),
          ],
        ),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(6),
        child: Column(
          children: [
            Container(
              height: 5,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.orange.shade800, Colors.orange.shade300],
                ),
              ),
            ),
            Container(color: Colors.white, height: 1),
          ],
        ),
      ),
    );
  }

  Widget _buildCompactIconButton({
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return Container(
      width: 40, // กำหนดขนาดคงที่
      height: 40,
      child: IconButton(
        icon: Icon(icon, size: 20, color: Colors.white),
        padding: EdgeInsets.zero, // กำจัด padding
        constraints: BoxConstraints(), // กำจัด constraints เริ่มต้น
        onPressed: onPressed,
      ),
    );
  }
}
