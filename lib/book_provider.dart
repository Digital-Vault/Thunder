import 'package:flutter/widgets.dart';
import 'package:flutter_sample/book_bloc.dart';

/// This is an InheritedWidget that wraps around [BookBloc].
class BookProvider extends InheritedWidget {
  /// Creates provider that passes [BookBloc].
  BookProvider({
    @required Widget child,
    Key key,
    BookBloc bookBloc,
  })  : _bookBloc = bookBloc ?? BookBloc(),
        super(key: key, child: child);

  final BookBloc _bookBloc;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  /// Returns the [BookBloc].
  static BookBloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(BookProvider) as BookProvider)
          ._bookBloc;
}
