import 'package:flutter/material.dart';
import 'package:video_app/stats_card.dart';
import 'package:video_app/title_card.dart';
import 'package:video_app/video_list.dart';
import 'package:video_app/video_properties.dart';
import 'package:video_player/video_player.dart';
import 'package:timeago/timeago.dart' as timeago;

class HotPage extends StatefulWidget {
  final List<TitleCard> title = [];
  final List<StatsCard> stats = [];
  final List<VideoList> videos = [];

  HotPage({Key? key}) : super(key: key);

  @override
  _HotPageState createState() => _HotPageState();
}

class _HotPageState extends State<HotPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: CircleAvatar(
                            backgroundImage:
                                NetworkImage(title[index].userImage),
                          ),
                        ),
                        const SizedBox(width: 15.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${title[index].videoTitle} | '
                              '${timeago.format(title[index].timestamp)}',
                              style: const TextStyle(
                                fontSize: 18.0,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(height: 4.0),
                            Text(
                              title[index].username,
                              style: const TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Icons.more_vert_outlined,
                      size: 30.0,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(4.0),
              height: 325,
              child: VideoListItem(
                videoPlayerController:
                    VideoPlayerController.asset(videos[index].asset),
                looping: false,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: const CircleAvatar(
                            backgroundColor: Colors.indigo,
                            child: Icon(
                              Icons.thumb_up_alt,
                              color: Colors.white,
                              size: 18,
                            ),
                            radius: 12,
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        Text(
                          stats[index].likes.toString(),
                          style: const TextStyle(
                            fontSize: 17.0,
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        GestureDetector(
                          onTap: () {},
                          child: const CircleAvatar(
                            backgroundColor: Colors.indigo,
                            child: Icon(
                              Icons.thumb_down_alt,
                              color: Colors.white,
                              size: 18,
                            ),
                            radius: 12,
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        Text(
                          stats[index].dislikes.toString(),
                          style: const TextStyle(
                            fontSize: 17.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 100.0),
                  Container(
                    child: Text(
                      '${stats[index].comments.toString()} comments • '
                      '${stats[index].shares.toString()} shares',
                      style: const TextStyle(
                        fontSize: 17.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
              child: Center(
                child: Container(
                  margin:
                      const EdgeInsetsDirectional.only(start: 1.0, end: 1.0),
                  height: 5.0,
                  color: Colors.black,
                ),
              ),
            )
          ],
        );
      },
      itemCount: videos.length,
    );
  }
}
