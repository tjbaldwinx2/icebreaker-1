import 'profile.dart' as profile;

profile.Profile currentUser;
Map allUsers = {
  'admin@admin.com':new profile.RecruiterProfile('admin', 'admin', 'admin@admin.com', 'admin', 'admin', 'admin'),
  'app@app.com':new profile.ApplicantProfile('app', 'app', 'app@app.com', 'app', 'app', 'app', 'app', 'app')
};
bool newUser = false;