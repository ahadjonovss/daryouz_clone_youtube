import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class defaultArticleShimmer extends StatefulWidget {
  const defaultArticleShimmer({Key? key}) : super(key: key);

  @override
  State<defaultArticleShimmer> createState() => _defaultArticleShimmerState();
}

class _defaultArticleShimmerState extends State<defaultArticleShimmer> {
  @override
  Widget build(BuildContext context) {
    var article;
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.withOpacity(0.3)),
        color: Colors.white,
      ),
      height: 320,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              padding: EdgeInsets.all(12),
              color: Colors.white,
              height: 200,
              width: double.infinity,
            ),
          ),
          Container(
            height: 118,
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.pink,
                        ),
                        margin: EdgeInsets.only(right: 6),
                        height: 16,
                        width: 80,
                      ),
                    ),
                  ],
                ),
                Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                      color: Colors.pink,
                    ),
                    margin: EdgeInsets.only(right: 6),
                    height: 20,
                    width: double.infinity,
                  ),
                ),
                Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                      color: Colors.pink,
                    ),
                    margin: EdgeInsets.only(right: 6),
                    height: 20,
                    width: double.infinity,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                    Row(
                      children:  [
                        Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                              color: Colors.pink,
                            ),
                            margin: EdgeInsets.only(right: 6),
                            height: 16,
                            width: 80,

                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                              color: Colors.pink,
                            ),
                            margin: EdgeInsets.only(right: 6),
                            height: 16,
                            width: 30,

                          ),
                        ),
                      ],
                    )
                  ],
                ),

              ],
            ),
          )
        ],
      ),
    );
  }
}
