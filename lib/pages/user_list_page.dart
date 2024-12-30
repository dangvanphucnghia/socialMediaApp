import 'package:flutter/material.dart';
import '../common/database_helper.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({Key? key}) : super(key: key);

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  List<Map<String, dynamic>> _users = [];

  Future<void> _loadUsers() async {
    final dbHelper = DatabaseHelper();
    final users = await dbHelper.getUsers();
    setState(() {
      _users = users;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
      ),
      body: ListView.builder(
        itemCount: _users.length,
        itemBuilder: (context, index) {
          final user = _users[index];
          return ListTile(
            title: Text(user['name']),
            subtitle: Text(user['email']),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final dbHelper = DatabaseHelper();
          await dbHelper.insertUser({
            'name': 'John Doe',
            'email': 'johndoe@example.com',
          });
          _loadUsers(); // Reload the user list
        },
        child: const Icon(Icons.add),
      ),

    );
  }
}
