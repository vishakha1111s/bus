import 'package:untitled2/domain/entities/bus_model.dart';
abstract class BusRepository{
  Future<BusModel> fetchBus();
}