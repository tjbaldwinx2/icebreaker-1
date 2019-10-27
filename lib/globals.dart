import 'dart:collection';

import 'profile.dart' as profile;

profile.Profile currentUser;
HashMap allUsers = new HashMap<String, profile.Profile>(equals: (String a, String b) => a == b);
