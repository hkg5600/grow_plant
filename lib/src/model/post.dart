import 'package:json_annotation/json_annotation.dart';
part 'post.g.dart';

@JsonSerializable(nullable: false)
class Post {
  final int id;
  final String title;
  final String description;
  final String dateTime;
  final String imagePath;

  Post({this.id, this.title, this.description, this.dateTime, this.imagePath});

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
  Map<String, dynamic> toJson() => _$PostToJson(this);
}
