import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:i_dance/router/utils.dart';

class ClassroomList extends StatelessWidget {
  const ClassroomList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10, // number of classrooms
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            // Navigate to the classroom screen
            context.pushNamed(AppPage.classroom.toName, params: {
              'id': 'code${index + 1}',
            });
          },
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    title: Text('Classroom ${index + 1}'),
                    trailing: const Icon(Icons.chevron_right),
                  ),
                  ButtonBar(
                    children: [
                      Text('Code: ${index + 1}'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
