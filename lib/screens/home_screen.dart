import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:i_dance/router/utils.dart';
import 'package:i_dance/widgets/classroom_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              context.push(AppPage.profile.toPath);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Navigate to the create classroom screen
                  },
                  child: const Text('Create Classroom'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to the join classroom screen
                  },
                  child: const Text('Join Classroom'),
                ),
              ],
            ),
          ),
          const Expanded(
            child: ClassroomList(),
          ),
        ],
      ),
    );
  }
}
