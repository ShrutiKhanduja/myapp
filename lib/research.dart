class Research {
  late String doi;
  late String domain_name;
  late String emp_id;
  late String emp_name;
  late String paper_link;
  List keywords = [];

  late String title;

  Research({
    required this.doi,
    required this.domain_name,
    required this.emp_id,
    required this.emp_name,
    required this.paper_link,
    required this.keywords,
    required this.title
  });

}