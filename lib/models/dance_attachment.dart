// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class DanceAttachment {
  DanceAttachment({
    required this.urlPath,
    required this.type,
  });

  final String urlPath;
  final FileType type;

  DanceAttachment copyWith({
    String? urlPath,
    FileType? type,
  }) {
    return DanceAttachment(
      urlPath: urlPath ?? this.urlPath,
      type: type ?? this.type,
    );
  }

  factory DanceAttachment.fromArray(String attachPath) {
    return DanceAttachment(
      urlPath: attachPath,
      type: DanceAttachment.getFileType(attachPath),
    );
  }

  @override
  String toString() => 'DanceAttachment(urlPath: $urlPath, type: $type)';

  @override
  bool operator ==(covariant DanceAttachment other) {
    if (identical(this, other)) return true;

    return other.urlPath == urlPath && other.type == type;
  }

  @override
  int get hashCode => urlPath.hashCode ^ type.hashCode;

  static FileType getFileType(String path) {
    if (path.contains('.jpg') ||
        path.contains('.png') ||
        path.contains('.jpeg')) {
      return FileType.image;
    } else if (path.contains('.mp4')) {
      return FileType.video;
    } else if (path.contains('.mp3')) {
      return FileType.audio;
    } else if (path.contains('.pdf')) {
      return FileType.document;
    } else {
      return FileType.other;
    }
  }
}

//  enum for file type
enum FileType {
  image,
  video,
  audio,
  document,
  other,
}
