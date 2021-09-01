import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_dio/models/post_model.dart';
import 'package:getx_dio/services/dio_service.dart';

class CreateController extends GetxController {
  var isLoading = false.obs;
  var titleController = TextEditingController().obs;
  var bodyController = TextEditingController().obs;

  Future apiCreatePost() async{
    isLoading(true);

    String title = titleController.value.text.trim().toString();
    String body = bodyController.value.text.trim().toString();
    Post post = Post(title: title, body: body, userId: 1, id: 1,);

    var response = await Network.POST(Network.API_CREATE, Network.paramsCreate(post));
    isLoading(false);
    Get.back(result: response);
  }

}