//
// import 'package:flutter/material.dart';
// import 'package:ecomercy/dio/api_provider.dart';
// import 'package:ecomercy/dio/models/productis_model.dart'; // Ensure this import is correct
//
// class DetilesCatigores extends StatefulWidget {
//   static const String routeName = "DetilesCatigores";
//   final String category;
//
//   const DetilesCatigores({super.key, required this.category});
//
//   @override
//   _DetilesCatigoresState createState() => _DetilesCatigoresState();
// }
//
// class _DetilesCatigoresState extends State<DetilesCatigores> {
//   Ecomercy? ecomercyModel;
//
//   @override
//   void initState() {
//     super.initState();
//     _fetchProducts();
//   }
//
//   void _fetchProducts() async {
//     final apiProvider = ApiProvider();
//     final fetchedProducts = await apiProvider.getProductsByCategory(widget.category);
//     setState(() {
//       ecomercyModel = fetchedProducts;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         title: Text(
//           "Details of ${widget.category}",
//           style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//         ),
//       ),
//       body: ecomercyModel == null
//           ? Center(child: CircularProgressIndicator())
//           : ListView.builder(
//         itemCount: ecomercyModel!.products.length,
//         itemBuilder: (context, index) {
//           final product = ecomercyModel!.products[index];
//           return ListTile(
//             leading: Image.network(product.thumbnail),
//             title: Text(product.title),
//             subtitle: Text("\$${product.price}"),
//             onTap: () {
//               // Handle product tap
//             },
//           );
//         },
//       ),
//     );
//   }
// }
//

//
// import 'package:flutter/material.dart';
// import 'package:ecomercy/dio/api_provider.dart';
// import 'package:ecomercy/dio/models/productis_model.dart'; // Adjust import according to your directory structure
//
// class DetilesCatigores extends StatefulWidget {
//   static const String routeName = "DetilesCatigores";
//   final String category;
//
//   const DetilesCatigores({super.key, required this.category});
//
//   @override
//   _DetilesCatigoresState createState() => _DetilesCatigoresState();
// }
//
// class _DetilesCatigoresState extends State<DetilesCatigores> {
//   Ecomercy? ecomercyModel;
//   bool _isLoading = true;
//
//   @override
//   void initState() {
//     super.initState();
//     _fetchProducts();
//   }
//
//   void _fetchProducts() async {
//     final apiProvider = ApiProvider();
//     final fetchedProducts = await apiProvider.getProductsByCategory(widget.category);
//     setState(() {
//       ecomercyModel = fetchedProducts;
//       _isLoading = false;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         title: Text(
//           "Details of ${widget.category}",
//           style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//         ),
//       ),
//       body: _isLoading
//           ? Center(child: CircularProgressIndicator())
//           : ecomercyModel == null || ecomercyModel!.products.isEmpty
//           ? Center(child: Text("No products available in this category."))
//           : ListView.builder(
//         itemCount: ecomercyModel!.products.length,
//         itemBuilder: (context, index) {
//           final product = ecomercyModel!.products[index];
//           return ListTile(
//             leading: Image.network(product.thumbnail),
//             title: Text(product.title),
//             subtitle: Text("\$${product.price}"),
//             onTap: () {
//               // Handle product tap
//             },
//           );
//         },
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:ecomercy/dio/api_provider.dart';
import 'package:ecomercy/dio/models/productis_model.dart';

class DetilesCatigores extends StatefulWidget {
  static const String routeName = "DetilesCatigores";
  final String category;

  const DetilesCatigores({super.key, required this.category});

  @override
  _DetilesCatigoresState createState() => _DetilesCatigoresState();
}

class _DetilesCatigoresState extends State<DetilesCatigores> {
  Ecomercy? ecomercyModel;
  bool isLoading = true;
  bool hasError = false;

  @override
  void initState() {
    super.initState();
    _fetchProductsByCategory();
  }

  Future<void> _fetchProductsByCategory() async {
    final apiProvider = ApiProvider();
    final fetchedProducts = await apiProvider.getProductsByCategory(widget.category);

    if (fetchedProducts != null) {
      setState(() {
        ecomercyModel = fetchedProducts;
        isLoading = false;
      });
    } else {
      setState(() {
        hasError = true;
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Details of ${widget.category}",
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : hasError
          ? Center(child: Text("Failed to load products"))
          : ecomercyModel == null || ecomercyModel!.products.isEmpty
          ? Center(child: Text("No products available"))
          : ListView.builder(
        itemCount: ecomercyModel!.products.length,
        itemBuilder: (context, index) {
          final product = ecomercyModel!.products[index];
          return ListTile(
            leading: Image.network(product.thumbnail),
            title: Text(product.title),
            subtitle: Text(product.description),
            trailing: Text("\$${product.price}"),
          );
        },
      ),
    );
  }
}
