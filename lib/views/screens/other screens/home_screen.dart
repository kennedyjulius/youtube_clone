import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_clone/services/firebase_services.dart';
import 'package:youtube_clone/views/widgets/custom_sliver_appbar.dart';
import 'package:youtube_clone/views/widgets/video_card.dart';
import 'package:youtube_clone/views/widgets/video_player_widget.dart';

class HomeScreen extends StatefulWidget {
  final FirebaseService _firebaseService = FirebaseService();

  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  List<String> images = [
    "squat1",
    "squat2",
    "squat3",
    "squat4",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomSliverAppBar(),
          StreamBuilder(
            stream: _firestore.collection("videosCollection").snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return SliverToBoxAdapter(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else if (snapshot.hasError) {
                return SliverToBoxAdapter(
                  child: Center(
                    child: Text('Error: ${snapshot.error}'),
                  ),
                );
              } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return SliverToBoxAdapter(
                  child: Center(
                    child: Text('No videos available.'),
                  ),
                );
              } else {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return PageView.builder(
                        scrollBehavior: MaterialScrollBehavior(),
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          Container(
                            height: 200,
                            width: double.maxFinite,
                            child: VideoPlayerWidget(
                                data: snapshot.data?.docs[index]),
                          );
                        },
                      );
                    },
                    childCount: snapshot.data!.docs.length,
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
