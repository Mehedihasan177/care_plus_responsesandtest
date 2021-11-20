import 'dart:convert';

import 'package:care_plus_responsesandtest/controllers/miscellaneous/blogs_controller.dart';
import 'package:care_plus_responsesandtest/responses/miscellaneous/miscellaneous_blogs_responses.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BlogUI extends StatefulWidget {
  const BlogUI({Key? key}) : super(key: key);

  @override
  _BlogUIState createState() => _BlogUIState();
}

class _BlogUIState extends State<BlogUI> {

  List<BlogsResponse> blog = [];


  _getNotification() async {
    BlogsController.requestThenResponsePrint(context).then((value) {
      setState(() {
        print(value.body);
        Map<String, dynamic> decoded = json.decode("${value.body}");
        Iterable listNotification = decoded['data'];
        print(decoded['data']);
        blog =
            listNotification.map((model) => BlogsResponse.fromJson(model)).toList();
        print(blog);

      });
    });
  }

  @override
  void initState() {
    _getNotification();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    blog = blog.reversed.toList();
    return Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Notification",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),


              Expanded(
                  child: ListView.builder(
                      itemCount: blog.length,
                      itemBuilder: (BuildContext context, int index) {
                        return buildBlogTile(
                            blog[index]);
                      }
                  )
              ),
            ],
          ),
        )
    );
  }
}

Widget buildBlogTile(BlogsResponse blog) => 
    SingleChildScrollView(
      child: Center(
        child: Text(blog.imageMid),
      ),
    );
