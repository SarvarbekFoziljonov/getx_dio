import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_dio/controllers/home_view.dart';
import 'package:getx_dio/views/item_of_post.dart';

class HomePage extends StatelessWidget {

  final HomeController _controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("GetX - DIO"),
        ),
        body: Obx(
              () => Stack(
            children: [
              ListView.builder(
                itemCount: _controller.items.length,
                itemBuilder: (ctx, index) {
                  return itemOfPost(_controller, _controller.items[index]);
                },
              ),
              _controller.isLoading()
                  ? Center(
                child: CircularProgressIndicator(),
              )
                  : SizedBox.shrink(),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          onPressed: () {
            _controller.apiCreatePost();
          },
          child: Icon(Icons.add),
        ));
  }

}