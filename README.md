# sleep-calculator
CS50 final project

![Youtube Video example](https://youtu.be/D72GusFzTOc)

This flutter-based Android app calculates how long a user should sleep to feel rested based on the times they wish to go to bed or wake up. 

### Background
Everyone has heard that the average adult needs about 7-9 hours of sleep each night to feel rested, but why? Those hours are not simply how long we should sleep but how many **sleep cycles** are vital for our physical and mental health. These cycles, called NREM (non-rapid eye movement) and REM (rapid eye movement), are split up into 4 unique stages.
1. **NREM 1**: The middle ground between sleep and wake
2. **NREM 2**: Sleep actually starts here. Your heart rate and temperature drop and your breathing falls into a slow pattern. This cycle lasts around 20-25 minutes but increases with each cycle.
3. **NREM 3**: The common term for this cycle is Deep Sleep. Deep sleep is where the best restoring sleep happens, causing physical recovery. This stage is the hardest to wake up from, but if you are woken up from a deep sleep then you can expect mental fogginess.
4. **REM**: This is the second part of a sleep cycle and takes about 25% of our total sleep time. This is where memory consolidation happens along with dreams. Despite being unconscious, this is unrestful sleep. Rapid eye movement occurs when you dream or when you process events of the day into long-term memories. 

These four stages equal one sleep cycle and each cycle should repeat 4-6 times every night. Each cycle should be about 90-120 minutes long. For this app, we use 90-minute intervals but this won't be 100% accurate for everyone. Factors such as age, genetics, lifestyle, and health can change the duration of each cycle. 

Adequate sleep allows our brain to knit together the thoughts and ideas of the day. Our subconscious is very active while we sleep. 

#### A note on when you should sleep
For example, the bedtime I use is 10 pm. Why 10 pm exactly? This lines up with what's called the **Circadian Rhythm**. The circadian rhythm is a natural process that regulates sleep cycle length and when it should be repeated. 10 pm to 6 am roughly lines up with when it gets dark and when the sun rises. 

The circadian rhythm changes based on the person. It can vary based on location, lifestyle habits, and hormone production. You can control and reset your circadian by changing your waking and sleeping times when you eat and exercise, and what kind of natural light you expose yourself to. If you can get a natural rhythm established, then your body will feel automatically sleepy and wake up during your preferred times. 

Because of the circadian rhythm, it technically doesn't matter what times you select in this app. What truly matters is keeping a constant schedule. 

### The App
The app itself is built using Flutter, specifically for Android using the material design widgets. This is my first time making a mobile app and using Flutter/Dart. I wanted to challenge myself to create something using a new software using the skills I learned in CS50. 

Two main buttons on the home page prompt the user to input a time on a 12-hour am/pm clock using the `showTimePicker` method provided by the material app package provided by Flutter. The first button will ask for a time the user wishes to go to bed. The other asks when the user wants to wake up. 

Those times are then passed through some utility functions stored in the `utils` directory that return 3 different times. If the user is going to bed at 22:00 then the function will add:
- 6 hours and 15 minutes
- 7 hours and 45 minutes
- 9 hours and 15 minutes

This provides 4, 5, and 6 sleep cycles respectively. Each sleep cycle amounts to 90-minute intervals. The recommended sleep cycle amount is 5, which is indicated in the output. The output is placed above the buttons in a list. Using either button again will erase the previous output. 

There are only 3 main files, all stored in the lib/ folder. The first is `main.dart` which is where the code is executed. `home.dart` is the bulk of the code, storing the homepage stateful widget, the buttons, the clock pop-up, the app bar, and other stylistic features. The final file is `time_calculations.dart` which stores the class and methods used to calculate wake-up times and bedtimes. Flutter is Object-oriented so almost everything is stored inside of classes. 
