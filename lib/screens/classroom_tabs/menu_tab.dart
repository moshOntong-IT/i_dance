import 'package:flutter/material.dart';

class MenuTab extends StatelessWidget {
  const MenuTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Classroom Title', // Replace with the actual classroom title
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(height: 8.0),
              Text(
                'Classroom Code: 123456', // Replace with the actual classroom code
                style: Theme.of(context).textTheme.subtitle1,
              ),
              const SizedBox(height: 8.0),
              Text(
                'Teacher: John Smith', // Replace with the actual teacher's name
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ],
          ),
        ),
        const SizedBox(height: 16.0),
        ElevatedButton(
          onPressed: () {
            // Navigate to the students screen
          },
          child: const Text('Students'),
        ),
        const SizedBox(height: 8.0),
        ElevatedButton(
          onPressed: () {
            // Navigate to the create challenge screen
          },
          child: const Text('Create Challenge'),
        ),
        const SizedBox(height: 8.0),
        // elevated button with titled of Delete
        // and with color red button
        ElevatedButton(
          onPressed: () {
            // Navigate to the delete classroom screen
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
          ),
          child: const Text('Delete'),
        ),
      ],
    );
  }
}
