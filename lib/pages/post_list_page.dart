import 'package:flutter/material.dart';
import 'package:quick_social/common/database_helper.dart';

class PostListPage extends StatefulWidget {
  const PostListPage({Key? key}) : super(key: key);

  @override
  State<PostListPage> createState() => _PostListPageState();
}

class _PostListPageState extends State<PostListPage> {
  List<Map<String, dynamic>> _posts = [];

  Future<void> _loadPosts() async {
    final dbHelper = DatabaseHelper();
    final posts = await dbHelper.getPosts();
    setState(() {
      _posts = posts;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post List'),
      ),
      body: ListView.builder(
        itemCount: _posts.length,
        itemBuilder: (context, index) {
          final post = _posts[index];
          return ListTile(
            title: Text('Post #${post['id']}'),
            subtitle: Text(post['content']),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final dbHelper = DatabaseHelper();
          await dbHelper.insertPost({
            'user_id': 1,
            'content': 'This is a new post!',
          });
          _loadPosts(); // Reload danh sách bài viết
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
