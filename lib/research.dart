class Research {
  late String doi;
  late String domain_name;

  late String author;
  late String paper_link;
  List keywords = [];

  late String title;

  Research({
    required this.doi,
    required this.domain_name,

    required this.author,
    required this.paper_link,
    required this.keywords,
    required this.title
  });

}