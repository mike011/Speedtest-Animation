![](data:image/jpeg;base64,IyBTcGVlZHRlc3QtQW5pbWF0aW9uCldyaXRlIHRoZSBTd2lmdCBjb2RlIHRvIGxvb2sgbGlrZTogaHR0cHM6Ly93d3cudXBsYWJzLmNvbS9wb3N0cy9zcGVlZHRlc3QtYW5pbWF0aW9uCg==)

# Journal

## Oct 15th
- Recieved link to [Speed Test Animation](https://www.uplabs.com/posts/speedtest-animation)
- Watch video numerous times
- Started thinking about major parts and what I liked to work on first.

## Oct 16th

### Initial Screen Breakdown
![](./images/startLayout.png)

This screen is inside of a tab bar view controller. You can see there are three tabs in section 4. The demo is on the first tab which I'm going to call the SpeedTestViewController. The second and third tab are not demoed. The screen shown is composed of two screens. In section 1 the animated image view on the top (the MeteorView). In section 2 and 3 there is the labels and start button.

### User Experience

This is super straight forward, the start button is clicked and the download test is ran, then the upload test is ran. When the tests are finished the screen automatically transition to a test summary view (SpeedTestSummaryView).

### Speed Test Animation Breakdown

When the speed test starts there is a quick animation on the button. Then on the top part of the MeteorView and overlay is shown with the ping, jitter, and loss. Also another overlay is shown from the bottom showing the speed. Also the down arrow is shown in the middle of the animation with the blue meteors moving toward it.
![](./images/up.png)<br>
After the download test is complete an upload test is started. The middle arrow flips and meteors become purple and start moving away. The overlay values are still updated. <br>
![](./images/down.png) <br>
When the test is done the view transitions to the summary view.

### Speed Test Summary Breakdown
This screen shows the result of running the speed. In section 1 it shows the average download and upload speeds. In section 2 an animated graph of the speeds achieved through out the test. In section 3 the average ping, jitter, and % loss, the wireless carrier, and I think it's the name of the wifi endpoint. Finally in section 4 there are two buttons one to go back to the speed test and one to share the results of the test.

![](./images/summary.png) <br>

# Oct 17

Let's write some code!!! Enough of breaking it down. I want to get my feet wet. First thing I did was create a new project. Then in story board I added a tab bar view controller. Also in the info.plist I set the appearance to dark, so the app only supports dark mode and only portrait for iPhone. I also create a new [notes](notes.md) file to keep track of improvements, concerns, and questions. Then added the start button which I had some struggles matching the colors for it and it's glow. The server, wifi, and title were easily added. I think they look good. Next up is the SpeedTestView which after some playing around with an [old project](https://github.com/mike011/AnimationPreview) of mine in which I did a bunch of animations I'm confident I can replicate the upload animation using a CAEmitterLayer. I'm not sure how to do the download animation as the particles are not emitted from a source and converge on a point.
