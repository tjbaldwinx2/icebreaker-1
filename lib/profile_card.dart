
class profile_card {
  String cardTitle;
  String cardImage;
  double topMargin;
  bool personType;

  // True -- Job Seeker
  // False -- Recruiter
  profile_card(String title, String imagePath, double marginTop, bool type) {
    cardTitle = title;
    cardImage = imagePath;
    topMargin = marginTop;
    personType = type;
  }
}