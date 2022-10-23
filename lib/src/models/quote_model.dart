import 'dart:convert';

class QuoteModel {
  final int id;
  final String quote;
  final String author;
  final String series;
  QuoteModel({
    required this.id,
    required this.quote,
    required this.author,
    required this.series,
  });

  QuoteModel copyWith({
    int? id,
    String? quote,
    String? author,
    String? series,
  }) {
    return QuoteModel(
      id: id ?? this.id,
      quote: quote ?? this.quote,
      author: author ?? this.author,
      series: series ?? this.series,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'quote_id': id,
      'quote': quote,
      'author': author,
      'series': series,
    };
  }

  factory QuoteModel.fromMap(Map<String, dynamic> map) {
    return QuoteModel(
      id: map['quote_id']?.toInt() ?? 0,
      quote: map['quote'] ?? '',
      author: map['author'] ?? '',
      series: map['series'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory QuoteModel.fromJson(String source) =>
      QuoteModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'QuoteModel(id: $id, quote: $quote, author: $author, series: $series)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is QuoteModel &&
        other.id == id &&
        other.quote == quote &&
        other.author == author &&
        other.series == series;
  }

  @override
  int get hashCode {
    return id.hashCode ^ quote.hashCode ^ author.hashCode ^ series.hashCode;
  }
}
