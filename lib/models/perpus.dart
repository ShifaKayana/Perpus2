class Perpus {
  int id;
  String title;
  double? voteAverage;
  String posterPath;
  Perpus({
    required this.id,
    required this.title,
    this.voteAverage,
    required this.posterPath,
  });
}