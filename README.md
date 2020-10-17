![](data:image/jpeg;base64,IyBTcGVlZHRlc3QtQW5pbWF0aW9uCldyaXRlIHRoZSBTd2lmdCBjb2RlIHRvIGxvb2sgbGlrZTogaHR0cHM6Ly93d3cudXBsYWJzLmNvbS9wb3N0cy9zcGVlZHRlc3QtYW5pbWF0aW9uCg==)

# Journal

## Oct 15th
- Recieved link to [Speed Test Animation](https://www.uplabs.com/posts/speedtest-animation)
- Watch video numerous times
- Started thinking about major parts and what I liked to work on first.

## Oct 16th

### Initial Screen Breakdown
![](./images/startLayout.png)

This screen is inside of a tab bar view controller. You can see there are three tabs in section 4. The demo is on the first tab which I'm going to call the SpeedTestView. The second and third tab are not demoed. The screen shown is composed of two screens. In section 1 the animated image view on the top (the MeteorView). In section 2 and 3 there is the labels and start button.

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