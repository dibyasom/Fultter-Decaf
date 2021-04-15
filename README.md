# Flutter-Curve :sparkles:
### author@ [Dibyasom](https://github.com/vhaegar1526)

## Getting Started

This project (Flutter-Zero) is my first application on flutter framework.
In this project I learnt about basics of flutter,
- `StatelessWidget` is immutable and renders the builder context.

-  `StatefulWidget` is immutable but can be discarded and regenrated, and returns a `State` class, which preferably should be generic.

-  `State` class persists it's state throughout the lifetime of a widget.

-  `Navigator` holds the application route stack, pushing a new stack renders the new view (via setState() builder) and popping it out, renders the previous state back.

-  `ListBuilder` is very helpful to render listTile items, and generates new listItems lazily on demand :heart:

-  `ThemeData` allows to quickly manage the overall theme of the application.

-  `pubspec.yaml` holds the external dependency headers and config, can relate to this like package.json coming from a React/React-native background myself.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, go through
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
