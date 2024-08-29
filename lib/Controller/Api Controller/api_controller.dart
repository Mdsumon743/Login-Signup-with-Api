import 'dart:convert';

import 'package:api_demo/Model/product_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiController extends GetxController {
  RxBool isLoad = false.obs;
  RxList<ProductModel> productList = RxList<ProductModel>();

  Future<RxList<ProductModel>> getProductData() async {
    try {
      isLoad.value = true;
      final response =
          await http.get(Uri.parse('https://api.escuelajs.co/api/v1/products'));
      var data = jsonDecode(response.body.toString());
      if (response.statusCode == 200) {
        for (var item in data) {
          productList.add(ProductModel.fromJson(item));
        }
        isLoad.value = false;
        return productList;
      } else {
        isLoad.value = false;
        return productList;
      }
    } catch (e) {
      isLoad.value = false;
      return productList;
    }
  }

  Future<void> signUp(
    String email,
    String password,
  ) async {
    try {
      isLoad.value = true;
      var response =
          await post(Uri.parse('https://reqres.in/api/register'), body: {
        'email': email,
        'password': password,
      });
      if (response.statusCode == 200) {
        isLoad.value = false;
        var data = jsonDecode(response.body.toString());
        Get.snackbar('Account create', 'Success ${data['token']}');
      } else {
        isLoad.value = false;
        var data = jsonDecode(response.body.toString());
        Get.snackbar('Account create', 'Failed $data');
      }
    } catch (e) {
      isLoad.value = false;
      return;
    }
  }

  Future<void> login(String email, String password) async {
    try {
      isLoad.value = true;
      var response =
          await http.post(Uri.parse('https://reqres.in/api/login'), body: {
        'email': email,
        'password': password,
      });
      var data = jsonDecode(response.body.toString());
      if (response.statusCode == 200) {
        isLoad.value = false;
        Get.snackbar('Login', 'Success $data');
      } else {
        isLoad.value = false;
        Get.snackbar('Login', 'Failed $data');
      }
    } catch (e) {
      isLoad.value = false;
      return;
    }
  }
}
