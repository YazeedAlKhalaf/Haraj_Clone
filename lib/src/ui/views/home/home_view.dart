import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:haraj_clone/src/ui/widgets/dumb/skeleton.dart';

import './home_view_model.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (
        BuildContext context,
        HomeViewModel model,
        Widget child,
      ) {
        return Skeleton(
          isBusy: model.isBusy,
          body: Center(
            child: Text(
              'HomeView',
            ),
          ),
        );
      },
    );
  }
}
