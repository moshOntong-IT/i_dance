// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:i_dance/models/dance_activity.dart';

import 'package:i_dance/models/dance_attachment.dart';

class DanceFile {
  final String title;
  final String content;
  final List<DanceAttachment>? attachments;
  final DateTime createdAt;
  final DateTime updatedAt;
  DanceFile({
    required this.title,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
    this.attachments,
  });

  DanceFile copyWith({
    String? title,
    String? content,
    List<DanceAttachment>? attachments,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return DanceFile(
      title: title ?? this.title,
      content: content ?? this.content,
      attachments: attachments ?? this.attachments,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  factory DanceFile.fromMap(Map<String, dynamic> map) {
    return DanceFile(
      title: map['title'] as String,
      content: map['content'] as String,
      attachments: List<DanceAttachment>.from(
        (map['attachments'] as List<String>).map<DanceAttachment>(
          (x) => DanceAttachment.fromArray(x),
        ),
      ),
      createdAt: (map['createdAt'] as Timestamp).toDate(),
      updatedAt: (map['updatedAt'] as Timestamp).toDate(),
    );
  }

  factory DanceFile.fromJson(String source) =>
      DanceFile.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DanceFile(title: $title, content: $content, attachments: $attachments, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(covariant DanceFile other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.content == content &&
        listEquals(other.attachments, attachments) &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        content.hashCode ^
        attachments.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }
}
