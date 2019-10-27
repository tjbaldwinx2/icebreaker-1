class Profile {
  String firstName;
  String lastName;
  String email;

  Profile(this.firstName, this.lastName, this.email);
}

class RecruiterProfile extends Profile {
  String company;
  String title;
  Position position;

  RecruiterProfile(String firstName, String lastName, String email, this.company, this.title):
    super(firstName, lastName, email);

  createPosition(String title, String description, String education, String skillsRequired, String skillsDesired, double salary, String timeFrame) {
    this.position = new Position(title, description, education, skillsRequired);
    this.position.addInfo(skillsDesired, salary, timeFrame);
  }
}

class ApplicantProfile extends Profile {
  ApplicantProfile(String firstName, String lastName, String email):
        super(firstName, lastName, email);

  addInfo() {

  }
}

class Position {
  String title;
  String description;
  String education;
  String skillsRequired;
  String skillsDesired;
  double salary;
  String timeFrame;

  Position(this.title, this.description, this.education, this.skillsRequired);

  addInfo(String skillsDesired, double salary, String timeFrame) {
    if (!(skillsDesired == '')) {
      addSkillsDesired(skillsDesired);
    }
    if (!(salary == -1)) {
      addSalary(salary);
    }
    if (!(timeFrame == '')) {
      addTimeFrame(timeFrame);
    }
  }

  addSkillsDesired(String skillsDesired) {
    this.skillsDesired = skillsDesired;
  }

  addSalary(double salary) {
    this.salary = salary;
  }

  addTimeFrame(String timeFrame) {
    this.timeFrame = timeFrame;
  }

}