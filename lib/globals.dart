import 'dart:collection';

import 'profile.dart' as profile;

profile.Profile currentUser;
HashMap allUsers = new HashMap<String, profile.Profile>(equals: (String a, String b) => a == b);

List<String> races = ['White', 'Black or African American', 'Pacific Islander', 'Native American', 'Asian', 'More than One', 'Refuse to Answer'];
List<String> ethnicities = ['Not Hispanic or Latino', 'Hispanic or Latino', 'Refuse to Answer'];
List<String> disabilities = ['I have a disability', 'I do not have a disibility', 'Refuse to Answer'];
List<String> employments = ['Co-Op/Intern', 'Full-Time', 'Part-Time'];