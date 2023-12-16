import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie/core/utils/assets.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage(
      {super.key,
      required this.imageUrl,
      required this.height,
      required this.width});
  final String imageUrl;
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      height: height,
      width: width,
      fit: BoxFit.cover,
      filterQuality: FilterQuality.high,
     // placeholder: (context, url) =>
        //  const Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) =>
          const Center(child: Image(image: AssetImage(Assets.errorImage))),
    );
  }
}
