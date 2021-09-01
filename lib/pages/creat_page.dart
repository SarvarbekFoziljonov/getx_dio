import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_dio/controllers/creat_view.dart';

class CreatePage extends StatelessWidget {

  final CreateController controller = Get.put(CreateController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        title: Text('Create new post'),
      ),
      backgroundColor: Colors.white,
      body: Obx(
            () => Stack(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  TextField(
                    controller: controller.titleController(),
                    decoration: InputDecoration(
                      labelText: "Post Title",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.only(right: 15, left: 15),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    controller: controller.bodyController(),
                    decoration: InputDecoration(
                      labelText: "Post Body",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.only(
                          right: 15, top: 15, bottom: 50, left: 15),
                    ),
                    maxLines: 7,
                  ),
                  SizedBox(height: 30,),
                  Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.indigoAccent,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextButton(
                      child: Text('Create Post', style: TextStyle(color: Colors.white, fontSize: 20),),
                      onPressed: controller.apiCreatePost,
                    ),
                  ),
                ],
              ),
            ),

            controller.isLoading() ? Center(child: CircularProgressIndicator()) : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}