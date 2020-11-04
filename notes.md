# Questions

- Does the speed of the meteors correspond to the download / upload speed?
- Why download first?
- What do the second and third tab do?
- What does the forward button beside the server icon do?
- How is the server picked?
- What is the correct test length?
- Likeve only shows up on the result under telco company name

# Future Improvements

- In the summary screen comparing against previous tests / others
- light mode, other phones support, iPad, and landscape support
- match fonts
- make tab bar icons bigger
- higher rez images
- different highlights for indicating good scores versus poor
- adding a tail to the emitted values as they disappear
- make a smoother transition between the animations
- be able to handle different values for all the views.
- Fix the lack of a naming convention used in the assets catalog
- add tails to the animations to make them look nicer
- constrain again percent of screen size instead of alpha or number. This would allow the view to grow for all screens.
- Creating non linear animations
- Creating testable animations
- Potentially use [animateWithDuration](https://developer.apple.com/documentation/uikit/uiview/1622451-animatewithduration?language=occ), and [UIViewPropertyAnimator](https://developer.apple.com/documentation/uikit/uiviewpropertyanimator)

# Concerns

- How would the test and summary graph handle a really bad speed test?
- For the speed test screen what would the result look like if the speeds were drastically different?
- On the x axis of the summary view graph there are no units
- On the summary screen what is the value to the right of Jitter and Loss. These seem like bugs as ping does not have a value.

# To fix

- clean up the upload animation to make it more look like the spec
- add a start animation that shows both colors like the spec.
