import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:seenit/models/service_failures.dart';

class RestServices {
  static var _dio = Dio();

  static Future<Either<ServiceFailure, String>> getPosts() async {
    try {
      String image_url = "";
      var response = await _dio.get("https://api.reddit.com/r/aww/hot.json");
      // print(response.data["data"]["children"]);
      var allPosts = response.data["data"]["children"];

      for (var post in allPosts) {
        if (post["data"]["[post_hint]"] == "image") {
          image_url = post["data"]["url"];
          break;
        }
      }

      return Right(image_url);
    } catch (e) {
      return Left(ServiceFailure.NetworkFailure);
    }
  }
}
