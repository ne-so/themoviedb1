import 'package:flutter/material.dart';
import 'package:themoviedb_1/resources/resources.dart';


class Movie{
  final String imageName;
  final String title;
  final String time;
  final String description;

  Movie({
    required this.imageName,
    required this.title,
    required this.time,
    required this.description,
  });
}


class MovieListWidget extends StatefulWidget {


  const MovieListWidget({Key? key}) : super(key: key);

  @override
  State<MovieListWidget> createState() => _MovieListWidgetState();
}

class _MovieListWidgetState extends State<MovieListWidget> {
  final _movies = [
    Movie(
      imageName: AppImages.moviePlaceHolder, 
      title: 'Острые козырьки', 
      time: 'April 7, 2021', 
      description: 'Это описание фильма это описание фильма это описание фильма'
    ),
    Movie(
      imageName: AppImages.moviePlaceHolder, 
      title: 'Угнать за 60 секунд', 
      time: 'April 7, 2021', 
      description: 'Это описание фильма это описание фильма это описание фильма'
    ),
    Movie(
      imageName: AppImages.moviePlaceHolder, 
      title: '8 миля', 
      time: 'April 7, 2021', 
      description: 'Это описание фильма это описание фильма это описание фильма'
    ),
    Movie(
      imageName: AppImages.moviePlaceHolder, 
      title: '300 спартанцев', 
      time: 'April 7, 2021', 
      description: 'Это описание фильма это описание фильма это описание фильма'
    ),
    Movie(
      imageName: AppImages.moviePlaceHolder, 
      title: 'Форсаж 4', 
      time: 'April 7, 2021', 
      description: 'Это описание фильма это описание фильма это описание фильма'
    ),
    Movie(
      imageName: AppImages.moviePlaceHolder, 
      title: 'Лицо со шрамом', 
      time: 'April 7, 2021', 
      description: 'Это описание фильма это описание фильма это описание фильма'
    ),
    Movie(
      imageName: AppImages.moviePlaceHolder, 
      title: 'Крестный отец', 
      time: 'April 7, 2021', 
      description: 'Это описание фильма это описание фильма это описание фильма'
    ),
    Movie(
      imageName: AppImages.moviePlaceHolder, 
      title: 'Платформа', 
      time: 'April 7, 2021', 
      description: 'Это описание фильма это описание фильма это описание фильма'
    ),
    Movie(
      imageName: AppImages.moviePlaceHolder, 
      title: 'Приключения Шурика', 
      time: 'April 7, 2021', 
      description: 'Это описание фильма это описание фильма это описание фильма'
    ),
    Movie(
      imageName: AppImages.moviePlaceHolder, 
      title: 'Кавказская пленница ', 
      time: 'April 7, 2021', 
      description: 'Это описание фильма это описание фильма это описание фильма'
    )
  ];

  var _filteredMovies = <Movie>[];

  final _searchController = TextEditingController();

  void _searchMovies() {
    final query = _searchController.text;
    if (query.isNotEmpty) {
      _filteredMovies = _movies.where((Movie movie) {
        return movie.title.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } else {
      _filteredMovies = _movies;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    _filteredMovies = _movies;
    _searchController.addListener(_searchMovies);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          padding: const EdgeInsets.only(top: 60),
          itemCount: _filteredMovies.length,
          itemExtent: 163,
          itemBuilder: (BuildContext context, int index) {
            final movie = _filteredMovies[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black.withOpacity(0.2)),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      boxShadow: [ 
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                           offset: const Offset(0, 2),   
                        )
                      ],
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: Row(
                      children: [
                        Image(image: AssetImage(movie.imageName)),
                        const SizedBox(width: 15,),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 10,),
                              Text(
                                movie.title,
                                style: const TextStyle(fontWeight: FontWeight.bold),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 5,),
                              Text(
                                movie.time,
                                style: const TextStyle(color: Colors.grey),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 15,),
                              Text(
                                movie.description, 
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              )
                            ],
                          ),
                        ),
                        const SizedBox(width: 5),
                      ],
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {
                        print('11');
                      }
                    ),
                  )
                ],
              ),
            );
          }
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              labelText: 'Поиск',
              filled: true,
              fillColor: Colors.white.withAlpha(235),
              border: const OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );    
  }
}