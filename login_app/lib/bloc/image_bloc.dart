import 'package:rxdart/rxdart.dart';

class ImageBloc {
  final _subject = BehaviorSubject<List>();

  BehaviorSubject<List> get subject => _subject;

  ImageBloc._internal();

  static final ImageBloc _bloc = ImageBloc._internal();

  factory ImageBloc() {
    return _bloc;
  }

  getImage(repository) async {
    List response = await repository;
    _subject.add(response);
  }

  dispose() {
    _subject?.close();
  }
}
