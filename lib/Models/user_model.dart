import 'package:flutter/material.dart';

class UserModel {
  final String id;
  final String name;
  final String email;
  final String homeCountry;
  final String image;

  const UserModel({
    @required this.id,
    @required this.name,
    @required this.email,
    @required this.homeCountry,
    @required this.image,
  });
}