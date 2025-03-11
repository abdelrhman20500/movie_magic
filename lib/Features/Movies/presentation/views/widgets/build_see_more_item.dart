import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_magic/Core/utils/app_constant.dart';
import 'package:movie_magic/Features/Movies/presentation/views/movie_details_screen.dart';
import 'build_row_details.dart';

class BuildSeeMoreItem extends StatelessWidget {
  const BuildSeeMoreItem({
    super.key,
    required this.image,
    required this.title,
    required this.rating,
    required this.overview,
    required this.id
  });

  final String image;
  final String title;
  final double rating;
  final String overview;
  final int id;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>
        MovieDetailsScreen(id: id)));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade900,
          borderRadius: BorderRadius.circular(22),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                child: CachedNetworkImage(
                  imageUrl: AppConstant.imageUrl(image),
                  fit: BoxFit.cover,
                  height: 130,
                  width: 120,
                  placeholder: (context, url) => Container(
                    color: Colors.grey[300], // Placeholder color
                    child: const Center(child: CircularProgressIndicator()),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              const SizedBox(width: 16),  // Added spacing between image and text
              Expanded(  // Use Expanded to allow the Column to take available space
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 2.0,
                            horizontal: 8.0,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey[800],
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: const Text(
                            "2022",
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.white70,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        BuildRowDetails(voteAverage: rating),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      overview,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}