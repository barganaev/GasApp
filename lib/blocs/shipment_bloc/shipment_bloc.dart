import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gasapp/models/shipment_model.dart';
import 'package:gasapp/repo/requests.dart';

part 'shipment_event.dart';
part 'shipment_state.dart';

class ShipmentBloc extends Bloc<ShipmentEvent, ShipmentState> {
  ShipmentBloc() : super(ShipmentInitial());

  @override
  Stream<ShipmentState> mapEventToState(ShipmentEvent event) async* {
    if (event is ShipmentGetEvent) {
      yield ShipmentLoading();
      try {
        print("event.regionId");
        print(event.regionId);
        print(event.date);
        ShipmentModel shipmentModel = await ApiProvider().requestPost(
          "planShipment",
          regionId: event.regionId,
          date: event.date,
        );
        if (shipmentModel.message != null) {
          yield ShipmentLoaded(shipmentModel: shipmentModel);
        } else {
          yield ShipmentError();
        }
      } catch (e) {
        yield ShipmentError();
      }
    }
  }
}
