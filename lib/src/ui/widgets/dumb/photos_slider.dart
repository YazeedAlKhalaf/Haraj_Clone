import 'package:flutter/material.dart';

import 'package:haraj_clone/src/ui/global/ui_helpers.dart';

class PhotosSlider extends StatefulWidget {
  final List<String> photosList;

  const PhotosSlider({
    Key key,
    @required this.photosList,
  }) : super(key: key);

  @override
  _PhotosSliderState createState() => _PhotosSliderState();
}

class _PhotosSliderState extends State<PhotosSlider> {
  final PageController photosPageController = PageController();

  int _selectedPhotoIndex = 0;
  void setSelectedPhotoIndex(int newValue) {
    setState(() {
      _selectedPhotoIndex = newValue;
    });
  }

  Widget _buildSelectedPhoto() {
    return Container(
      height: 200,
      child: PageView.builder(
        controller: photosPageController,
        itemCount: widget.photosList.length,
        onPageChanged: (int index) {
          if (_selectedPhotoIndex != index) {
            setSelectedPhotoIndex(index);
          }
        },
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: Image.network(
              widget.photosList[index],
              height: 200,
              fit: BoxFit.contain,
            ),
          );
        },
      ),
    );
  }

  Widget _buildThumbnail({
    @required String photoUrl,
    @required int photoIndex,
  }) {
    bool isSelected = photoIndex == _selectedPhotoIndex;
    return GestureDetector(
      onTap: () {
        if (!isSelected) {
          setSelectedPhotoIndex(photoIndex);
          photosPageController.animateToPage(
            photoIndex,
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        }
      },
      child: Container(
        height: 40,
        width: 70,
        margin: const EdgeInsets.symmetric(
          horizontal: 3,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            width: isSelected ? 2 : 1,
            color: isSelected ? Theme.of(context).accentColor : Colors.grey,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Image.network(
          photoUrl,
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }

  _buildThumbnailsSlider() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      height: blockSize(context) * 5,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: widget.photosList.map((String photoUrl) {
            return _buildThumbnail(
              photoUrl: photoUrl,
              photoIndex: widget.photosList.indexOf(photoUrl),
            );
          }).toList(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _buildSelectedPhoto(),
        verticalSpaceSmall(context),
        _buildThumbnailsSlider(),
      ],
    );
  }
}
