class Movie {
  int id;

  String deskripsi;
  String judul;
  String stock;
  String penerbit;
  String pengarang;
  double? voteAverage;
  String posterPath;
  Movie({
    required this.id,
    required this.deskripsi,
    required this.judul,
    required this.stock,
    required this.penerbit,
    required this.pengarang,
    this.voteAverage,
    required this.posterPath,
  });
}
