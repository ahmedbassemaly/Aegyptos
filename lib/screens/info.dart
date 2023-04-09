import 'package:drop_cap_text/drop_cap_text.dart';
import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class InteractiveSliverAppBarScreen extends StatelessWidget {
  final String title;
  final String modelPath;
  final String items;
  final String path;

  const InteractiveSliverAppBarScreen(
      {super.key,
      required this.title,
      required this.modelPath,
      required this.items,
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
                      DropCapText(items),
                      const SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        // child: Container(
                        //   width: 300,
                        //   height: 200,
                        //   color: Colors.amberAccent,
                        // ),
                        child: Image.asset(
                          path,
                          width: 200, // set the desired width
                          height: 200, // set the desired height
                          fit: BoxFit.cover, // set the image fit
                        ),
                      ),
                      DropCapText(items),
                      DropCapText(items),
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
