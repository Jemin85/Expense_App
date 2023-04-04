import 'package:flutter/material.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/widgets/story_view.dart';

class StroryView extends StatefulWidget {
  const StroryView({Key? key}) : super(key: key);

  @override
  State<StroryView> createState() => _StroryViewState();
}

class _StroryViewState extends State<StroryView> {
  final StoryController controller = StoryController();

  @override
  Widget build(BuildContext context) {
    return StoryView(
      controller: controller,
      storyItems: [
        StoryItem.text(
          shown: true,
          title:
              "Hello world!\nHave a look at some great Ghanaian delicacies. I'm sorry if your mouth waters. \n\nTap!",
          backgroundColor: const Color(0xffFD3C4A),
          roundedTop: true,
        ),
        StoryItem.text(
          title:
              "Hello world!\nHave a look at some great Ghanaian delicacies. I'm sorry if your mouth waters. \n\nTap!",
          backgroundColor: const Color(0xff00A86B),
          roundedTop: true,
        ),
        StoryItem.inlineImage(
          url:
              "https://image.ibb.co/cU4WGx/Omotuo-Groundnut-Soup-braperucci-com-1.jpg",
          controller: controller,
          caption: const Text(
            "Omotuo & Nkatekwan; You will love this meal if taken as supper.",
            style: TextStyle(
              color: Colors.white,
              backgroundColor: Colors.black54,
              fontSize: 17,
            ),
          ),
        ),
        StoryItem.inlineImage(
          url: "https://media.giphy.com/media/5GoVLqeAOo6PK/giphy.gif",
          controller: controller,
          caption: const Text(
            "Hektas, sektas and skatad",
            style: TextStyle(
              color: Colors.white,
              backgroundColor: Colors.black54,
              fontSize: 17,
            ),
          ),
        )
      ],
    );
  }
}
