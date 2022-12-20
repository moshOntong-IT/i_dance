// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:i_dance/models/dance_attachment.dart';

import 'package:i_dance/models/dance_file.dart';
import 'package:i_dance/models/submission.dart';

class Activity extends DanceFile {
  final ActivityType activityType;
  final DateTime dueDate;
  final List<Submission> submissions;
  Activity({
    required super.title,
    required super.content,
    required super.createdAt,
    required super.updatedAt,
    super.attachments,
    required this.activityType,
    required this.dueDate,
    required this.submissions,
  });

  @override
  Activity copyWith({
    String? title,
    String? content,
    List<DanceAttachment>? attachments,
    DateTime? createdAt,
    DateTime? updatedAt,
    ActivityType? activityType,
    DateTime? dueDate,
    List<Submission>? submissions,
  }) {
    return Activity(
      title: title ?? super.title,
      content: content ?? super.content,
      attachments: attachments ?? super.attachments,
      createdAt: createdAt ?? super.createdAt,
      updatedAt: updatedAt ?? super.updatedAt,
      activityType: activityType ?? this.activityType,
      dueDate: dueDate ?? this.dueDate,
      submissions: submissions ?? this.submissions,
    );
  }

  factory Activity.fromMap(Map<String, dynamic> map,
      {required List<Submission> submissions}) {
    return Activity(
        title: map['title'] as String,
        content: map['content'] as String,
        attachments: List<DanceAttachment>.from(
          (map['attachments'] as List<String>).map<DanceAttachment>(
            (x) => DanceAttachment.fromArray(x),
          ),
        ),
        createdAt: (map['createdAt'] as Timestamp).toDate(),
        updatedAt: (map['updatedAt'] as Timestamp).toDate(),
        activityType: Activity.toActivityType(map['activityType'] as String),
        dueDate: DateTime.fromMillisecondsSinceEpoch(map['dueDate'] as int),
        submissions: submissions);
  }
  @override
  String toString() =>
      'Activity(activityType: $activityType, dueDate: $dueDate, submissions: $submissions)';

  @override
  bool operator ==(covariant Activity other) {
    if (identical(this, other)) return true;

    return other.activityType == activityType &&
        other.dueDate == dueDate &&
        listEquals(other.submissions, submissions);
  }

  @override
  int get hashCode =>
      activityType.hashCode ^ dueDate.hashCode ^ submissions.hashCode;

  // convert the string into ActivityType
  static ActivityType toActivityType(String type) {
    switch (type) {
      case 'Normal':
        return ActivityType.normal;
      case 'Challenges':
        return ActivityType.challenges;
      default:
        return ActivityType.normal;
    }
  }
}

enum ActivityType {
  normal,
  challenges,
}

// extension for Activity type to convert string into enum
extension ActivityTypeExtension on ActivityType {
  String get name {
    switch (this) {
      case ActivityType.normal:
        return 'Normal';
      case ActivityType.challenges:
        return 'Challenges';
    }
  }
}
