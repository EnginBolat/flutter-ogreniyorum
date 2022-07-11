import 'package:dio_learn/services/services.dart';
import 'package:flutter/material.dart';
import '../model/post_model.dart';
import 'specific_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const String _baseUrl = "https://jsonplaceholder.typicode.com/";
  bool _isLoading = false;
  String name = "Fetch Data";
  List<PostModel>? _items;
  final PostService _postService = PostService();

  @override
  void initState() {
    super.initState();
    fetchPostItems();
  }

  void _changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<void> fetchPostItems() async {
    _changeLoading();
    _items = await _postService.fetchPostItems();
    _changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(name), actions: [
        _isLoading
            ? const CircularProgressIndicator.adaptive()
            : const SizedBox.shrink(),
      ]),
      body: _items == null
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
            physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemCount: _items?.length ?? 0,
              itemBuilder: (context, index) {
                return _PostCard(model: _items?[index]);
              },
            ),
    );
  }
}

class _PostCard extends StatelessWidget {
  const _PostCard({
    Key? key,
    required PostModel? model,
  })  : _model = model,
        super(key: key);

  final PostModel? _model;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: ((context) => Specific(postId: _model?.id))));
        },
        title: Text(_model?.title ?? ''),
        subtitle: Text(_model?.body ?? ''),
      ),
    );
  }
}
