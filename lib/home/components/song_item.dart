import 'package:flutter/material.dart';
import 'package:my_tones/model/music_model.dart';

class CustomSong extends StatelessWidget {
  const CustomSong({
    Key? key,
    required this.song,
    this.onTap,
  }) : super(key: key);
  final Song song;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              height: 80.0,
              width: 80.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  16.0,
                ),
                image: DecorationImage(
                  image: NetworkImage(
                    song.coverUrl,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  song.title,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Text(
                  song.singer,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
