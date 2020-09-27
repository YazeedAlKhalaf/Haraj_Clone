import 'package:flutter/material.dart';
import 'package:haraj_clone/src/app/models/ad.model.dart';
import 'package:haraj_clone/src/ui/global/ui_helpers.dart';
import 'package:haraj_clone/src/ui/views/ad/ad_view.dart';
import 'package:haraj_clone/src/ui/widgets/dumb/responsive.dart';
import 'package:stacked/stacked.dart';
import 'package:haraj_clone/src/ui/widgets/dumb/skeleton.dart';

import './home_view_model.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      onModelReady: (HomeViewModel model) async {
        await model.getAds();
      },
      builder: (
        BuildContext context,
        HomeViewModel model,
        Widget child,
      ) {
        _buildLeftSide() {
          return Expanded(
            child: model.adsList != null && model.adsList.isNotEmpty
                ? ListView.builder(
                    itemCount: model.adsList.length ?? 0,
                    itemBuilder: (BuildContext context, int index) {
                      Ad ad = model.adsList[index];
                      return ListTile(
                        leading: ad.hasImage && ad.imagesList.isNotEmpty
                            ? Image.network(
                                ad.imagesList[0],
                                width: blockSize(context) * 5,
                              )
                            : SizedBox.shrink(),
                        title: Text(
                          ad.title,
                          maxLines: 1,
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              ad.author,
                              maxLines: 1,
                              overflow: TextOverflow.clip,
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                            Text(
                              ad.city,
                              maxLines: 1,
                              overflow: TextOverflow.clip,
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                          ],
                        ),
                        onTap: () async {
                          if (Responsive.isMobile(context)) {
                            await model.navigateToAdView(
                              ad: ad,
                            );
                          } else {
                            model.setCurrentRightSideIndex(index);
                          }
                        },
                      );
                    },
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  ),
          );
        }

        return Skeleton(
          isBusy: model.isBusy,
          body: model.adsList.isEmpty
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'إعلانات حراج',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    verticalSpaceSmall(context),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            child: _buildLeftSide(),
                          ),
                          Responsive.isMobile(context)
                              ? SizedBox.shrink()
                              : VerticalDivider(),
                          Responsive.isMobile(context)
                              ? SizedBox.shrink()
                              : Expanded(
                                  child: AdView(
                                    ad: model
                                        .adsList[model.currentRightSideIndex],
                                    showAppBar: Responsive.isMobile(context),
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }
}
