import 'package:equatable/equatable.dart';

abstract class NewSearchBookDetailState extends Equatable{
  @override
  List<Object?> get props => [];
}

class NewSearchBookInitState extends NewSearchBookDetailState{
  @override
  // TODO: implement props
  List<Object?> get props => super.props;

}

class NewSearchBookLoadingState extends NewSearchBookDetailState{
  @override
  // TODO: implement props
  List<Object?> get props => super.props;
}

class NewSearchBookLoadedState extends NewSearchBookDetailState{
  @override
  // TODO: implement props
  List<Object?> get props => super.props;
}

class NewSearchBookErrorState extends NewSearchBookDetailState{
  final String error;
  NewSearchBookErrorState(this.error);
  @override
  // TODO: implement props
  List<Object?> get props => super.props;
}