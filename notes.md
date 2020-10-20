# Questions

- Does the speed of the meteors correspond to the download / upload speed?
- Why download first?
- What do the second and third tab do?
- What does the forward button beside the server icon do?
- How is the server picked?
- How to fake the data
- What is the correct test length?
- Likeve only shows up on the result under telco company name

# Future Improvements

- In the summary screen comparing against previous tests / others
- light mode, iPad, and landscape support
- match fonts
- make tab bar icons bigger
- different highlights for indicating good scores versus poor
- adding a tail to the emitted values as they disappear
- make a smoother transition between the animations
- slide the server and wifi view downs when the speed test starts
- grow the speed test view when it starts
- on speed test start have both upload and downloads showing, fade out the uploads and keep the downloads going.
- before the speed test start have the initial screen shown which would match the animation
- be able to handle different values for all the views.
- Split the view controller into multiple view controllers to handle the different parts of the screen.

# Concerns

- How would the test and summary graph handle a really bad speed test?
- For the speed test screen what would the result look like if the speeds were drastically different?
- On the x axis of the summary view graph there are no units
- On the summary screen what is the value to the right of Jitter and Loss. These seem like bugs as ping does not have a value.

# Not Implemented

- I like how the summary result screen takes up the whole screen. It covers the tabs. I find it slightly simplifies the view and navigation away from it.

# To fix

- The lack of a naming convention used in the assets catalog
- Containing the upload animation to only the top part of the view.
- clean up the upload animation to make it more look like the spec
- clean up the upload animation code
- add a start animation that shows both colors like the spec.
- clean up folder structure
