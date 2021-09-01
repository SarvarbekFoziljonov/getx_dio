import 'package:get/get.dart';
import 'package:getx_dio/models/post_model.dart';
import 'package:getx_dio/pages/creat_page.dart';
import 'package:getx_dio/pages/update_page.dart';
import 'package:getx_dio/services/dio_service.dart';

class HomeController extends GetxController{
  RxBool isLoading = false.obs;
  RxList<Post> items = <Post>[].obs;

  @override
  void onInit() {
    super.onInit();
    apiPostList();
  }

  Future<void> apiPostList() async {
    isLoading(true);
    var response = await Network.GET(Network.API_LIST, Network.paramsEmpty());
    if (response != null) {
      items(Network.parsePostList(response));
    } else {
      items([]);
    }
    isLoading(false);
  }


  Future<bool> apiPostDelete(Post post) async {
    isLoading(true);
    var response = await Network.DEL(Network.API_DELETE + post.id.toString(), Network.paramsEmpty());
    isLoading(false);
    return response != null;
  }

  Future<void> apiUpdatePost(Post post) async{
    String result = await Get.to(() => UpdatePage(post: post,));
    if(result != null) {
      Post newPost = Network.parsePost(result);
      items[items.indexWhere((element) => element.id == newPost.id)] = newPost;
    }
  }

  Future<void> apiCreatePost() async{
    String result = await Get.to(() => CreatePage());
    if(result != null) items.add(Network.parsePost(result));
  }

  @override
  void onClose() {
    super.onClose();
  }

}