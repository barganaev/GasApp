part of 'shipment_bloc.dart';

abstract class ShipmentState extends Equatable {
  const ShipmentState();

  @override
  List<Object> get props => [];
}

class ShipmentInitial extends ShipmentState {}

class ShipmentLoading extends ShipmentState {}

class ShipmentLoaded extends ShipmentState {
  ShipmentModel shipmentModel;
  ShipmentLoaded({this.shipmentModel});
}

class ShipmentError extends ShipmentState {}
