import 'package:flutter/cupertino.dart';
import 'package:notes_app/reusable/color_item.dart';

class ColorsListView extends StatefulWidget {
  const ColorsListView({super.key});

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  late bool isSelected;
  int currentIndex = 0;
  List<Color> colors = const [
    Color(0xffFFC6AC),
    Color(0xffFFF6DC),
    Color(0xffC4C1A4),
    Color(0xff9E9FA5),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => GestureDetector(
          child: ColorItem(
              isSelected: currentIndex == index, color: colors[index]),
          onTap: () {
            currentIndex = index;
            setState(() {});
          },
        ),
        separatorBuilder: (context, index) => const SizedBox(
          width: 10.0,
        ),
        itemCount: colors.length,
      ),
    );
  }
}
