
# CyberCoffee
## App Design
https://www.figma.com/file/WGNJrvEOeYuUlCBZDtmKPX/Starbucks-Redesign-Mobil-App-(Community)?node-id=13%3A6637
## App Name and App Icons

Application name should be CyberCoffee.

You can use any photo as app icon. Here is a link on how to do it:
https://stackoverflow.com/questions/43928702/how-to-change-the-application-launcher-icon-on-flutter

# Data
I created a json file (you can think of it as json file from service)
How to get data from json file in flutter search this.

Also search for the MVVM design pattern.
I created sample files for you. I want to see this on all pages.


## Splash Screen

When opening the application in Flutter, first the white screen comes and then our application.
The white here is the splash screen created by ios and android. You need to change it to native. Example usage. Try to change it according to the design.
https://www.youtube.com/watch?v=i2bg4eDn04M

## Introduction Screen

I got the design from another project. Do it with the PageView widget. Adjust the colors according to the colors in the project. Add coffee to the photos and you can put the texts randomly.
You need to show this page to the user once. Save it with Sharedpreference and it will only appear once. If the application is opened again after it appears, proceed as splash->login or splash-> home view.


## Login

Make the design dynamic for all phone sizes.
Also Put the remember me checkbox to the left of the forgot password.
If checkbox checked with this package enable auto login
https://pub.dev/packages/shared_preferences



#### Checklist

- [ ]  Email regex
- [ ]  Password regex (must be higher than 8 characters also needs 1 uppercase letter)
- [ ]  Show/hide password logic
- [ ]  Atomic design (extract button to the custom button widget)
- [ ]  Creating login model (Create fromJson and toJson functions and parse data)
- [ ]  If the password is wrong, give the wrong message with alert
- [ ]  Loading when fetching data

## Profile page
Make one of the bottom bar a profile page. The design is up to you find a beautiful design from the dribble. Pull data from user json and display it on screen.
User get 1 free coffee for 10 coffee points. Show how many points you have with stars on the profile page and show how many points you have left. You can use this package
https://pub.dev/packages/flutter_rating_bar

Add user comments to the profile page as well.


Make the remaining pages with hardcopy data. Later, I will try to find an api for you and add it from there.

## Some tips

- Create your own color theme. All appbars in the app are white. You can get around this by changing it in the main.dart file instead of changing it on each page individually. You can research how to do it.
- Ask each other: the best way to learn is to pass on what you know.
- Do not depend on design. Include your own ideas and perspective.
- DRY - Don't Repeat Yourself. Never rewrite the same code. Separate it as widget or function.
- A lot of people have probably experienced the problem you're having. feel free to ask, read the stackoverflow and the official docs. Read the details of the widget by ctrl + click on the widget you are using, try to understand how it was made.  
