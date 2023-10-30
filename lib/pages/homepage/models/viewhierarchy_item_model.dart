/// This class is used in the [viewhierarchy_item_widget] screen.
class ViewhierarchyItemModel {
  ViewhierarchyItemModel({
    this.userName,
    this.userGenre,
    this.ticketText,
    this.id,
  }) {
    userName = userName ?? "Барби";
    userGenre = userGenre ?? "Мелодрама, Фэнтези \n2D";
    ticketText = ticketText ?? "Билеты только онлайн";
    id = id ?? "";
  }

  String? userName;

  String? userGenre;

  String? ticketText;

  String? id;
}
