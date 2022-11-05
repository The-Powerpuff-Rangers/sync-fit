const express = require("express");
const router = express.Router();
const User = require("../models/User");
const {
  getActivity,
  getBreathingRate,
  getHeartRate,
  getHeartRateVar,
  getNutrition,
  getSleep,
  getSpo2,
  getTemp,
  getVo2,
} = require("../utils/Api");

router.get("/heartrate", async (req, res) => {
  try {
    const { userId } = req.body;
    const user = await User.find({ userId });
    const getHR = await getHeartRate(user[0].acs_token, userId);
    res.status(200).json(getHR.data);
  } catch (error) {
    console.log(error);
    res.status(400).json({ success: false, message: error });
  }
});

router.get("/activity", async (req, res) => {
  try {
    const { userId, date } = req.body;
    const user = await User.find({ userId });
    const getAc = await getActivity(userId, user[0].acs_token, date);
    res.status(200).json(getAc.data);
  } catch (error) {
    console.log(error);
    res.status(400).json({ success: false, message: error });
  }
});

router.get("/breathrate", async (req, res) => {
  try {
    const { userId, date } = req.body;
    const user = await User.find({ userId });
    const getBR = await getBreathingRate(user[0].acs_token, userId, date);
    res.status(200).json(getBR.data);
  } catch (error) {
    console.log(error);
    res.status(400).json({ success: false, message: error });
  }
});

router.get("/heartratevar", async (req, res) => {
  try {
    const { userId, date } = req.body;
    const user = await User.find({ userId });
    const getHRV = await getHeartRateVar(user[0].acs_token, userId, date);
    res.status(200).json(getHRV.data);
  } catch (error) {
    console.log(error);
    res.status(400).json({ success: false, message: error });
  }
});

router.get("/water", async (req, res) => {
  try {
    const { userId, date } = req.body;
    const user = await User.find({ userId });
    const getWater = await getNutrition(user[0].acs_token, userId);
    res.status(200).json(getWater.data);
  } catch (error) {
    console.log(error);
    res.status(400).json({ success: false, message: error });
  }
});

router.get("/sleep", async (req, res) => {
  try {
    const { userId, date } = req.body;
    const user = await User.find({ userId });
    const getsleep = await getSleep(user[0].acs_token, userId, date);
    res.status(200).json(getsleep.data);
  } catch (error) {
    console.log(error);
    res.status(400).json({ success: false, message: error });
  }
});

router.get("/spo2", async (req, res) => {
  try {
    const { userId, date } = req.body;
    const user = await User.find({ userId });
    const getspo2 = await getSpo2(user[0].acs_token, userId, date);
    res.status(200).json(getspo2.data);
  } catch (error) {
    console.log(error);
    res.status(400).json({ success: false, message: error });
  }
});

router.get("/temp", async (req, res) => {
  try {
    const { userId, date } = req.body;
    const user = await User.find({ userId });
    const gettemp = await getTemp(user[0].acs_token, userId, date);
    res.status(200).json(gettemp.data);
  } catch (error) {
    console.log(error);
    res.status(400).json({ success: false, message: error });
  }
});

router.get("/vo2", async (req, res) => {
  try {
    const { userId, date } = req.body;
    const user = await User.find({ userId });
    const getvo2 = await getVo2(user[0].acs_token, userId, date);
    res.status(200).json(getvo2.data);
  } catch (error) {
    console.log(error);
    res.status(400).json({ success: false, message: error });
  }
});

module.exports = router;
