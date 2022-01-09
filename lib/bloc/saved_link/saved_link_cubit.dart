import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'saved_link_state.dart';

class SavedLinkCubit extends Cubit<SavedLinkState> {
  SavedLinkCubit() : super(SavedLinkState());

  void saveLink(String link) {
    emit(state.copyWith(link: link));
  }

  void clearLink() {
    emit(state.copyWith(link: ''));
  }
}
