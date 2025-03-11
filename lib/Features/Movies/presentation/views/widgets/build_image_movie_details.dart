import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../../Core/utils/app_constant.dart';

class BuildImageMovieDetails extends StatelessWidget {
  const BuildImageMovieDetails({
    super.key, required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FadeIn(
          duration: const Duration(milliseconds: 500),
          child: ShaderMask(
            shaderCallback: (rect) {
              return const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black,
                  Colors.black,
                  Colors.transparent,
                ],
                stops: [0.0, 0.5, 1.0, 1.0],
              ).createShader(
                Rect.fromLTRB(0.0, 0.0, rect.width, rect.height),
              );
            },
            blendMode: BlendMode.dstIn,
            child: CachedNetworkImage(
              height: MediaQuery.of(context).size.height*0.4,
              width: MediaQuery.of(context).size.width,
              imageUrl: AppConstant.imageUrl(image),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 40.0, // Adjust as necessary
          left: 16.0, // Adjust as necessary
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () {
              Navigator.of(context).pop(); // Navigate back
            },
          ),
        ),
      ],
    );
  }
}
