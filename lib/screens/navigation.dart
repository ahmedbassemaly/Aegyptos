import 'package:flutter/material.dart';
import 'package:kemet/screens/user_choice.dart';

import 'info.dart';

class SwipeScreen extends StatelessWidget {
  const SwipeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: <Widget>[
          UserChoice(),
          InteractiveSliverAppBarScreen(
            title: 'Nefertiti',
            modelPath: 'assets/models/nefertiti.glb',
            items:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec porta vel diam sed auctor. Nullam quis massa at quam pharetra gravida. Sed ut mi id erat varius imperdiet imperdiet ut sapien. Sed quis porta nisl, vitae efficitur erat. Morbi bibendum accumsan eros sed fringilla. Nunc eu eleifend mi. Sed imperdiet consectetur urna, vulputate porta massa scelerisque non.Ut cursus laoreet urna a ornare. Etiam imperdiet tempor ipsum a porta. Aliquam imperdiet mauris sit amet sapien aliquet,',
            path: 'assets/images/1500_int-nefertiti-1205.jpg',
          ),
          InteractiveSliverAppBarScreen(
            title: 'Tutankhamun',
            modelPath: 'assets/models/tutankhamun_gold_mask.glb',
            items:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec porta vel diam sed auctor. Nullam quis massa at quam pharetra gravida. Sed ut mi id erat varius imperdiet imperdiet ut sapien. Sed quis porta nisl, vitae efficitur erat. Morbi bibendum accumsan eros sed fringilla. Nunc eu eleifend mi. Sed imperdiet consectetur urna, vulputate porta massa scelerisque non.Ut cursus laoreet urna a ornare. Etiam imperdiet tempor ipsum a porta. Aliquam imperdiet mauris sit amet sapien aliquet, quis congue sem vehicula. Nunc finibus a nisl vel fringilla. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed ut magna ut libero congue varius at at leo. Fusce lacinia a mauris eu placerat. Pellentesque blandit lorem in bibendum lacinia.Aenean sit amet massa commodo, vestibulum justo quis, interdum lacus. Vivamus quis hendrerit velit. Nulla ut purus at urna feugiat iaculis quis at quam. Donec eros est, dignissim quis pretium in, suscipit in eros. Morbi porta sagittis dui, vel pellentesque diam pellentesque vitae. Vivamus arcu arcu, vehicula et pellentesque ac, cursus sed nunc. Nullam vestibulum quam in ex hendrerit rhoncus. Nunc sed rhoncus arcu. Duis consequat dignissim ligula, sed suscipit massa posuere ut. Fusce scelerisque, tellus eu maximus pharetra, sapien sem suscipit felis, nec imperdiet tellus augue vel nibh. Curabitur efficitur vulputate leo, vel blandit magna auctor at. Nam quis hendrerit tortor. Quisque vitae sem sit amet mauris posuere cursus ultrices at diam. Sed congue ac elit vel convallis.',
            path: 'assets/images/tutankhamun.jpg',
          ),
          InteractiveSliverAppBarScreen(
            title: 'Rosetta Stone',
            modelPath: 'assets/models/rosetta_stone.glb',
            items:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec porta vel diam sed auctor. Nullam quis massa at quam pharetra gravida. Sed ut mi id erat varius imperdiet imperdiet ut sapien. Sed quis porta nisl, vitae efficitur erat. Morbi bibendum accumsan eros sed fringilla. Nunc eu eleifend mi. Sed imperdiet consectetur urna, vulputate porta massa scelerisque non.Ut cursus laoreet urna a ornare. Etiam imperdiet tempor ipsum a porta. Aliquam imperdiet mauris sit amet sapien aliquet, quis congue sem vehicula. Nunc finibus a nisl vel fringilla. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed ut magna ut libero congue varius at at leo. Fusce lacinia a mauris eu placerat. Pellentesque blandit lorem in bibendum lacinia.Aenean sit amet massa commodo, vestibulum justo quis, interdum lacus. Vivamus quis hendrerit velit. Nulla ut purus at urna feugiat iaculis quis at quam. Donec eros est, dignissim quis pretium in, suscipit in eros. Morbi porta sagittis dui, vel pellentesque diam pellentesque vitae. Vivamus arcu arcu, vehicula et pellentesque ac, cursus sed nunc. Nullam vestibulum quam in ex hendrerit rhoncus. Nunc sed rhoncus arcu. Duis consequat dignissim ligula, sed suscipit massa posuere ut. Fusce scelerisque, tellus eu maximus pharetra, sapien sem suscipit felis, nec imperdiet tellus augue vel nibh. Curabitur efficitur vulputate leo, vel blandit magna auctor at. Nam quis hendrerit tortor. Quisque vitae sem sit amet mauris posuere cursus ultrices at diam. Sed congue ac elit vel convallis.',
            path: 'assets/images/rosetta-stone-at-the-british-museum.jpg',
          ),
        ],
      ),
    );
  }
}
