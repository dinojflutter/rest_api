class Usermodel {
  final int id;
  final String email;
  final String firstname;
  final String lastname;
  final String avatar;

  Usermodel(
      {required this.avatar,
      required this.email,
      required this.firstname,
      required this.lastname,
      required this.id});
}
