import 'package:flutter/cupertino.dart';
import 'package:notes_app/constants/constants.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/reusable/color_item.dart';

class ColorsListView extends StatefulWidget {
  const ColorsListView({super.key});

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  late bool isSelected;
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => GestureDetector(
          child: ColorItem(
              isSelected: currentIndex == index, color: kColors[index]),
          onTap: () {
            AddNoteCubit.getOb(context).color = kColors[index];
            currentIndex = index;
            setState(() {});
          },
        ),
        separatorBuilder: (context, index) => const SizedBox(
          width: 10.0,
        ),
        itemCount: kColors.length,
      ),
    );
  }
}
