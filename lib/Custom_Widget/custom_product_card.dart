import 'package:api_demo/Custom_Widget/custom_text.dart';
import 'package:flutter/material.dart';

class CustomProductCard extends StatelessWidget {
  final String image;
  final String tittle;
  const CustomProductCard(
      {super.key, required this.image, required this.tittle});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
      child: Card(
        margin: const EdgeInsets.all(3),
        color: Theme.of(context).colorScheme.primary,
        elevation: 2,
        shadowColor: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 120,
                width: double.infinity,
                padding: const EdgeInsets.all(3),
                margin:const  EdgeInsets.only(bottom: 3),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withOpacity(0.3),
                    image: DecorationImage(
                        image: NetworkImage(image), fit: BoxFit.cover)),
              ),
              CustomText(
                  text: tittle,
                  max: 2,
                  textAlign: TextAlign.left,
                  textOverflow: TextOverflow.ellipsis,
                  size: 12,
                  color: Theme.of(context).colorScheme.onSurface,
                  fontWeight: FontWeight.w400),

            ],
          ),
        ),
      ),
    );
  }
}
