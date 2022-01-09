part of 'saved_link_cubit.dart';

class SavedLinkState extends Equatable {
  final String link;

  const SavedLinkState({this.link = ''});

  @override
  List<Object?> get props => [link];

  SavedLinkState copyWith({
    String? link,
  }) {
    return SavedLinkState(
      link: link ?? this.link,
    );
  }
}
