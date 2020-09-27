import 'package:flutter/material.dart';
import 'package:haraj_clone/src/app/models/ad.model.dart';
import 'package:haraj_clone/src/ui/global/ui_helpers.dart';
import 'package:haraj_clone/src/ui/widgets/dumb/photos_slider.dart';
import 'package:stacked/stacked.dart';
import 'package:haraj_clone/src/ui/widgets/dumb/skeleton.dart';

import './ad_view_model.dart';

class AdView extends StatelessWidget {
  final Ad ad;
  final bool showAppBar;

  const AdView({
    Key key,
    @required this.ad,
    this.showAppBar = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AdViewModel>.reactive(
      viewModelBuilder: () => AdViewModel(),
      builder: (
        BuildContext context,
        AdViewModel model,
        Widget child,
      ) {
        _buildPhotoSlider() {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: ad.imagesList.isEmpty
                    ? Center(
                        child: Text(
                          'لم يزودنا المعلن بصور',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      )
                    : PhotosSlider(
                        photosList: ad.imagesList,
                      ),
              ),
            ],
          );
        }

        _buildTitle() {
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                ad.title,
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          );
        }

        _buildDescription() {
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                ad.body.trim(),
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ],
          );
        }

        _buildContactInfo() {
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                'رقم الجوال: ',
                style: Theme.of(context).textTheme.headline6,
              ),
              InkWell(
                onTap: ad.contactMobile == ''
                    ? null
                    : () async {
                        await model.launchMobileNumber(
                          mobileNumber: ad.contactMobile,
                        );
                      },
                child: Text(
                  ad.contactMobile == ''
                      ? 'لم يزود المعلن رقم جوال'
                      : ad.contactMobile,
                  textDirection: TextDirection.ltr,
                  style: Theme.of(context).textTheme.headline6.copyWith(
                        color: ad.contactMobile == ''
                            ? null
                            : Theme.of(context).accentColor,
                      ),
                ),
              ),
            ],
          );
        }

        _buildAuthorInfo() {
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'المعلن: ' + ad.author,
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  Text(
                    'المدينة: ' + ad.city,
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ],
              ),
            ],
          );
        }

        return Directionality(
          textDirection: TextDirection.rtl,
          child: Skeleton(
            isBusy: model.isBusy,
            bodyPadding: const EdgeInsets.all(0),
            body: CustomScrollView(
              slivers: [
                SliverAppBar(),
                SliverToBoxAdapter(
                  child: Container(
                    padding: EdgeInsets.all(blockSize(context) * 2),
                    child: Column(
                      children: <Widget>[
                        _buildPhotoSlider(),
                        verticalSpaceXSmall(context),
                        _buildTitle(),
                        Divider(),
                        _buildAuthorInfo(),
                        Divider(),
                        _buildDescription(),
                        Divider(),
                        _buildContactInfo(),
                        Divider(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
