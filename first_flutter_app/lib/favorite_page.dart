import 'package:first_flutter_app/bloc/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.primaryContainer,
        title: const Text('Favorites'),
      ),
      body: BlocBuilder<AppCubit, AppState>(
        buildWhen: (previous, current) => previous.favorites != current.favorites,
        builder: (context, state) {
          if (state.favorites.isEmpty) {
            return const Center(
              child: Text('No favorites yet'),
            );
          }

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(30),
                child: Text(
                    'You have ${state.favorites.length} favorites',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.primary,
                    )
                ),
              ),

              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.sizeOf(context).width * 0.1,
                  ),
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 400,
                      childAspectRatio: 400 / 80,
                    ),
                    itemCount: state.favorites.length,
                    itemBuilder: (context, index) {
                      final pair = state.favorites[index];
                      return ListTile(
                        leading: IconButton(
                          icon: const Icon(
                            Icons.delete_outline,
                            semanticLabel: 'Delete',
                          ),
                          color: theme.colorScheme.primary,
                          onPressed: () {
                            context.read<AppCubit>().toggleFavorite(pair);
                          },
                        ),
                        title: Text(
                          pair.asLowerCase,
                          semanticsLabel: pair.asPascalCase,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
