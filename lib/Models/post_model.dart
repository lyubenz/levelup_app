import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
//import 'package:levelupapp/Models/comment_model.dart';
import 'package:levelupapp/Models/user_model.dart';

class PostModel {
  final String id, title, summary, body, imageURL;
  final DateTime postTime;
  final UserModel author;

  const PostModel({
    @required this.id,
    @required this.title,
    @required this.summary,
    @required this.body,
    @required this.imageURL,
    @required this.author,
    @required this.postTime,
  });

  String get postTimeFormatted => DateFormat.yMMMMEEEEd().format(postTime);
}
