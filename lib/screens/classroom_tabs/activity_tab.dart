import 'package:flutter/material.dart';

class ActivityTab extends StatelessWidget {
  const ActivityTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              // Navigate to the create lesson screen
            },
            child: const Text('Create Activity'),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 10, // number of lessons
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  // Navigate to the lesson screen
                },
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          title: Text('Activity ${index + 1}'),
                          subtitle:
                              Text('Description of Activity ${index + 1}'),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
