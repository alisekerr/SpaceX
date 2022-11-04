import 'package:flutter/material.dart';

class SpaceXImageNetwork extends StatelessWidget {
  final String? imageUrl;
  const SpaceXImageNetwork({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl ?? "https://via.placeholder.com/150",
      errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
      frameBuilder: (_, image, loadingBuilder, __) {
        if (loadingBuilder == null) {
          return const SizedBox(
            child: Center(
                child: CircularProgressIndicator(
              color: Colors.black,
            )),
          );
        }
        return image;
      },
      loadingBuilder: (BuildContext context, Widget image,
          ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) return image;
        return SizedBox(
          child: Center(
            child: CircularProgressIndicator(
              color: Colors.black,
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!
                  : null,
            ),
          ),
        );
      },
    );
  }
}
