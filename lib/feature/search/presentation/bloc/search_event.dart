class SearchEvent {}

class GetSearchEvent extends SearchEvent {
  final String text;

  GetSearchEvent(this.text);
}
