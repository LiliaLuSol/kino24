// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'viewhierarchy_item_model.dart';

/// This class defines the variables used in the [homepage_page],
/// and is typically used to hold data that is passed between different parts of the application.
class HomepageModel extends Equatable {
  HomepageModel({this.viewhierarchyItemList = const []}) {}

  List<ViewhierarchyItemModel> viewhierarchyItemList;

  HomepageModel copyWith(
      {List<ViewhierarchyItemModel>? viewhierarchyItemList}) {
    return HomepageModel(
      viewhierarchyItemList:
          viewhierarchyItemList ?? this.viewhierarchyItemList,
    );
  }

  @override
  List<Object?> get props => [viewhierarchyItemList];
}
