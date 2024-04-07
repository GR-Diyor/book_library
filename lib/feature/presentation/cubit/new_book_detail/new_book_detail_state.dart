import 'package:equatable/equatable.dart';

abstract class NewBookDetailState extends Equatable{
@override
List<Object?> get props => [];
}

class NewBookDetailInitState extends NewBookDetailState{
  @override
  // TODO: implement props
  List<Object?> get props => super.props;

}

class NewBookDetailLoadingState extends NewBookDetailState{
  @override
  // TODO: implement props
  List<Object?> get props => super.props;
}

class NewBookDetailLoadedState extends NewBookDetailState{
  @override
  // TODO: implement props
  List<Object?> get props => super.props;
}

class NewBookDetailErrorState extends NewBookDetailState{
  final String error;
  NewBookDetailErrorState(this.error);
  @override
  // TODO: implement props
  List<Object?> get props => super.props;
}