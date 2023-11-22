class CharactersQuotesModel {
  String id;

  int quoteId;

  String quote;

  String author;

  CharactersQuotesModel({
    required this.id,
    required this.quoteId,
    required this.quote,
    required this.author,
  });

  factory CharactersQuotesModel.fromJson(Map<String, dynamic> json) {
    return CharactersQuotesModel(
      id: json['_id'],
      quoteId: json['quote_id'],
      quote: json['quote'],
      author: json['author'],
    );
  }
}
