import 'package:flutter/material.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      leadingWidth: 120,
      leading: Padding(
        padding: const EdgeInsets.only(left: 10, top: 10),
        child: Image.asset("assets/youtube.png"),
      ),
      actions: [
        // cast icon button
        IconButton(onPressed: () {}, icon: Icon(Icons.cast)),
        SizedBox(
          width: 10,
        ),
        //notifications Icons Button
        IconButton(onPressed: () {}, icon: Icon(Icons.notifications_outlined)),
        //Search Icon
        SizedBox(
          width: 10,
        ),
        IconButton(onPressed: () {}, icon: Icon(Icons.search)),

        //circular Avatar
        SizedBox(
          width: 10,
        ),
        IconButton(
          onPressed: () {},
          icon: CircleAvatar(
            onForegroundImageError: (exception, stackTrace) =>
                Icon(Icons.error_outline),
            foregroundImage: NetworkImage(
                "https://plus.unsplash.com/premium_photo-1671656349322-41de944d259b?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fHByb2ZpbGUlMjBwaWN0dXJlfGVufDB8fDB8fHww"),
          ),
        ),
      ],
    );
  }
}
