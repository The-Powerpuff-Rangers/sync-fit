const cron = require("node-cron");
const nodemailer = require("nodemailer");
const axios = require("axios");
require("dotenv");

const transporter = nodemailer.createTransport({
  service: "hotmail",
  auth: {
    user: "healthMemoApp32434@outlook.com",
    pass: process.env.EMAILPASS,
  },
});

// For Sending Every 24 Hour Request

const every24Hrs = () => {
  console.log("Task Completed");
  // After that my task
  const options = {
    from: "healthMemoApp32434@outlook.com",
    to: "harshsharma6419@gmail.com",
    subject: "Sending you a test email",
    text: "Welcome to Msit",
  };

  transporter.sendMail(options, (err, res) => {
    if (err) {
      console.log(err);
      return;
    }
    console.log("Sent: " + res.response);
  });
};

cron.schedule("50 23 * * *", () => {
  every24Hrs();
});

// For Sending every week request
cron.schedule("50 23 * * Sun", () => {
  console.log("Hemlo");
});
