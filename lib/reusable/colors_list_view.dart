import 'package:flutter/cupertino.dart';
import 'package:notes_app/reusable/color_item.dart';

class ColorsListView extends StatelessWidget {
  const ColorsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38*2,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => const ColorItem(),
          separatorBuilder: (context, index) => const SizedBox(
                width: 10.0,
              ),
          itemCount: 10),
    );
  }
}
