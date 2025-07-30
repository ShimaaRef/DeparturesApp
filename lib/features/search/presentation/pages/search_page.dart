import 'package:departures_app/shared/di/service_locator.dart' as sl;
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
            // 🔝 Header
            Container(
              height: 72,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: const BoxDecoration(
                color: Color(0xFFFFFFFF),
                borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    iconSize: 24,
                    color: Color(0xFF191F25),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      autofocus: true,
                      onChanged: _onChanged,
                      keyboardType: TextInputType.text,
                      textCapitalization: TextCapitalization.none,
                      enableSuggestions: true,
                      style: const TextStyle(
                        color: Color(0xFF191F25),
                        fontSize: 16,
                      ),
                      cursorColor: Color(0xFF191F25),
                      decoration: const InputDecoration(
                        hintText: 'Search for station',
                        hintStyle: TextStyle(
                          color: Color(0xFF666F7A),
                          fontSize: 16,
                        ),
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(vertical: 10),
                      ),
                    ),
                  ),
                  if (showClear)
                    IconButton(
                      icon: const Icon(Icons.clear),
                      iconSize: 24,
                      color: Color(0xFF191F25),
                      onPressed: () {
                        _controller.clear();
                        _onChanged('');
                      },
                    ),
                ],
              ),
            ),

            // Divider under search bar
            const Divider(height: 1, thickness: 1, color: Color(0xFFCED2DA)),

            // Results or states
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

                  return const SizedBox.shrink(); // initial empty
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
