import 'package:flutter/widgets.dart';
import 'package:flutter_sample/book_bloc.dart';

/// This is an InheritedWidget that wraps around [BookBloc].
class BookProvider extends InheritedWidget {
  final BookBloc bookBloc;

  BookProvider({
    Key key,
    BookBloc bookBloc,
    @required Widget child,
  })  : bookBloc = bookBloc ?? BookBloc(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static BookBloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(BookProvider) as BookProvider)
          .bookBloc;
}
