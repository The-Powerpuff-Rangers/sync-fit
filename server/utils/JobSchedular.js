const cron = require("node-cron");
const nodemailer = require("nodemailer");
const axios = require("axios");
const User = require("../models/User");
require("dotenv");
const {
  getMyActivity,
  getMyBreathingRate,
  getMyHeartRate,
  getMySleep,
  getMySpo2,
  getMyTemp,
  getMyVo2,
  getMyWater,
  getMyheartRateVar,
} = require("./myApi");

const transporter = nodemailer.createTransport({
  service: "hotmail",
  auth: {
    user: "healthMemoApp32434@outlook.com",
    pass: process.env.EMAILPASS,
  },
});

// For Sending Every 24 Hour Request

const every24Hrs = () => {
  const date = new Date();
  const myDate = date.getDate;
  const everyDocument = User.find({}, (err, users) => {
    users.forEach((user) => {
      const docemail = user.docEmail;
      const user_id = user.userId;
      const HrData = getMyHeartRate(user_id, date);
      const HrvData = getMyheartRateVar(user_id, date);
      const AcData = getMyActivity(user_id, myDate);
      const BrData = getBreathingRate(user_id, myDate);
      const SleepData = getMySleep(user_id, myDate);
      const Spo2Data = getMySpo2(user_id, myDate);
      const TempData = getMyTemp(user_id, myDate);
      const Vo2Data = getMyVo2(user_id, myDate);
      const WaterLog = getMyWater(user_id, myDate);

      const options = {
        from: "healthMemoApp32434@outlook.com",
        to: "harshsharma6419@gmail.com",
        subject: `Health Report(${user.name}), Date: ${myDate} ${date.getMonth}`,
        text: `Heart Rate  -----  
        Out of Range`,
      };

      transporter.sendMail(options, (err, res) => {
        if (err) {
          console.log(err);
          return;
        }
        console.log("Sent: " + res.response);
      });
    });
  });
};

cron.schedule("59 23 * * *", () => {
  every24Hrs();
});

// For Sending every week request
cron.schedule("50 23 * * Sun", () => {
  console.log("Hemlo");
});
