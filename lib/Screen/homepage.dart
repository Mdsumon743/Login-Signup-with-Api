import 'package:api_demo/Controller/Api%20Controller/api_controller.dart';
import 'package:api_demo/Custom_Widget/custom_product_card.dart';
import 'package:api_demo/Custom_Widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final apiController = Get.put(ApiController());
    final background = Theme.of(context).colorScheme.surface;
    final textColor = Theme.of(context).colorScheme.onSurface;
    final button = Theme.of(context).colorScheme.onPrimary;
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: background,
        centerTitle: true,
        title: CustomText(
            text: 'Homepage',
            size: 20,
            color: textColor,
            fontWeight: FontWeight.w600),
      ),
      backgroundColor: background,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: apiController.getProductData(),
                builder: (context, snapshot) {
                  return Obx(() => apiController.isLoad.value == true
                      ? Center(
                          child: CircularProgressIndicator(
                            color: button,
                          ),
                        )
                      : GridView.builder(
                          primary: false,
                          shrinkWrap: true,
                          itemCount: apiController.productList.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisSpacing: 5,
                                  childAspectRatio: 0.8,
                                  mainAxisSpacing: 5,
                                  crossAxisCount: 2),
                          itemBuilder: (context, index) {
                            return CustomProductCard(
                              image: snapshot.data![index].images![0]
                                  .toString(),
                              tittle: snapshot.data![index].title.toString(),
                            );
                          },
                        ));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
