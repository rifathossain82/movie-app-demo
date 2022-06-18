class MovieData {
  List<Movie>? movie;
  String? totalResults;
  String? response;

  MovieData({this.movie, this.totalResults, this.response});

  MovieData.fromJson(Map<dynamic, dynamic> json) {
    if (json['Search'] != null) {
      movie = <Movie>[];
      json['Search'].forEach((v) {
        movie!.add(Movie.fromJson(v));
      });
    }
    totalResults = json['totalResults'];
    response = json['Response'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    if (this.movie != null) {
      data['Search'] = this.movie!.map((v) => v.toJson()).toList();
    }
    data['totalResults'] = this.totalResults;
    data['Response'] = this.response;
    return data;
  }
}

class Movie {
  String? title;
  String? year;
  String? imdbID;
  String? type;
  String? poster;

  Movie({this.title, this.year, this.imdbID, this.type, this.poster});

  Movie.fromJson(Map<dynamic, dynamic> json) {
    title = json['Title'] ?? '';
    year = json['Year'] ?? '';
    imdbID = json['imdbID'] ?? '';
    type = json['Type'] ?? '';
    poster = json['Poster'] ?? '';
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    data['Title'] = this.title;
    data['Year'] = this.year;
    data['imdbID'] = this.imdbID;
    data['Type'] = this.type;
    data['Poster'] = this.poster;
    return data;
  }
}
