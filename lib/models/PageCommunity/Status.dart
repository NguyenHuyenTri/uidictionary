import 'package:flutter/material.dart';

class Status {
  Status(
       this.title,
      this.userName,
      this.image,
      this.userRoles,
      this.time,
      this.studyLanguage,
      this.status,
      this.totalFavourite,
      this.totalComment,
      this.details);

  final String title;
  final String userName;
  final String image;
  final String userRoles;
  final String time;
  final String studyLanguage;
  final String status;
  final int totalFavourite;
  final int totalComment;
  final int details;

}
