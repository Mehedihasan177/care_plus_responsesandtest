// To parse this JSON data, do
//
//     final blogsResponse = blogsResponseFromJson(jsonString);

import 'dart:convert';

List<BlogsResponse> blogsResponseFromJson(String str) => List<BlogsResponse>.from(json.decode(str).map((x) => BlogsResponse.fromJson(x)));

String blogsResponseToJson(List<BlogsResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BlogsResponse {
  BlogsResponse({
    required this.titleSlug,
    required this.imageMid,
  });

  String titleSlug;
  String imageMid;

  factory BlogsResponse.fromJson(Map<String, dynamic> json) => BlogsResponse(
    titleSlug: json["title_slug"],
    imageMid: json["image_mid"],
  );

  Map<String, dynamic> toJson() => {
    "title_slug": titleSlug,
    "image_mid": imageMid,
  };
}
