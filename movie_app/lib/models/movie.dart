class Search {
  String? title;
  String? year;
  String? imdbID;
  String? type;
  String? poster;

  Search({
    this.title,
    this.year,
    this.imdbID,
    this.poster,
    this.type,
  });

  factory Search.fromJson(Map<String, dynamic> json) {
    return Search(
        title: json['Title'],
        year: json['Year'],
        imdbID: json['imdbID'],
        type: json['Type'],
        poster: json['Poster']);
  }
}
