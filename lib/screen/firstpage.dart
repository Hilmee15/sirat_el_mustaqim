import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        title: const Text('Sirat-El-Mustaqim'),
        titleTextStyle: const TextStyle(
          fontFamily: 'Traditional Arabic',
          fontSize: 20
        ),
      ),
      // This is handled by the search bar itself.
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: [
          buildFloatingSearchBar(),
        ],
      ),
    );
  }

  Widget buildFloatingSearchBar() {
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return FloatingSearchBar(
      hint: 'Search',
      scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
      transitionDuration: const Duration(milliseconds: 800),
      transitionCurve: Curves.easeInOut,
      physics: const BouncingScrollPhysics(),
      axisAlignment: isPortrait ? 0.0 : -1.0,
      openAxisAlignment: 0.0,
      width: isPortrait ? 600 : 500,
      debounceDelay: const Duration(milliseconds: 500),
      onQueryChanged: (query) {
        // Call your model, bloc, controller here.
      },
      // Specify a custom transition to be used for
      // animating between opened and closed stated.
      transition: CircularFloatingSearchBarTransition(),
      actions: [
        FloatingSearchBarAction(
          showIfOpened: false,
          child: CircularButton(
            icon: const Icon(Icons.mic),
            onPressed: () {},
          ),
        ),
        FloatingSearchBarAction.searchToClear(
          showIfClosed: false,
        ),
      ],
      builder: (context, transition) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: const Material(
            color: Colors.white,
            elevation: 4.0,
          ),
        );
      },
    );
  }
}

// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const BottomAppBarDemo());
// }
//
// class BottomAppBarDemo extends StatefulWidget {
//   const BottomAppBarDemo({Key? key}) : super(key: key);
//
//   @override
//   State createState() => _BottomAppBarDemoState();
// }
//
// class _BottomAppBarDemoState extends State<BottomAppBarDemo> {
//   bool _showFab = true;
//   bool _showNotch = true;
//   FloatingActionButtonLocation _fabLocation =
//       FloatingActionButtonLocation.endDocked;
//
//   void _onShowNotchChanged(bool value) {
//     setState(() {
//       _showNotch = value;
//     });
//   }
//
//   void _onShowFabChanged(bool value) {
//     setState(() {
//       _showFab = value;
//     });
//   }
//
//   void _onFabLocationChanged(FloatingActionButtonLocation? value) {
//     setState(() {
//       _fabLocation = value ?? FloatingActionButtonLocation.endDocked;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           automaticallyImplyLeading: false,
//           title: const Text('Bottom App Bar Demo'),
//         ),
//         body: ListView(
//           padding: const EdgeInsets.only(bottom: 88),
//           children: <Widget>[
//             SwitchListTile(
//               title: const Text(
//                 'Floating Action Button',
//               ),
//               value: _showFab,
//               onChanged: _onShowFabChanged,
//             ),
//             SwitchListTile(
//               title: const Text('Notch'),
//               value: _showNotch,
//               onChanged: _onShowNotchChanged,
//             ),
//             const Padding(
//               padding: EdgeInsets.all(16),
//               child: Text('Floating action button position'),
//             ),
//             RadioListTile<FloatingActionButtonLocation>(
//               title: const Text('Docked - End'),
//               value: FloatingActionButtonLocation.endDocked,
//               groupValue: _fabLocation,
//               onChanged: _onFabLocationChanged,
//             ),
//             RadioListTile<FloatingActionButtonLocation>(
//               title: const Text('Docked - Center'),
//               value: FloatingActionButtonLocation.centerDocked,
//               groupValue: _fabLocation,
//               onChanged: _onFabLocationChanged,
//             ),
//             RadioListTile<FloatingActionButtonLocation>(
//               title: const Text('Floating - End'),
//               value: FloatingActionButtonLocation.endFloat,
//               groupValue: _fabLocation,
//               onChanged: _onFabLocationChanged,
//             ),
//             RadioListTile<FloatingActionButtonLocation>(
//               title: const Text('Floating - Center'),
//               value: FloatingActionButtonLocation.centerFloat,
//               groupValue: _fabLocation,
//               onChanged: _onFabLocationChanged,
//             ),
//           ],
//         ),
//         floatingActionButton: _showFab
//             ? FloatingActionButton(
//                 onPressed: () {},
//                 tooltip: 'Create',
//                 child: const Icon(Icons.add),
//               )
//             : null,
//         floatingActionButtonLocation: _fabLocation,
//         bottomNavigationBar: _DemoBottomAppBar(
//           fabLocation: _fabLocation,
//           shape: _showNotch ? const CircularNotchedRectangle() : null,
//         ),
//       ),
//     );
//   }
// }
//
// class _DemoBottomAppBar extends StatelessWidget {
//   const _DemoBottomAppBar({
//     this.fabLocation = FloatingActionButtonLocation.endDocked,
//     this.shape = const CircularNotchedRectangle(),
//   });
//
//   final FloatingActionButtonLocation fabLocation;
//   final NotchedShape? shape;
//
//   static final List<FloatingActionButtonLocation> centerLocations =
//       <FloatingActionButtonLocation>[
//     FloatingActionButtonLocation.centerDocked,
//     FloatingActionButtonLocation.centerFloat,
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return BottomAppBar(
//       shape: shape,
//       color: Colors.blue,
//       child: IconTheme(
//         data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
//         child: Row(
//           children: <Widget>[
//             IconButton(
//               tooltip: 'Open navigation menu',
//               icon: const Icon(Icons.menu),
//               onPressed: () {},
//             ),
//             if (centerLocations.contains(fabLocation)) const Spacer(),
//             IconButton(
//               tooltip: 'Search',
//               icon: const Icon(Icons.search),
//               onPressed: () {},
//             ),
//             IconButton(
//               tooltip: 'Favorite',
//               icon: const Icon(Icons.favorite),
//               onPressed: () {},
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
