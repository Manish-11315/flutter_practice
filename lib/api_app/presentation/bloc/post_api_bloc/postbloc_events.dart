abstract class PostblocEvents {}

class sendreqestEvent extends PostblocEvents {
  final String id;
  final String name;
  final String email;
  final String creation_date;

  sendreqestEvent({
    required this.id,
    required this.name,
    required this.email,
    required this.creation_date,
  });
}
