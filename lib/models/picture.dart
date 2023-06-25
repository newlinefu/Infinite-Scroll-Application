class PictureCard {
  bool like;

  String id;

  String small;

  String big;

  PictureCard(
      {required this.id,
      this.like = false,
      required this.big,
      required this.small});

  @override
  bool operator ==(Object other) =>
      other is PictureCard &&
      id == other.id &&
      small == other.small &&
      like == other.like;

  @override
  int get hashCode => Object.hash(id, like, small);

  @override
  String toString() {
    return '$id: [${like ? 'LIKED' : 'NOT LIKED'}] $small';
  }

  factory PictureCard.fromJson(Map<String, dynamic> json) {
    return PictureCard(
        big: json['urls']['regular'],
        id: json['id'],
        small: json['urls']['small']);
  }
}
