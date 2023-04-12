import 'package:drop_cap_text/drop_cap_text.dart';
import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class InteractiveSliverAppBarScreen extends StatelessWidget {
  final String title;
  final String modelPath;
  final String item1;
  final String item2;
  final String item3;
  final String item4;
  final String path;

  const InteractiveSliverAppBarScreen(
      {super.key,
      required this.title,
      required this.modelPath,
      required this.item1,
      required this.item2,
      required this.item3,
      required this.item4,
      required this.path});

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();

    bool showTitle = false;

    scrollController.addListener(() {
      if (scrollController.offset > 100 && !showTitle) {
        showTitle = true;
      } else if (scrollController.offset < 100 && showTitle) {
        showTitle = false;
      }
    });

    return Scaffold(
      body: CustomScrollView(
        controller: scrollController,
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.transparent,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(title),
              background: Container(
                decoration: const BoxDecoration(
                  gradient: RadialGradient(
                    radius: 1.5,
                    colors: [
                      Color(0xff3ba9da),
                      Color(0xFF0275b8),
                    ],
                    stops: [0.0, 0.5],
                  ),
                ),
                child: ModelViewer(
                  src: modelPath,
                  autoRotate: true,
                  alt: 'model',
                  cameraControls: true,
                ),
              ),
            ),
            floating: false,
            pinned: true,
            expandedHeight: MediaQuery.of(context).size.height * 0.450,
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              const SizedBox(
                height: 20,
              ),
              Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Column(
                    children: [
                      DropCapText(item1),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(item2),
                      const SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Image.asset(
                          path,
                          width: 200, // set the desired width
                          height: 200, // set the desired height
                          fit: BoxFit.cover, // set the image fit
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(item3),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(item4),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
