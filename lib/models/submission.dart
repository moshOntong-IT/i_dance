// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:i_dance/models/dance_attachment.dart';

class Submission {
  final String studentId;
  final String name;
  final int score;
  final DateTime updatedAt;
  final DateTime createdAt;
  final List<DanceAttachment> attachments;
  Submission({
    required this.studentId,
    required this.name,
    required this.score,
    required this.updatedAt,
    required this.createdAt,
    required this.attachments,
  });

  Submission copyWith({
    String? studentId,
    String? name,
    int? score,
    DateTime? updatedAt,
    DateTime? createdAt,
    List<DanceAttachment>? attachments,
  }) {
    return Submission(
      studentId: studentId ?? this.studentId,
      name: name ?? this.name,
      score: score ?? this.score,
      updatedAt: updatedAt ?? this.updatedAt,
      createdAt: createdAt ?? this.createdAt,
      attachments: attachments ?? this.attachments,
    );
  }

  factory Submission.fromMap(String studentId, Map<String, dynamic> map) {
    return Submission(
      studentId: studentId,
      name: map['name'] as String,
      score: map['score'] as int,
      updatedAt: DateTime.fromMillisecondsSinceEpoch(map['updatedAt'] as int),
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
      attachments: List<DanceAttachment>.from(
        (map['attachments'] as List<String>).map<DanceAttachment>(
          (x) => DanceAttachment.fromArray(x),
        ),
      ),
    );
  }

  factory Submission.fromJson(String studentId, String source) =>
      Submission.fromMap(
          studentId, json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Submission(name: $name, score: $score, updatedAt: $updatedAt, createdAt: $createdAt, attachments: $attachments)';
  }

  @override
  bool operator ==(covariant Submission other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.score == score &&
        other.updatedAt == updatedAt &&
        other.createdAt == createdAt &&
        listEquals(other.attachments, attachments);
  }

  @override
  int get hashCode {
    return name.hashCode ^
        score.hashCode ^
        updatedAt.hashCode ^
        createdAt.hashCode ^
        attachments.hashCode;
  }
}
