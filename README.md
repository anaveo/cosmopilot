# Cosmopilot: An Extraterrestrial Navigator

# Inspiration
Cosmopilot is inspired by the rapid increase in spacecraft launches and interplanetary plans. The app is designed for the "everyday spacefarer" who wants to travel on undeveloped planets.

# What it does
Cosmopilot is a navigation app that uses satellite topographical data to create safe and efficient paths for surface vehicles on the planets. It's essentially Google Maps, but for Mars!

# How we built it
We built the software using Google's Flutter Platform. This allowed us to create an Android/iOS-friendly mobile app with a quick turnaround and easy-to-use GUI elements. The path planner uses Dijkstra's algorithm to compute an efficient shortest path.

# Challenges we ran into
A significant challenge faced at the end of development was the integration of custom maps. The idea was that a user could upload their own map data, and the backend would be built in such a way that importing and converting to our internal data structure was possible. Unfortunately, the Dart environment used in development had difficulty recognizing entire portions of the repository and ignored the existence of data files.

String fPath = path.join("assets", "datafiles", filename).toString(); File file = File(fPath);

The above code is standard in Dart, simply assembling a path in the system's native style, and opening that path for fetching the file. This code ran perfectly when ran from an internal main function, but the application-facing main refused to acknowledge that files existed there.

# Accomplishments that we're proud of
We are proud of completing the challenge within the 24-hour period, as we only began coding the morning of the hackathon!

# What we learned
We learned many important features about app development, including the Dart programming language, the Android App Development interface, and general programming practices.

# What's next for Cosmopilot: An Extraterrestial Navigator
We aim to implement a feature where users can import their own custom topographical maps. We also aim to use more advanced algorithms such as A* and RRT search.
