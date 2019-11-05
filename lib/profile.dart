abstract class Profile {
  String firstName;
  String lastName;
  String email;
  String password;

  Profile(this.firstName, this.lastName, this.email, this.password);

  createPosition(String title, String description, String education, String skillsRequired, String skillsDesired, String salary, String timeFrame);
  addType(String type);
  addInfo(String title, String summary, String education, String experience, String skills);
  getTypeOfEmployment();
  getTitle();
  getSummary();
  getEducation();
  getExperience();
  getSkills();
}

class RecruiterProfile extends Profile {
  String company;
  String title;
  Position position;

  RecruiterProfile(String firstName, String lastName, String email, String password, this.company, this.title):
    super(firstName, lastName, email, password);

  createPosition(String title, String description, String education, String skillsRequired, String skillsDesired, String salary, String timeFrame) {
    this.position = new Position(title, description, education, skillsRequired);
    this.position.addInfo(skillsDesired, salary, timeFrame);
  }

  addInfo(String title, String summary, String education, String experience, String skills) {

  }

  addType(String type) {

  }

  getTypeOfEmployment() {
    return null;
  }

  getTitle() {
    return null;
  }

  getSummary() {
    return null;
  }

  getEducation() {
    return null;
  }

  getExperience() {
    return null;
  }

  getSkills() {
    return null;
  }
}

class ApplicantProfile extends Profile {
  String address;
  String race;
  String ethnicity;
  String disability;
  String typeOfEmployment;
  String title;
  String summary;
  String education;
  String experience;
  String skills;
  ApplicantProfile(String firstName, String lastName, String email, String password, this.address, this.race, this.ethnicity, this.disability):
        super(firstName, lastName, email, password);

  addType(String type) {
    this.typeOfEmployment = type;
  }

  addInfo(String title, String summary, String education, String experience, String skills) {
    this.title = title;
    this.summary = summary;
    this.education = education;
    this.experience = experience;
    this.skills = skills;
  }

  @override
  createPosition(String title, String description, String education, String skillsRequired, String skillsDesired, String salary, String timeFrame) {
  }

  getTypeOfEmployment() {
    return typeOfEmployment;
  }

  getTitle() {
    return title;
  }

  getSummary() {
    return summary;
  }

  getEducation() {
    return education;
  }

  getExperience() {
    return experience;
  }

  getSkills() {
    return skills;
  }
}

class Position {
  String title;
  String description;
  String education;
  String skillsRequired;
  String skillsDesired;
  String salary;
  String timeFrame;

  Position(this.title, this.description, this.education, this.skillsRequired);

  addInfo(String skillsDesired, String salary, String timeFrame) {
    if (!(skillsDesired == '')) {
      addSkillsDesired(skillsDesired);
    }
    if (!(salary == '')) {
      addSalary(salary);
    }
    if (!(timeFrame == '')) {
      addTimeFrame(timeFrame);
    }
  }

  addSkillsDesired(String skillsDesired) {
    this.skillsDesired = skillsDesired;
  }

  addSalary(String salary) {
    this.salary = salary;
  }

  addTimeFrame(String timeFrame) {
    this.timeFrame = timeFrame;
  }

}