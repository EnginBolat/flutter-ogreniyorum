import 'package:country_picker/country_picker.dart';
import 'package:flutter/foundation.dart';
import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:news_with_bloc/constants/texts/const_text.dart';
import 'package:news_with_bloc/model/news_model.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:provider/provider.dart';

import '../service/cubit/news_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()
        ..fetchNews(), //--> Burası uygulama ilk başladığında initial state kısmını atlamak için
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: BlocConsumer<NewsCubit, NewsState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is NewsInitial) {
                return _buildLoadingView(context);
              } else if (state is NewsLoading) {
                return _buildLoadingView(context);
              } else if (state is NewsFetched) {
                return _buildListView(state);
              } else {
                return _buildErrorView(state);
              }
            }),
      ),
    );
  }

  ListView _buildListView(NewsFetched state) {
    return ListView.builder(
      itemCount: state.newsArticles.length,
      itemBuilder: (context, index) {
        var newsItem = state.newsArticles[index];
        return GestureDetector(
          onTap: () => _launchUrl(newsItem.url ?? ""),
          child: Card(
            child: Column(
              children: [
                ListTile(
                  leading: newsItem.url!.isNotEmpty
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: SizedBox(
                            width: 100,
                            child: Image.network(
                              newsItem.urlToImage ?? "",
                              fit: BoxFit.fill,
                            ),
                          ),
                        )
                      : const Placeholder(
                          color: Colors.transparent,
                        ),
                  title: Text(newsItem.title ?? ""),
                  subtitle:
                      Text("${newsItem.description?.substring(0, 40)}..."),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _launchUrl(url) async {
    if (!await launchUrlString(url)) {
      throw 'Could not launch $url';
    }
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(AppName.appName),
      actions: [
        IconButton(
            onPressed: () {
              showCountryPicker(
                context: context,
                onSelect: (Country country) {
                  if (kDebugMode) {
                    print(country.countryCode);
                  }
                },
              );
            },
            icon: const Icon(
              Icons.wordpress_outlined,
            ))
      ],
    );
  }

  Center _buildErrorView(state) {
    return Center(
      child: Text(state.error),
    );
  }

  Center _buildLoadingView(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.inkDrop(
        color: Theme.of(context).primaryColor,
        size: 100,
      ),
    );
  }
}
