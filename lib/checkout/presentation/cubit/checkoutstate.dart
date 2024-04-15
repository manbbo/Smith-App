part of 'checkoutcubit.dart';

abstract class CheckoutState extends Equatable {
  const CheckoutState();

  const factory CheckoutState.loading() = CheckoutLoadingState;

  const factory CheckoutState.result(List<Pokemon> result) =
      CheckoutResultState;

  const factory CheckoutState.error() = CheckoutErrorState;

  @override
  List<Object?> get props => [];
}

class CheckoutLoadingState extends CheckoutState {
  const CheckoutLoadingState();
}

class CheckoutErrorState extends CheckoutState {
  const CheckoutErrorState();
}

class CheckoutResultState extends CheckoutState {
  const CheckoutResultState(this.result);
  final List<Pokemon> result;

  @override
  List<Object?> get props => [result];
}
