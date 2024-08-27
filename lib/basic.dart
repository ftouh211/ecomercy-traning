import 'package:dio/dio.dart';
import 'package:ecomercy/about_us.dart';
import 'package:ecomercy/dio/api_provider.dart';
import 'package:ecomercy/dio/models/productis_model.dart';
import 'package:ecomercy/product_detiels.dart';
import 'package:ecomercy/profiel.dart';
import 'package:ecomercy/team.dart';
import 'package:flutter/material.dart';

class Basic extends StatefulWidget {
  static const String routeName = "Basic";
  Basic({super.key});

  @override
  State<Basic> createState() => _BasicState();
}

class _BasicState extends State<Basic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF8F8F8),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 100,
        backgroundColor: Colors.transparent,
        // centerTitle: true,
        // leading: ,
        title: const Text(
          "Product List",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
        IconButton(
           icon: Icon(Icons.add_call),
           onPressed: () {
             Navigator.pushNamed(context, team.routeName);
           },
         ),
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: IconButton(
             icon: Icon(Icons.account_balance_outlined),
             onPressed: () {
               Navigator.pushNamed(context, AboutUs.routeName);
             },
           ),
        ),
        ],
      ),
      body: FutureBuilder<Ecomercy?>(
        future: ApiProvider().getProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.products.isEmpty) {
            return const Center(child: Text('No data available'));
          }

          Ecomercy ecomercyModel = snapshot.data!;

          return GridView.builder(
            padding: const EdgeInsets.all(8.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            itemCount: ecomercyModel.products.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  // Navigate to ProductDetiels page when the card is tapped
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetiels(
                        product: ecomercyModel.products[index],
                      ),
                    ),
                  );
                },
                child: Card(
                  color: Colors.white,
                  elevation: 8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AspectRatio(
                        aspectRatio: 1.5,
                        child: Image.network(
                          ecomercyModel.products[index].thumbnail,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              ecomercyModel.products[index].title,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 4.0),
                            Text(
                              "Price: \$${ecomercyModel.products[index].price}",
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
