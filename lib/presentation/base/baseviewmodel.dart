import 'dart:async';

import '../common/state_renderer/state_render_impl.dart';

abstract class BaseViewModel extends BaseViewModelInputs
    with BaseViewModelOutputs {
  StreamController _inputStateStreamController =
      StreamController<FlowState>.broadcast();

  @override
  Sink get inputState => _inputStateStreamController.sink;

  @override
  Stream<FlowState> get outputState =>
      _inputStateStreamController.stream.map((flowState) => flowState);

  @override
  void dispose() {
    _inputStateStreamController.close();
  }
//shared variables and function that will be used through any view model
}

abstract class BaseViewModelInputs {
  void start(); // will be called while initializing the view model
  void dispose(); // will be called while disposing the view model
  Sink get inputState;
}

abstract mixin class BaseViewModelOutputs {
  Stream<FlowState> get outputState;
}
