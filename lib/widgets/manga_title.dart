import 'package:flutter/material.dart';

class BookInfoWidget extends StatelessWidget {
  final String coverImageUrl;
  final String bookTitle;
  final String bookStatus;

  const BookInfoWidget({
    super.key,
    required this.coverImageUrl,
    required this.bookTitle,
    required this.bookStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Cover Image
        Image.network(
          coverImageUrl,
          width: 100, // Adjust as needed
          height: 150, // Adjust as needed
          fit: BoxFit.cover,
        ),
        const SizedBox(
            width: 16), // Add some space between the cover image and text

        // Book Details
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                bookTitle,
                style: const TextStyle(
                  fontSize: 18, // Adjust as needed
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                  height: 8), // Add some space between title and status

              // Status
              Text(
                'Status: $bookStatus',
                style: const TextStyle(
                  fontSize: 16, // Adjust as needed
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
