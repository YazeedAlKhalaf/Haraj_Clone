import 'package:flutter/material.dart';
import 'package:haraj_clone/src/app/models/ad.model.dart';
import 'package:haraj_clone/src/ui/global/ui_helpers.dart';
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
        return Skeleton(
          isBusy: model.isBusy,
          body: Column(
            children: <Widget>[
              Text(
                'إعلانات حراج',
                style: Theme.of(context).textTheme.headline5,
              ),
              Expanded(
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
                              await model.navigateToAdView(
                                ad: ad,
                              );
                            },
                          );
                        },
                      )
                    : Center(
                        child: CircularProgressIndicator(),
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}
