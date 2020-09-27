import 'dart:convert';

class Ad {
  final String id;
  final String author;
  final String authorId;
  final bool hasImage;
  final String thumbUrl;
  final String body;
  final List<String> imagesList;
  final String city;
  final String title;
  final String commentCount;
  final String contact;
  final String contactMobile;
  final bool commentStatus;
  final String date;

  const Ad({
    this.id,
    this.author,
    this.authorId,
    this.hasImage,
    this.thumbUrl,
    this.body,
    this.imagesList,
    this.city,
    this.title,
    this.commentCount,
    this.contact,
    this.contactMobile,
    this.commentStatus,
    this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'author': author,
      'author_id': authorId,
      'hasImage': hasImage ? 1 : 0,
      'thumb_url': thumbUrl,
      'body': body,
      'imagesList': imagesList,
      'city': city,
      'title': title,
      'comment_count': commentCount,
      'id': id,
      'contact': contact,
      'contact_mobile': contactMobile,
      'comment_status': commentStatus ? 1 : 0,
      'date': date,
    };
  }

  factory Ad.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Ad(
      author: map['author'],
      authorId: map['author_id'],
      hasImage: map['has_image'] == 1 ? true : false,
      thumbUrl: map['thumb_url'],
      body: map['body'],
      imagesList: List<String>.from(map['imageslist'].map((x) => x)),
      city: map['city'],
      title: map['title'],
      commentCount: map['comment_count'],
      id: map['id'],
      contact: map['contact'],
      contactMobile: map['contact_mobile'],
      commentStatus: map['comment_status'] == 1 ? true : false,
      date: map['date'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Ad.fromJson(String source) => Ad.fromMap(json.decode(source));
}
