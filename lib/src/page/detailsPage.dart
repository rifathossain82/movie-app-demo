import 'package:flutter/material.dart';
import 'package:flutter_movie/src/model/movieData.dart';

class DetailsPage extends StatelessWidget {
  DetailsPage({Key? key, required this.movie}) : super(key: key);

  Movie movie;

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Details Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Container(
              height: size.height*0.2,
              width: size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: NetworkImage(
                        movie.poster.toString(),
                      ),
                      fit: BoxFit.cover
                  )
              ),
            ),
            SizedBox(height: 16,),
            Text('${movie.title}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black87)),
            Text('Year: ${movie.year}', style: TextStyle(fontSize: 14, color: Colors.grey.shade700),),
          ],
        ),
      ),
    );
  }
}
