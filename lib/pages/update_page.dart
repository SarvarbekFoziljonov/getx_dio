import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_dio/controllers/update_controller.dart';
import 'package:getx_dio/models/post_model.dart';

class UpdatePage extends StatefulWidget {

  static final String id = "update_page";
  final Post post;

  UpdatePage({this.post});

  @override
  _UpdatePageState createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {

  final UpdateController controller = Get.put(UpdateController());

  @override
  void initState() {
    super.initState();
    controller.getOldPost(widget.post);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        title: Text('Update post'),
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
                      child: Text('Update Post', style: TextStyle(color: Colors.white, fontSize: 20),),
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