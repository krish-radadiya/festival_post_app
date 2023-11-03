class Quote {
  String quote;
  String author;

  Quote({required this.author, required this.quote});

  factory Quote.fromMap({required Map Data}) {
    return Quote(
      author: Data['author'],
      quote: Data['quote'],
    );
  }
}
