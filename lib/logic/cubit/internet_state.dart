part of 'internet_cubit.dart';

sealed class InternetState extends Equatable {
  const InternetState();

  @override
  List<Object> get props => [];
}

class InternetConnected extends InternetState {
  final ConnectionType connectionType;

  const InternetConnected({required this.connectionType});
}

class InternetDisconnected extends InternetState {}

final class InternetLoading extends InternetState {}
