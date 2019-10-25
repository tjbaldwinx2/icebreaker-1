class Profile {
  String firstName;
  String lastName;

  Profile(this.firstName, this.lastName);
}

class RecruiterProfile extends Profile {
  RecruiterProfile(String firstName, String lastName):
    super(firstName, lastName);

}

class ApplicantProfile extends Profile {
  ApplicantProfile(String firstName, String lastName):
        super(firstName, lastName);
}