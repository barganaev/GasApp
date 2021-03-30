part of 'add_feedback_bloc.dart';

abstract class AddFeedbackState extends Equatable {
  const AddFeedbackState();
  
  @override
  List<Object> get props => [];
}

class AddFeedbackInitial extends AddFeedbackState {}
class AddFeedbackLoading extends AddFeedbackState {}
class AddFeedbackLoaded extends AddFeedbackState {}
class AddFeedbackError extends AddFeedbackState {}
