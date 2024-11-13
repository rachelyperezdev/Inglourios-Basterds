class Character {
  final int id;
  final String name;
  final String? alias;
  final String imageUrl;
  final String allegiance;
  final String potrayedBy;
  final String description;
  final String notableQuote;

  Character(
      {required this.id,
      required this.name,
      this.alias,
      required this.imageUrl,
      required this.allegiance,
      required this.potrayedBy,
      required this.description,
      required this.notableQuote});
}
