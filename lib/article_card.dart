import 'package:flutter/material.dart';

class ArticleCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String date;
  final Color color;

  const ArticleCard(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.date,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.5,
      margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: InkWell(
        onTap: () {
          print('Card tapped.');
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Container(
                width: 2.0,
                height: 80.0,
                color: color,
                margin: const EdgeInsets.only(right: 8.0),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      date,
                      style: TextStyle(color: Colors.grey[700], fontSize: 12.0),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      subtitle,
                      style: TextStyle(color: Colors.grey[900], fontSize: 14.0),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
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
