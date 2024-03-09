import 'package:clean_architecture/features/cats/presentation/bloc/cats_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatsScreen extends StatelessWidget {
  const CatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cats'),
        ),
        body: Center(
          child: BlocBuilder<CatsBloc, CatsState>(
            builder: (context, state) {
              if (state is CatsInitial) {
                return const Text('Press the button to get some cats!');
              } else if (state is CatsLoading) {
                return const CircularProgressIndicator();
              } else if (state is CatsSuccess) {
                return GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  children: state.cats
                      .map((cat) => Card(
                            child: Column(
                              children: [
                                Expanded(child: Text(cat.id)),
                                Expanded(
                                  child: Image.network(
                                    cat.url,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              ],
                            ),
                          ))
                      .toList(),
                );
              } else if (state is CatsFailure) {
                return Text(state.error);
              }
              return const SizedBox.shrink();
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.read<CatsBloc>().add(const GetCats());
          },
          child: const Icon(Icons.search),
        ));
  }
}
