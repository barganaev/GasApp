part of 'add_feedback_bloc.dart';

abstract class AddFeedbackEvent extends Equatable {
  const AddFeedbackEvent();

  @override
  List<Object> get props => [];
}

class AddFeedbackGetMessage extends AddFeedbackEvent {
  final String name, email, phone, text;
  AddFeedbackGetMessage({this.name, this.email, this.phone, this.text});
}

class AddFeedbackGetSupport extends AddFeedbackEvent {
  final String name, email, phone, text;
  AddFeedbackGetSupport({this.name, this.email, this.phone, this.text});
}
