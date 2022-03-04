class MoviesPage extends StatefulWidget {
  @override
  _MoviesPageState createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trending Movies'),
      ),

      // connecting Cubit to UI
      body: BlocBuilder<MoviesCubit, MoviesState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ErrorState) {
            return Center(
              child: Icon(Icons.close),
            );
          } else if (state is LoadedState) {
            final movies = state.movies;

            return ListView.builder(
              itemCount: movies.length,
              itemBuilder: (context, index) => Card(
                child: ListTile(
                  title: Text(movies[index].title),
                  subtitle: Text(movies[index].overview),

                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(movies[index].urlImage),

                  ),
                ),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}