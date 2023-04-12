import 'package:drop_cap_text/drop_cap_text.dart';
import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

import '../constants/constants.dart';
import 'ancient_egypt_info.dart';

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
            backgroundColor: Colors.black,
            // backgroundColor: Colors.transparent,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                title,
                style: const TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'SortsMillGoudy',
                ),
              ),
              background: Container(
                decoration: const BoxDecoration(
                  gradient: RadialGradient(
                    radius: 1.5,
                    colors: [
                      // Color(0xff3ba9da),
                      // Color(0xFF0275b8),
                      Colors.black,
                      Colors.black,
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
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: DropCapText(
                          item1,
                          style: const TextStyle(
                            height: 1.4,
                            fontSize: 19,
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'SortsMillGoudy',
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      AncientEgyptInfo(items: item2),
                      const SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            path,
                            width: 200,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      AncientEgyptInfo(items: item3),
                      const SizedBox(
                        height: 20,
                      ),
                      AncientEgyptInfo(items: item4),
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


