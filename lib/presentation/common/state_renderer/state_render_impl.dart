import 'package:advance_flutter/data/mapper/mapper.dart';
import 'package:advance_flutter/presentation/common/state_renderer/state_renderer.dart';

import '../../resources/strings_manager.dart';

abstract class FlowState {
  StateRendererType getStateRendererType();

  String getMessage();
}

// Loading State (POPUP, FULL SCREEN)
class LoadingState extends FlowState {
  StateRendererType stateRendererType;
  String message;

  LoadingState({required this.stateRendererType, String? message})
      : message = message ?? AppStrings.loading;

  @override
  StateRendererType getStateRendererType() => stateRendererType;

  @override
  String getMessage() => message;
}

// Error State (POPUP, FULL SCREEN)
class ErrorState extends FlowState {
  StateRendererType stateRendererType;
  String message;

  ErrorState(this.stateRendererType, this.message);

  @override
  StateRendererType getStateRendererType() => stateRendererType;

  @override
  String getMessage() => message;
}

// CONTENT SCREEN STATE
class ContentState extends FlowState {
  ContentState();

  @override
  StateRendererType getStateRendererType() =>
      StateRendererType.CONTENT_SCREEN_STATE;

  @override
  String getMessage() => EMPTY;
}

// EMPTY SCREEN STATE
class EmptyState extends FlowState {
  String message;

  EmptyState(this.message);

  @override
  StateRendererType getStateRendererType() =>
      StateRendererType.EMPTY_SCREEN_STATE;

  @override
  String getMessage() => message;
}