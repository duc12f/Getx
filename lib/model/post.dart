class Post {
  final String title;
  final String body;
  final List<String> tags;
  final Reactions reactions;
  final int views;

  Post({
    required this.title,
    required this.body,
    required this.tags,
    required this.reactions,
    required this.views,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      title: json['title'],
      body: json['body'],
      tags: List<String>.from(json['tags']),
      reactions: Reactions.fromJson(json['reactions']),
      views: json['views'],
    );
  }
}

class Reactions {
  final int likes;
  final int dislikes;

  Reactions({required this.likes, required this.dislikes});

  factory Reactions.fromJson(Map<String, dynamic> json) {
    return Reactions(
      likes: json['likes'],
      dislikes: json['dislikes'],
    );
  }
}
