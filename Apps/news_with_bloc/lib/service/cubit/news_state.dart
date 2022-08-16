part of 'news_cubit.dart';

@immutable
abstract class NewsState {}

class NewsInitial extends NewsState {
  NewsInitial();
}

class NewsLoading extends NewsState {
  NewsLoading();
}

class NewsError extends NewsState {
  NewsError();
}

class NewsFetched extends NewsState {
  final List<Articles> newsArticles;
  NewsFetched(this.newsArticles);
}
