import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_learn/view/details_page/cubit/details_cubit.dart';
import 'package:go_router_learn/view/details_page/model/details_page_model.dart';
import 'package:go_router_learn/widgets/custom_error_widget.dart';
import 'package:go_router_learn/widgets/custom_loading_widget.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({
    super.key,
    required this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: BlocProvider(
        create: (context) => DetailsCubit()..fetchData(id),
        child: BlocBuilder<DetailsCubit, DetailsState>(
          builder: (context, state) {
            if (state is DetailsError) {
              return CustomErrorWidget(errorText: state.errorText);
            } else if (state is DetailsFetch) {
              DetailsPageModel? item = state.item;
              return Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      item?.title ?? "",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 30),
                    Text(
                      item?.body ?? "",
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              );
            } else {
              return const CustomLoadingWidget();
            }
          },
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          context.go("/");
        },
        icon: const Icon(Icons.chevron_left),
      ),
    );
  }
}
