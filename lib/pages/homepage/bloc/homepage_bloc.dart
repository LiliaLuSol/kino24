import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kino24/other/app_export.dart';
import '../models/homepage_model.dart';
import '../models/viewhierarchy_item_model.dart';
import 'package:kino24/page/homepage/models/homepage_model.dart';
part 'homepage_event.dart';
part 'homepage_state.dart';

/// A bloc that manages the state of a Homepage according to the event that is dispatched to it.
class HomepageBloc extends Bloc<HomepageEvent, HomepageState> {
  HomepageBloc(HomepageState initialState) : super(initialState) {
    on<HomepageInitialEvent>(_onInitialize);
  }

  _onInitialize(
    HomepageInitialEvent event,
    Emitter<HomepageState> emit,
  ) async {
    emit(state.copyWith(
        homepageModelObj: state.homepageModelObj?.copyWith(
      viewhierarchyItemList: fillViewhierarchyItemList(),
    )));
  }

  List<ViewhierarchyItemModel> fillViewhierarchyItemList() {
    return List.generate(4, (index) => ViewhierarchyItemModel());
  }
}
