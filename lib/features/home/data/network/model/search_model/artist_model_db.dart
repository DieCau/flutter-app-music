class Artist {
  final int id;
  final String name;
  final String link;
  final String picture;
  final String pictureSmall;
  final String pictureMedium;
  final String pictureBig;
  final String pictureXl;
  final String tracklist;

  Artist({
    required this.id,
    required this.name,
    required this.link,
    required this.picture,
    required this.pictureSmall,
    required this.pictureMedium,
    required this.pictureBig,
    required this.pictureXl,
    required this.tracklist,
  });

  Artist copyWith({
    int? id,
    String? name,
    String? link,
    String? picture,
    String? pictureSmall,
    String? pictureMedium,
    String? pictureBig,
    String? pictureXl,
    String? tracklist,
  }) =>
      Artist(
        id: id ?? this.id,
        name: name ?? this.name,
        link: link ?? this.link,
        picture: picture ?? this.picture,
        pictureSmall: pictureSmall ?? this.pictureSmall,
        pictureMedium: pictureMedium ?? this.pictureMedium,
        pictureBig: pictureBig ?? this.pictureBig,
        pictureXl: pictureXl ?? this.pictureXl,
        tracklist: tracklist ?? this.tracklist,
      );

  factory Artist.fromJson(Map<String, dynamic> json) => Artist(
        id: json["id"] ?? 0,
        name: json["name"] ?? "no-name",
        link: json["link"] ?? "no-link",
        picture: json["picture"] ?? "no-picture",
        pictureSmall: json["picture_small"] ?? "no-picturesmall",
        pictureMedium: json["picture_medium"] ?? "no-pictrue-medium",
        pictureBig: json["picture_big"] ?? "no-picture-big",
        pictureXl: json["picture_xl"] ?? "no-picture-xl",
        tracklist: json["tracklist"] ?? "no-tracklist",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "link": link,
        "picture": picture,
        "picture_small": pictureSmall,
        "picture_medium": pictureMedium,
        "picture_big": pictureBig,
        "picture_xl": pictureXl,
        "tracklist": tracklist,
      };
}
