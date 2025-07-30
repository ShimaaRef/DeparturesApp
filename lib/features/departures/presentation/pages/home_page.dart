import 'package:departures_app/features/search/presentation/pages/search_page.dart';
import 'package:flutter/material.dart';

import '../../../../shared/dls/search_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final controller = TextEditingController();

    Future<void> goToSearchPage() async {
      final selected = await Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const SearchPage()),
      );

      if (selected != null && selected is String) {
        controller.text = selected;
        // trigger departure bloc to fetch based on selected stopId
      }
    }

    return Scaffold(
      backgroundColor: const Color(
        0xFFEDF1F5,
      ), // Semantic Colors/Background/Tertiary
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar Container with White BG
            Container(
              width: double.infinity,
              color: Colors.white, // DLS: Search bar container background
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              child: CustomSearchBar(
                controller: controller,
                onChanged: (_) {},
                onTap: goToSearchPage,
                showLeadingIcon: true,
                showFirstTrailingIcon: false,
                showSecondTrailingIcon: false,
              ),
            ),
            const Divider(
              color: Color(0xFF191F25), // Border/Primary
              thickness: 1,
              height: 1,
            ),

            // Scrollable Content Area
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 40,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('👀', style: TextStyle(fontSize: 32)),
                    const SizedBox(height: 16),

                    Text(
                      'Find the best\npublic transport\nconnections',
                      style: theme.textTheme.displayLarge?.copyWith(
                        color: const Color(0xFF191F25), // Foreground/Primary
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 16),

                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse varius enim in eros elementum tristique.',
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: const Color(0xFF3A3F45), // Foreground/Secondary
                      ),
                    ),
                    const SizedBox(height: 24),

                    Text(
                      'Cupping aesthetic chambray',
                      style: theme.textTheme.titleSmall?.copyWith(
                        color: const Color(0xFF191F25), // Foreground/Primary
                      ),
                    ),
                    const SizedBox(height: 8),

                    Text(
                      'Intelligentsia asymmetrical stumptown banh mi, bodega boys ugh pop-up 90\'s cardigan tonx humblebrag DIY. '
                      'Chicharrones DIY 8-bit gluten-free. Vibecession palo santo pickled fashion axe skateboard hoodie vaporware '
                      'vegan lumbersexual. Mumblecore celiac schlitz, DSA chambray hashtag enamel pin ethical before they sold out '
                      'tote bag drinking vinegar hot chicken intelligentsia mukbang gorpcore.',
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: const Color(0xFF3A3F45),
                      ),
                    ),
                    const SizedBox(height: 16),

                    Text(
                      'Intelligentsia asymmetrical stumptown',
                      style: theme.textTheme.titleSmall?.copyWith(
                        color: const Color(0xFF191F25),
                      ),
                    ),
                    const SizedBox(height: 8),

                    Text(
                      'Chicharrones DIY 8-bit gluten-free. Vibecession palo santo pickled fashion axe skateboard hoodie vaporware '
                      'vegan lumbersexual. Mumblecore celiac schlitz.',
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: const Color(0xFF3A3F45),
                      ),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
