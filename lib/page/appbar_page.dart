import 'package:flutter/material.dart';

class AppbarPage extends StatefulWidget {
  const AppbarPage({super.key});

  @override
  State<AppbarPage> createState() => _AppbarPageState();
}

class _AppbarPageState extends State<AppbarPage> {
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.orange.shade800,
      elevation: 0,
      leading: Container(
        margin: EdgeInsets.all(5),
        child: FlutterLogo(size: 30),
      ),
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
          : Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text("ReCcreated", style: TextStyle(color: Colors.white)),
              ],
            ),

      actions: [
        !_isSearching
            ? IconButton(
                icon: Icon(Icons.search, color: Colors.white, size: 30),
                onPressed: () {
                  setState(() {
                    _isSearching = true;
                  });
                },
              )
            : IconButton(
                icon: Icon(Icons.close, color: Colors.white, size: 30),
                onPressed: () {
                  setState(() {
                    _isSearching = false;
                    _searchController.clear();
                  });
                },
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
