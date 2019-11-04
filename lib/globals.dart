import 'dart:collection';

import 'profile.dart' as profile;

profile.Profile currentUser;
Map allUsers = {'admin@admin.com':new profile.RecruiterProfile('admin', 'admin', 'admin@admin.com', 'admin', 'admin', 'admin')};