# SyncFit

<center>
  
 SyncFit is a health memo app with a lot more to offer...
  


![4ee01701-40ee-437a-97f9-4dba9c63e93f](https://user-images.githubusercontent.com/74452705/200137653-faf746f9-ee4c-4189-a14f-d48c68544764.jpeg)




## Table of Contents

- [Inspiration](#inspiration)
- [What it does?](#what-it-does)
- [How we built it?](#how-we-built-it)
- [Challenges we ran into?](#challenges-we-ran-into)
- [Accomplishments that we're proud of?](#accomplishments-that-were-proud-of)
- [Installation](#installation)
- [What we learned?](#what-we-learned)
- [Future Scopes](#future-scopes)
- [Screenshots Time](#screenshots-time)
- [Contributing](#contributing)
- [License](#license)
- [About Us](#about-us)

## Inspiration
  
We were motivated by HackCBS 5.0 to see a widespread issue in health care: sharing routine updates with your primary care provider can be a terrible user experience. In order to create a reliable, approachable, and practical solution to keep track of your health, we wanted to use already existing technology and effortlessly combine them. Those suffering from one or more chronic conditions will find this to be extremely beneficial. 

## What it does?

When consumers are feeling uneasy or when their smartwatch detects a worrying change in their vital signs, <b>SyncFit</b> gives them a way to log their health situation. When you have an appointment with your healthcare provider, the user can use smart wearables to generate memos and share them with them. The memo's information is tailored to your health and what the doctor needs to know. As a result, your next meeting will be more fruitful and efficient because they will be able to inquire further and ask more better questions. Our app also offers many more services to allow our clients to lead a happy and healthy life, we offer an <b>Interactive Fun AI Yoga Trainer, Daily Fitness Recipies and Health Related Articles</b> to spread awareness about the need of exercise and good nutrition. We also provide a clean, modern and minimalistic approach to UI/UX to provide our users with a less bloated experience.

## How we built it?

  SyncFit incorporates multiple tech stacks and languages into one project.
  
  The user interface of our app was designed in Figma and coded in Flutter.
  
  Our backend is a dockerised Node application with a backup Flask server.
  
  We made our YOGA AI by using state of the art MoveNet(UltraFast pose detection technique) in python and then converted to JavaScript for better integration with our app.
  
  The recipes and health articles are displayed by using a web scraper made in python.
  
  Languages Used:
  - JavaScript
  - Dart
  - Python  

## Challenges we ran into?

Even though our team had knowledge of various techstacks, we still had quite a hurdles.

[Biswa](https://github.com/2002Bishwajeet) - For him, it was his first time creating such an extensive Flutter App with multiple modules and AI integration. He worked on UI and connecting the backend with the frontend.

[Harsh](https://github.com/harshsH-28) - For him, working with docker was a first time experience and he had quite a bit difficulty integrating FitBit API in NodeJs. Along with Biswa he connected the backend with frontend.  
  
[Khushiyant](https://github.com/Khushiyant) - He worked on designing the UI in Figma and that it was his first time using the software. He also dockerised the application which was a difficult task as he had to compose two backends. 

[Vidhu](https://github.com/Kranium2002) - He worked on the YOGA AI model and using movenet was a new challenge for him. Making the model compatible with NodeJs and resolving errors was also a challenging task. 
  
## Accomplishments that we're proud of?

We are proud that this application is working and our AI model is integrated so well with NodeJs and Flutter😄.

Since, we were using the FitBit Api for our application we are elated to say that our api integration works so well and we have tested our application with our own fitbit devices.
  
Since, our main backend was in Nodejs and our web scraping functions were using flask backend, creating a docker container using multiple backends was a slo a great task.
  
This was overall our biggest project with so many different tech stacks to integrate and the fact that our app works is a big achievement for us.  

## Installation

  You can just install the apk of this application ang you're good to go.
  

## What we learned?

Everyone learned something.

- **Biswa** learned about deploying and setting up a production server and making a complex UI.

- **Harsh** learned how to handle FitBit API and how to integrate AI with his app.

- **Khushiyant** learned more about Docker and web scraping.

- **Vidhu** learned how to use MoveNet and how to make it compatible with a Node backend.

## Future Scopes

Although this project is ready, there is always scope for more improvement

- We will try to add more poses into our yoga detection system.

- We will add feature to integrate with more smart wearable systems like wear os, apple os, samsung wearables, etc.

- We will add nutrition profile of our recipies and add more features like calorie tracking.

## 📸 Screenshots Time


## Contributing

Since this project was built during HackCBS 5.0, we would be seldomly improving this product. However we encourage you to contribute this repo and take it more as a tutorial of how this project was built. If you have any suggesstions or want to make some changes, feel free to create a PR or an issue.

## License

This project is MIT [Licensed](./LICENSE)

## About Us

We are The Powerpuff Boys
  
![Team_PICTURE_christmas](https://user-images.githubusercontent.com/74452705/200132978-9b40b5fd-83d0-44d2-906e-fdbe7ad2942b.png)

