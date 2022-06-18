import 'package:flutter/material.dart';
import 'package:flutter_movie/src/model/movieData.dart';
import 'package:flutter_movie/src/page/detailsPage.dart';
import 'package:flutter_movie/src/provider/movieProvider.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    loadData();

    super.initState();
  }

  loadData(){
    final movieProvider = Provider.of<MovieProvider>(context, listen: false);
    movieProvider.getData();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MovieProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Movie App Demo'),
        ),
        body: provider.isLoading
            ? const Center(child: CircularProgressIndicator())
            : provider.movieList.isEmpty
                ? const Center(child: Text('No data found'))
                : ListView.builder(
                    itemCount: provider.movieList.length,
                    itemBuilder: (context, index) {
                      return buildMovie(provider.movieList[index]);
                    },
                  ));
  }

  Widget buildMovie(Movie movie){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Card(
        elevation: 0,
        child: InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsPage(movie: movie)));
          },
          borderRadius: BorderRadius.circular(1),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xffedf7fb)
            ),
            child: Row(
              children: [
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(8), bottomLeft: Radius.circular(8)),
                    image: DecorationImage(
                      image: NetworkImage(
                        movie.poster.toString(),
                      ),
                      fit: BoxFit.cover
                    )
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${movie.title}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black87)),
                        Text('Year: ${movie.year}', style: TextStyle(fontSize: 14, color: Colors.grey.shade700),),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
