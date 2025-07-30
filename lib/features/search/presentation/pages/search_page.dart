import 'package:departures_app/shared/di/service_locator.dart' as sl;
import 'package:departures_app/shared/dls/search_bar_full_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/search_bloc.dart';
import '../bloc/search_event.dart';
import '../bloc/search_state.dart';
import '../widgets/search_result_item.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl.sl<SearchBloc>(),
      child: const SearchPageBody(),
    );
  }
}

class SearchPageBody extends StatefulWidget {
  const SearchPageBody({super.key});

  @override
  State<SearchPageBody> createState() => _SearchPageBodyState();
}

class _SearchPageBodyState extends State<SearchPageBody> {
  final TextEditingController _controller = TextEditingController();
  bool showClear = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        showClear = _controller.text.isNotEmpty;
      });
    });
  }

  void _onChanged(String query) {
    context.read<SearchBloc>().add(SearchQueryChanged(query));
  }

  void _onItemTap(String stopId) {
    Navigator.pop(context, stopId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: Column(
          children: [
            // Search bar
            SearchBarFullScreen(
              controller: _controller,
              onChanged: _onChanged,
              showLeadingIcon: true,
              show3rdTrailingIcon: showClear,
              showDivider: true,
              labelText: '',
              onTrailingPressed: () {
                _controller.clear();
                _onChanged('');
              },
            ),

            // Search results
            Expanded(
              child: BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) {
                  if (state is SearchLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is SearchLoaded) {
                    return ListView.builder(
                      itemCount: state.results.length,
                      itemBuilder: (context, index) {
                        final result = state.results[index];
                        return SearchResultItem(
                          name: result.name,
                          modes: result.modes,
                          onTap: () => _onItemTap(result.id),
                        );
                      },
                    );
                  } else if (state is SearchError) {
                    return Center(child: Text(state.message));
                  }

                  return const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
