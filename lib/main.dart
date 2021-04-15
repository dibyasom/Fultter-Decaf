import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: ' abc ',
      theme: ThemeData(
        primaryColor: Colors.deepOrangeAccent,
      ),
      home: RandomWords(),
    );
  }
}


class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = TextStyle(fontSize: 18.0, color: Colors.grey);
  final _savedSet = <WordPair>{};

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemBuilder: /*1*/ (context, i) {
          if (i.isOdd) return Divider(); /*2*/

          final index = i ~/ 2; /*3*/
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10)); /*4*/
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _savedSet.contains(pair);
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: Icon(
        alreadySaved ? Icons.bookmarks_rounded : Icons.bookmarks_outlined,
        color: alreadySaved ? Colors.pink : Colors.grey,
      ),
      onTap: () {
        setState(() { // Calling set state triggers a call to build() for the state object, resulting an update in UI.
          alreadySaved ? _savedSet.remove(pair) : _savedSet.add(pair);
        });
      },
    );
  }

  // In Flutter, the Navigator manages a stack containing the app's routes. Pushing a route onto the Navigator's stack updates the display
  // to that route. Popping a route from the Navigator's stack returns the display to the previous route.
  //
  // Next, you'll add a list icon to the AppBar in the build method for _RandomWordsState. When the user clicks the list icon, '
  // 'a new route that contains the saved favorites is pushed to the Navigator, displaying the icon.

  // Next, you'll build a route and push it to the Navigator's stack. That action changes the screen to display the new route.
  // The content for the new page is built in MaterialPageRoute's builder property in an anonymous function.
  void _pushSaved(){
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        // NEW lines from here...
        builder: (BuildContext context) {
          final tiles = _savedSet.map(
                (WordPair pair) {
              return ListTile(
                title: Text(
                  pair.asPascalCase,
                  style: _biggerFont,
                ),
              );
            },
          );
          final divided = ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList();

          return Scaffold(
            appBar: AppBar(
              title: Text('Bookmarked Suggestions'),
            ),
            body: ListView(children: divided),
          );
        }, // ...to here.
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text('Identifier Suggestor'),
       actions: [
         IconButton(icon: Icon(Icons.favorite), onPressed: _pushSaved),
       ],
     ),
     body: _buildSuggestions(),
   );
  }
}

