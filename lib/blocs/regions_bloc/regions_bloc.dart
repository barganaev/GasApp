import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gasapp/repo/requests.dart';
import 'package:gasapp/models/regions_model.dart';

part 'regions_event.dart';
part 'regions_state.dart';

class RegionsBloc extends Bloc<RegionsEvent, RegionsState> {
  RegionsBloc() : super(RegionsInitialState());

  @override
  Stream<RegionsState> mapEventToState(RegionsEvent event) async* {
    if (event is RegionsGetEvent) {
      yield RegionsLoadingState();
      try {
        List<RegionsModel> regionsModel =
            await ApiProvider().requestPost("regions");
        if (regionsModel != null) {
          yield RegionsLoadedState(regionsModel: regionsModel);
        } else {
          yield RegionsErrorState();
        }
      } catch (e) {
        yield RegionsErrorState();
      }
    }
  }
}
