import 'package:flutter/material.dart';
import 'package:connect/widgets/custom_widget.dart';

class PostContent extends StatelessWidget {
  final List<Map<String, dynamic>> points;
  final String myString;

  const PostContent({required this.points, required this.myString, Key? key})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RegExp exp = RegExp(r'"(.*?)"');
    final matches = exp.allMatches(myString);
    List<Widget> contentWidgets = [];

    int currentIndex = 0;

    for (final Match match in matches) {
      int start = match.start;
      int end = match.end;

      if (currentIndex < start) {
        contentWidgets.add(
          CustomText(
            content: "    ${myString.substring(currentIndex, start)}",

            color: Colors.black,
            fontSize: 20,
          ),
        );
      }

      contentWidgets.add(
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 4,
                // height: 50,
                color: Color(0XFF1B5E20),
                margin: const EdgeInsets.only(right: 8),
              ),
              Expanded(
                child: CustomText(
                  content: "    ${match.group(1) ?? ''}",
          
                  color: Color(0XFF1B5E20),
          
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      );

      points.add({"start": start, "end": end, "color": "blue"});
      currentIndex = end;
    }

    // Remaining text after the last quote
    if (currentIndex < myString.length) {
      contentWidgets.add(
        CustomText(
          content: myString.substring(currentIndex),
          color: Colors.black,
          fontSize: 20,
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: contentWidgets,
      ),
    );
  }
}
