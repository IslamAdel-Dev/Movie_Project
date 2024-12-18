import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_project/WatchList/MovieWatchListModel.dart';

import '../WatchList/MovieWatchListModel.dart';

class FirebaseFuncions {
  static CollectionReference<MoviewatchlistModel> getMoviewatchlist() =>
      FirebaseFirestore.instance
          .collection('MovieWatchList')
          .withConverter<MoviewatchlistModel>(
              fromFirestore: (docSnaphot, _) =>
                  MoviewatchlistModel.fromjson(docSnaphot.data()!),
              toFirestore: (MovieWatch, _) => MovieWatch.tojson());

  static Future<void> addmovie(MoviewatchlistModel Movie) async {
    CollectionReference<MoviewatchlistModel> MovieCollection =
        getMoviewatchlist();
    DocumentReference<MoviewatchlistModel> doc =
        MovieCollection.doc(Movie.movieId);
    print(MovieCollection);
    return doc.set(Movie);
  }

  static Future<List<MoviewatchlistModel>> getallMovieWatchlist() async {
    CollectionReference<MoviewatchlistModel> taskscollection =
        getMoviewatchlist();
    QuerySnapshot<MoviewatchlistModel> querySnapshot =
        await taskscollection.get();
    return querySnapshot.docs.map((docSnapshot) => docSnapshot.data()).toList();
  }

  static Future<void> deleteMoive(MoviewatchlistModel Movie) async {
    CollectionReference<MoviewatchlistModel> taskscollection =
        getMoviewatchlist();
    return taskscollection.doc(Movie.movieId).delete();
  }
}
