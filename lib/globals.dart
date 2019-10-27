import 'dart:collection';

import 'profile.dart' as profile;

profile.Profile currentUser;
HashMap allUsers = new HashMap<int, profile.Profile>(equals: (int a, int b) => a == b);
