import 'package:bloc_tutorial_vb/cubit/dummy_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitView extends StatelessWidget {
  const CubitView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DummyDataCubit(),
      child: _scaffoldBuilder(context),
    );
  }

  Scaffold _scaffoldBuilder(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Bloc Tutorial"),
      ),
      body: BlocConsumer<DummyDataCubit, DummyDataState>(
        listener: (context, state) {
          // do stuff here based on BlocA's state
        },
        builder: (context, state) {
          if (state is DummyDataInitial) {
            return _buildInitalPage(context);
          } else if (state is DummyDataIsLoading) {
            return _buildIsLoading();
          } else if (state is DummyDataLoaded) {
            return _buildIsLoaded(state);
          } else {
            return _buildError(state);
          }
        },
      ),
    );
  }

  Center _buildInitalPage(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 12.0),
        child: Column(
          children: [
            Text(
              "INITIAL PAGE",
              style: Theme.of(context).textTheme.headline4,
            ),
            const Spacer(),
            _buildNavigateButton(context),
            const SizedBox(height: 5),
            _buildRefreshButton(context),
          ],
        ),
      ),
    );
  }

  SizedBox _buildNavigateButton(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 13,
      child: ElevatedButton(
        onPressed: () {
          context.read<DummyDataCubit>().navigateErrorPage();
        },
        child: const Text("Navigate To Error Page"),
      ),
    );
  }

  SizedBox _buildRefreshButton(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 13,
      child: ElevatedButton(
        onPressed: () {
          context.read<DummyDataCubit>().getData();
        },
        child: const Text("Fetch Data"),
      ),
    );
  }

  Center _buildError(state) {
    return Center(
      child: Text(state.error),
    );
  }

  Center _buildIsLoading() => const Center(child: CircularProgressIndicator());

  ListView _buildIsLoaded(DummyDataLoaded state) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text(state.repsonse[index].title ?? ""),
            subtitle: Text(state.repsonse[index].body ?? ""),
          ),
        );
      },
    );
  }
}
