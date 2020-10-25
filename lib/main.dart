import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flappy_search_bar/search_bar_style.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.green.shade200,
        body: page(),
      ),
    ),
  );
}

//class Home extends StatelessWidget {
//  @override
//  _MyAppState createState() => _MyAppState();
//}

class Post {
  final String title;
  final String description;
  Post(this.title, this.description);
}

Future<List<Post>> search(String search) async {
  await Future.delayed(Duration(seconds: 2));
  return List.generate(search.length, (int index) {
    return Post(
      "Title : $search $index",
      "Description :$search $index",
    );
  });
}

class page extends StatelessWidget {
  Future<List<Post>> search(String search) async {
    await Future.delayed(Duration(seconds: 2));
    return List.generate(search.length, (int index) {
      return Post(
        "Title : $search $index",
        "Description :$search $index",
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade200,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        toolbarHeight: 120.0,
        title: Center(
          child: Text(
            'Home-Me',
            style: TextStyle(
              fontFamily: 'Source Sans Pro',
              fontSize: 38.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          height: 1000.0,
          //mainAxisAlignment: MainAxisAlignment.center,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 125.0),
              child: SearchBar<Post>(
                hintText: 'Zipcode',
                hintStyle: TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold,
                ),
                searchBarStyle: SearchBarStyle(
                    backgroundColor: Colors.white,
                    padding: EdgeInsets.all(10.0),
                    borderRadius: BorderRadius.circular(10.0)),
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                onSearch: search,
                onItemFound: (Post post, int index) {
                  return ListTile(
                    title: Text(post.title),
                    subtitle: Text(post.description),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
