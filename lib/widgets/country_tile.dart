import 'package:flutter/material.dart';
import '../utils/constants/app_text.dart';
import 'package:african_countries_search/utils/constants/app_colours.dart';

class CountryTile extends StatelessWidget {
  const CountryTile({
    super.key,
    required this.image,
    required this.countryName,
    required this.countryCapital,
    this.onSelect,
  });

  final String image, countryName, countryCapital;
  final void Function()? onSelect;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelect,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.network(
            image != "" ? image : AppText.placeholderImage,
            width: 40.0,
            height: 40.0,
            fit: BoxFit.cover,
            loadingBuilder: (
              BuildContext context,
              Widget child,
              ImageChunkEvent? loadingProgress,
            ) {
              if (loadingProgress == null) {
                return child;
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    value:
                        loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    (loadingProgress.expectedTotalBytes ?? 1)
                                : null
                            : null,
                  ),
                );
              }
            },
            errorBuilder: (context, error, stackTrace) {
              return Image.network(
                AppText.placeholderImage,
                width: 40.0,
                height: 40.0,
                fit: BoxFit.cover,
              );
            },
          ),
          const SizedBox(width: 8.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  countryName,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                  softWrap: true,
                ),
                Text(
                  countryCapital,
                  style: const TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500,
                    color: AppColours.grey4,
                  ),
                  softWrap: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
