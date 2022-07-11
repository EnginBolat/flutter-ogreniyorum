import 'package:dio_learn/services/services.dart';
import 'package:flutter/material.dart';
import '../model/comment_model.dart';

class Specific extends StatefulWidget {
  const Specific({Key? key, this.postId}) : super(key: key);
  final int? postId;

  @override
  State<Specific> createState() => _SpecificState();
}

class _SpecificState extends State<Specific> {
  late final IPostService _postService;
  bool _isloading = false;
  List<CommentModel>? _comments;

  @override
  void initState() {
    super.initState();
    _postService = PostService();
    fetchData(widget.postId ?? 0);
  }

  void _changeLoading() {
    setState(() {
      _isloading = !_isloading;
    });
  }

  Future<void> fetchData(int postId) async {
    _changeLoading();
    _comments = await _postService.fethSpecificItems(postId);
    _changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _isloading != true
          ? ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: _comments?.length ?? 0,
              itemBuilder: (context, index) {
                var commentEmail = _comments?[index].email;
                return SizedBox(
                  height: 50,
                  child: Card(
                    child: Text(
                      commentEmail ?? '',
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              },
            )
          : const Center(child: CircularProgressIndicator.adaptive()),
    );
  }
}
