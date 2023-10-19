import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/domain/entities/bus_model.dart';
import 'package:untitled2/domain/usecases/get_bus.dart';
import 'package:untitled2/presentation/bloc/bus_event.dart';
import 'package:untitled2/presentation/bloc/bus_state.dart';
import 'package:untitled2/utils/constants.dart';

class BusBloc extends Bloc<BusEvent, BusState> {
  final GetBus _getBus;
  BusBloc(BusState initialState, this._getBus) : super(initialState) {
    on<BusEvent>((event, emit) async {
     if (event is ErrorBusEvent) {
        emit(BusErrorState(error: errorMsg));
      }  else if (event is LoadBusEvent) {
        emit(BusLoadingState());
        try {
          BusModel busModel = await _getBus.call();
          if (busModel != null)
            emit(BusLoadCompleteState(busModel: busModel));
          else
            emit(BusErrorState(error: errorMsg));
        } catch (e) {
          BusErrorState(error: e.toString());
        }
      }
    });
  }
}
