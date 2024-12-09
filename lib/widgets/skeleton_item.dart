import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SkeletonItemView extends StatelessWidget {
  const SkeletonItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      gradient: LinearGradient(colors: [
        Colors.grey.shade200,
        Colors.grey.shade300,
        Colors.grey.shade200,
      ]),
      child: SingleChildScrollView(
        child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 6,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: SizedBox(
                width: double.infinity,
                height: 100,
                child: Row(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade50,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 150,
                          height: 10,
                          color: Colors.grey.shade50,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 240,
                          height: 15,
                          color: Colors.grey.shade300,
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Container(
                          width: 220,
                          height: 15,
                          color: Colors.grey.shade300,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: 100,
                          height: 11,
                          color: Colors.grey.shade50,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
