import 'package:flutter/material.dart';
import 'package:perpus/controllers/movie_controller.dart';
import 'package:perpus/models/movie.dart';
import 'package:perpus/widgets/bottom_nav.dart';
import 'package:perpus/widgets/modal.dart';

class MovieView extends StatefulWidget {
  MovieView({super.key});

  @override
  State<MovieView> createState() => _MovieViewState();
}

class _MovieViewState extends State<MovieView> {
  MovieController movie = MovieController();
  TextEditingController titleInput = TextEditingController();
  TextEditingController deskripsiInput = TextEditingController();
  TextEditingController judulInput = TextEditingController();
  TextEditingController penerbitInput = TextEditingController();
  TextEditingController pengarangInput = TextEditingController();
  TextEditingController stockInput = TextEditingController();
  TextEditingController gambarInput = TextEditingController();
  TextEditingController voteAverage = TextEditingController();
  final formKey = GlobalKey<FormState>();
  ModalWidget modal = ModalWidget();

  List<String> listAct = ["Ubah", "Hapus"];
  List<Movie>? film;
  int? film_id;
  getFilm() {
    setState(() {
      film = movie.movie;
    });
  }

  addFilm(data) {
    film!.add(data);
    getFilm();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getFilm();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie"),
        backgroundColor: const Color.fromARGB(255, 72, 12, 8),
        foregroundColor: Color.fromARGB(255, 255, 255, 255),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  film_id = null;
                });
                titleInput.text = '';
                judulInput.text = '';
                deskripsiInput.text = '';
                penerbitInput.text = '';
                pengarangInput.text = '';
                stockInput.text = '';
                gambarInput.text = '';
                voteAverage.text = '';
                modal.showFullModal(context, fromTambah(null));
              },
              icon: Icon(Icons.add_sharp))
        ],
      ),
      body: film != null
          ? ListView.builder(
              padding: EdgeInsets.all(12),
              itemCount: film!.length,
              itemBuilder: (context, index) {
                return Card(
                    color: const Color.fromARGB(255, 166, 136, 134),
                    child: ListTile(
                      leading: Image(
                        image: AssetImage(film![index].posterPath),
                      ),
                      title: Column(
                        children: [
                          Text(
                            film![index].judul,
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            film![index].deskripsi,
                            style: TextStyle(fontSize: 10),
                          ),
                          Text(
                            film![index].penerbit,
                            style: TextStyle(
                                fontSize: 10,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            film![index].pengarang,
                            style: TextStyle(
                                fontSize: 10,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            film![index].stock,
                            style: TextStyle(fontSize: 10),
                          ),
                          Text(film![index].voteAverage.toString()),
                        ],
                      ),
                      trailing: PopupMenuButton<String>(
                        icon: const Icon(
                          Icons.more_vert,
                          color: Color.fromARGB(255, 0, 0, 0),
                          size: 30.0,
                        ),
                        // onSelected: choiceAction,
                        itemBuilder: (BuildContext context) {
                          return listAct.map((String choice) {
                            return PopupMenuItem<String>(
                              value: choice,
                              child: Text(choice),
                              onTap: () {
                                if (choice == "Ubah") {
                                  setState(() {
                                    film_id = film![index].id;
                                  });

                                  judulInput.text = film![index].judul;
                                  deskripsiInput.text = film![index].deskripsi;
                                  penerbitInput.text = film![index].penerbit;
                                  pengarangInput.text = film![index].pengarang;
                                  stockInput.text = film![index].stock;
                                  gambarInput.text = film![index].posterPath;

                                  voteAverage.text =
                                      film![index].voteAverage.toString();
                                  modal.showFullModal(
                                      context, fromTambah(index));
                                } else if (choice == "Hapus") {
                                  film!.removeWhere(
                                      (item) => item.id == film![index].id);
                                  getFilm();
                                }
                              },
                            );
                          }).toList();
                        },
                      ),
                    ));
              })
          : Text("Data Kosong"),
      bottomNavigationBar: BottomNav(3),
    );
  }

  Widget fromTambah(index) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Text("Tambah Data"),
          TextFormField(
            controller: titleInput,
            decoration: InputDecoration(label: Text("ID")),
            validator: (value) {
              if (value!.isEmpty) {
                return 'harus diisi';
              } else {
                return null;
              }
            },
          ),
          TextFormField(
            controller: judulInput,
            decoration: InputDecoration(label: Text("Judul Buku")),
            validator: (value) {
              if (value!.isEmpty) {
                return 'harus diisi';
              } else {
                return null;
              }
            },
          ),
          TextFormField(
            controller: deskripsiInput,
            decoration: InputDecoration(label: Text("Deskripsi Buku")),
            validator: (value) {
              if (value!.isEmpty) {
                return 'harus diisi';
              } else {
                return null;
              }
            },
          ),
          TextFormField(
            controller: gambarInput,
            decoration: InputDecoration(label: Text("Gambar")),
            validator: (value) {
              if (value!.isEmpty) {
                return 'harus diisi';
              } else {
                return null;
              }
            },
          ),
          TextFormField(
            controller: penerbitInput,
            decoration: InputDecoration(label: Text("Penerbit")),
            validator: (value) {
              if (value!.isEmpty) {
                return 'harus diisi';
              } else {
                return null;
              }
            },
          ),
          TextFormField(
            controller: pengarangInput,
            decoration: InputDecoration(label: Text("Pengarang")),
            validator: (value) {
              if (value!.isEmpty) {
                return 'harus diisi';
              } else {
                return null;
              }
            },
          ),
          TextFormField(
            controller: stockInput,
            decoration: InputDecoration(label: Text("Stock")),
            validator: (value) {
              if (value!.isEmpty) {
                return 'harus diisi';
              } else {
                return null;
              }
            },
          ),
          TextFormField(
            controller: voteAverage,
            decoration: InputDecoration(label: Text("Rating")),
            validator: (value) {
              if (value!.isEmpty) {
                return 'harus diisi';
              } else {
                return null;
              }
            },
          ),
          ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  if (index != null) {
                    film![index].id = film_id!;

                    film![index].deskripsi = deskripsiInput.text;
                    film![index].judul = judulInput.text;
                    film![index].penerbit = penerbitInput.text;
                    film![index].pengarang = pengarangInput.text;
                    film![index].stock = stockInput.text;
                    film![index].posterPath = gambarInput.text;
                    film![index].voteAverage = double.parse(voteAverage.text);
                    getFilm();
                  } else {
                    film_id = film!.length + 1;
                    Movie data = Movie(
                      id: film_id!,
                      deskripsi: deskripsiInput.text,
                      judul: judulInput.text,
                      penerbit: penerbitInput.text,
                      pengarang: pengarangInput.text,
                      stock: stockInput.text,
                      posterPath: gambarInput.text,
                      voteAverage: double.parse(voteAverage.text),
                    );
                    addFilm(data);
                  }
                  Navigator.pop(context);
                }
              },
              child: Text("Simpan"))
        ],
      ),
    );
  }
}
