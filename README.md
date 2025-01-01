# sleep-calculator
CS50 final project

https://youtu.be/D72GusFzTOc

This flutter-based Android app calculates how long a user should sleep to feel rested. There are two main buttons on the home page that both prompt the user to input a time on a 12-hour am/pm clock. The first button will ask for a time the user wishes to go to bed. The other asks when the user wants to wake up. 

Those times are then passed through some utility functions that return 3 different times. If the user is going to bed at 22:00 then the function will add 
- 6 hours and 15 minutes
- 7 hours and 45 minutes
- 9 hours and 15 minutes

This provides 4, 5, and 6 sleep cycles respectively. Each sleep cycle amounts to 90 minute intervals. The recommended sleep cycle amount is 5, which is indicated in the output. 

There are only 3 main files, all stored in the lib/ folder. The first is `main.dart` which is where the code is executed. `home.dart` is the bulk of the code, storing the homepage stateful widget, the buttons, clock pop-up, the appbar, and other stylistic features. The final file is `time_calculations.dart` which stores the class and methods used to calculated wake up times and bed times. 
