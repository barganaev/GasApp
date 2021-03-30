part of 'shipment_bloc.dart';

abstract class ShipmentEvent extends Equatable {
  const ShipmentEvent();

  @override
  List<Object> get props => [];
}

class ShipmentGetEvent extends ShipmentEvent {
  final String date, regionId;
  ShipmentGetEvent({this.date, this.regionId});
}
