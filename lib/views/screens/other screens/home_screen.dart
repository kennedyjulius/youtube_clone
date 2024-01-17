import 'package:flutter/material.dart';
import 'package:youtube_clone/views/widgets/custom_sliver_appbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: CustomScrollView(
      slivers: 
      [
        CustomSliverAppBar(),
      ],
     ),
    );
  }
}
