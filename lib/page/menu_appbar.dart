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
                //border: InputBorder.none,
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
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (widget.showSearchIcon)
              _isSearching
                  ? IconButton(
                      icon: Icon(Icons.close, size: 30, color: Colors.white),
                      onPressed: () {
                        setState(() {
                          _isSearching = false;
                        });
                      },
                    )
                  : IconButton(
                      icon: Icon(Icons.search, size: 30, color: Colors.white),
                      onPressed: () {
                        setState(() {
                          _isSearching = true;
                        });
                      },
                    ),

            if (widget.showEyeIcon)
              IconButton(
                icon: Icon(
                  widget.obscure ? Icons.visibility_off : Icons.remove_red_eye,
                  size: 30,
                  color: Colors.white,
                ),
                onPressed: widget.onToggleObscure ?? () {},
              ),

            if (widget.showNotificationIcon)
              Stack(
                children: [
                  Container(
                    child: IconButton(
                      icon: Icon(
                        Icons.notifications,
                        size: 30,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  Positioned(
                    right: 10,
                    top: 10,
                    child: CircleAvatar(
                      radius: 6,
                      backgroundColor: Colors.red,
                      child: Text(
                        "12",
                        style: TextStyle(color: Colors.white, fontSize: 8),
                      ),
                    ),
                  ),
                ],
              ),
            if (widget.showMoreVertIcon)
              IconButton(
                icon: Icon(Icons.more_vert, size: 30, color: Colors.white),
                onPressed: () {},
              ),
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
}
