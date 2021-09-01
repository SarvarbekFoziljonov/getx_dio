import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_dio/models/post_model.dart';
import 'package:getx_dio/services/dio_service.dart';

class UpdateController extends GetxController{
  var isLoading = false.obs;
  var titleController = TextEditingController().obs;
  var bodyController = TextEditingController().obs;
  Post oldPost;

  void getOldPost(Post post) {
    oldPost = post;
    titleController.value.text = oldPost.title;
    bodyController.value.text = oldPost.body;
  }

  Future apiCreatePost() async{
    isLoading(true);
    String title = titleController.value.text.trim().toString();
    String body = bodyController.value.text.trim().toString();
    Post post = Post(title: title, body: body, userId: oldPost.userId, id: oldPost.id);
    var response = await Network.PUT(Network.API_UPDATE + oldPost.id.toString(), Network.paramsUpdate(post));
    isLoading(false);
    Get.back(result: response);
  }

}