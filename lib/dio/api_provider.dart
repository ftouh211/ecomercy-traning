//
// import 'package:dio/dio.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:ecomercy/dio/models/productis_model.dart'; // Adjust import according to your directory structure
//
// class ApiProvider {
//   Ecomercy? ecomercyModel;
//   final String baseUrl = 'https://dummyjson.com';
//
//   // Method to fetch products
//   Future<Ecomercy?> getProducts() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     try {
//       Response response = await Dio().get(
//         "$baseUrl/products",
//         queryParameters: {
//           "select": "id,title,description,category,price,thumbnail"
//         },
//         options: Options(
//             headers: {
//               "Authorization": "Bearer ${prefs.getString("userToken")}"
//             }
//         ),
//       );
//
//       if (response.statusCode == 200) {
//         ecomercyModel = Ecomercy.fromJson(response.data);
//         return ecomercyModel;
//       } else {
//         print("Failed to fetch data");
//         return null;
//       }
//     } catch (e) {
//       print("Error: $e");
//       return null;
//     }
//   }
//
//   // Method to fetch products by category
//   Future<Ecomercy?> getProductsByCategory(String category) async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     try {
//       Response response = await Dio().get(
//         "$baseUrl/products",
//         queryParameters: {
//           "category": category,
//           "select": "id,title,description,category,price,thumbnail"
//         },
//         options: Options(
//             headers: {
//               "Authorization": "Bearer ${prefs.getString("userToken")}"
//             }
//         ),
//       );
//
//       if (response.statusCode == 200) {
//         return Ecomercy.fromJson(response.data);
//       } else {
//         print("Failed to fetch products for category: $category");
//         return null;
//       }
//     }catch (e) {
//       print("Error: $e");
//       return null;
//     }
//   }
//
//   // Method to fetch categories
//   Future<List<dynamic>?> getCategories() async {
//     try {
//       Response response = await Dio().get("$baseUrl/products/category-list");
//
//       if (response.statusCode == 200) {
//         return response.data as List<dynamic>;
//       } else {
//         print("Failed to fetch categories");
//         return null;
//       }
//     } catch (e) {
//       print("Error fetching categories: $e");
//       return null;
//     }
//   }
//
//   // Method to handle user login
//   // Future<void> userLogin({required String userName, required String password}) async {
//   //   final SharedPreferences prefs = await SharedPreferences.getInstance();
//   //   FormData userData = FormData.fromMap({
//   //     "username": userName,
//   //     "password": password
//   //   });
//   //
//   //   try {
//   //     Response response = await Dio().post("$baseUrl/auth/login", data: userData);
//   //     await prefs.setString('userToken', response.data['token']);
//   //   } catch (e) {
//   //     print("Login Error: $e");
//   //   }
//   // }
// }

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ecomercy/dio/models/productis_model.dart'; // Adjust import according to your directory structure

class ApiProvider {
  final String baseUrl = 'https://dummyjson.com';

  // Method to fetch products
  Future<Ecomercy?> getProducts() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      final dio = Dio();
      Response response = await Dio().get(
        "$baseUrl/products",

        // queryParameters: {
        //   "select": "id,title,description,category,price,thumbnail"
        // },
        // options: Options(
        //     headers: {
        //       "Authorization": "Bearer ${prefs.getString("userToken") ?? ''}"
        //     }
        // ),
      );

      if (response.statusCode == 200) {
        return Ecomercy.fromJson(response.data);
      } else {
        print("Failed to fetch products");
        return null;
      }
    } catch (e) {
      if(e is DioException){
        print(e.response?.data);
      }
      // print("Error: $e");
      return null;
    }
  }

  // Method to fetch products by category
  Future<Ecomercy?> getProductsByCategory(String category) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      Response response = await Dio().get(
        "$baseUrl/products",
        // queryParameters: {
        //   "category": category, // Filter by category
        //   "select": "id,title,description,category,price,thumbnail"
        // },
        // options: Options(
        //     headers: {
        //       "Authorization": "Bearer ${prefs.getString("userToken") ?? ''}"
        //     }
        // ),
      );

      if (response.statusCode == 200) {
        return Ecomercy.fromJson(response.data);
      } else {
        print("Failed to fetch products for category: $category");
        return null;
      }
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }

  // Method to fetch categories
  Future<List<dynamic>?> getCategories() async {
    try {
      Response response = await Dio().get("$baseUrl/products/category-list");

      if (response.statusCode == 200) {
        return response.data as List<dynamic>;
      } else {
        print("Failed to fetch categories");
        return null;
      }
    } catch (e) {
      print("Error fetching categories: $e");
      return null;
    }
  }

  // Method to handle user login
  Future<void> userLogin({required String userName, required String password}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    FormData userData = FormData.fromMap({
      "username": userName,
      "password": password
    });

    try {
      Response response = await Dio().post("$baseUrl/auth/login", data: userData);
      await prefs.setString('userToken', response.data['token']);
    } catch (e) {
      print("Login Error: $e");
    }
  }
}
