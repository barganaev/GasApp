import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gasapp/models/add_feedback.dart';
import 'package:gasapp/repo/requests.dart';

part 'add_feedback_event.dart';
part 'add_feedback_state.dart';

class AddFeedbackBloc extends Bloc<AddFeedbackEvent, AddFeedbackState> {
  AddFeedbackBloc() : super(AddFeedbackInitial());

  @override
  Stream<AddFeedbackState> mapEventToState(AddFeedbackEvent event) async* {
    if (event is AddFeedbackGetMessage) {
      yield AddFeedbackLoading();
      try {
        AddFeedbackModule feedbackModule =
            await ApiProvider().requestPost("addFeedbackMessage");
        if (feedbackModule != null) {
          yield AddFeedbackLoaded();
        } else {
          yield AddFeedbackError();
        }
      } catch (e) {
        yield AddFeedbackError();
      }
    } else if (event is AddFeedbackGetSupport) {
      yield AddFeedbackLoading();
      try {
        AddFeedbackModule feedbackModule =
            await ApiProvider().requestPost("addFeedbackSupport");
        if (feedbackModule != null) {
          yield AddFeedbackLoaded();
        } else {
          yield AddFeedbackError();
        }
      } catch (e) {
        yield AddFeedbackError();
      }
    }
  }
}
