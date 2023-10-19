import 'package:untitled2/domain/entities/bus_model.dart';
import 'package:untitled2/domain/repositories/bus_repository.dart';

class GetBus {
  final BusRepository repository;

  GetBus(this.repository);

  Future<BusModel> call() async {
    return repository.fetchBus();
  }
}
