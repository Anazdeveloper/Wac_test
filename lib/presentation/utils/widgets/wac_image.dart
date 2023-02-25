import 'package:flutter/material.dart';


class WacImage extends StatelessWidget {
  final ImageProvider imageProvider;
  final double ? width, height, radius;
  final String ? loadingImage;
  final BoxFit? fit;

  WacImage({required this.imageProvider, this.width, this.height, this.radius, this.loadingImage, this.fit});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius!),
      child: FadeInImage(
        image: imageProvider,
        placeholder:AssetImage(loadingImage ?? 'assets/images/profile_image.png'),
        fit: BoxFit.fill,
        width: width,
        height: height,
        imageErrorBuilder: (context, exception, stackTrace) {
          return Image.asset(loadingImage??
              'assets/images/profile_image.png',
            width: width,
            height: height,
            fit: fit??BoxFit.fill,
          );
        },
      ),
    );
  }
}