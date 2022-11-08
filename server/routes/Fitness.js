const { json } = require("express");
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
  getNewAccess,
} = require("../utils/Api");

router.get("/heartrate/:id", async (req, res) => {
  try {
    const userId = req.params.id;
    const user = await User.findOne({ userId });
    const getHR = await getHeartRate(user.acs_token, userId);
    const resultJson = getHR.data["activities-heart"][0].value.heartRateZones;
    const resultData = {};
    for (let i = 0; i < 4; i++) {
      const data = resultJson[i].name;
      resultData[data] = resultJson[i];
    }
    await User.updateOne({ userId }, { $push: { heartRate: resultData } });
    res.status(200).json(resultData);
  } catch (error) {
    console.log(error);
    res.status(400).json({ success: false, message: error });
  }
});

router.get("/activity/:id/:date", async (req, res) => {
  try {
    const userId = req.params.id;
    const date = req.params.date;
    const user = await User.findOne({ userId });
    const getAc = await getActivity(userId, user.acs_token, date);
    if (getAc === "expired_token") {
      console.log("helo");
      const getNewToken = await getNewAccess(user.rfh_token);
      await User.updateOne(
        { userId },
        {
          $set: {
            rfh_token: getNewToken.refresh_token,
            acs_token: getNewToken.access_token,
          },
        }
      );
      const getAc = await getActivity(userId, user[0].acs_token, date);
      const myActivity = {
        activityCalories: getAc.data.summary.activityCalories,
        caloriesBMR: getAc.data.summary.caloriesBMR,
        caloriesOut: getAc.data.summary.caloriesOut,
      };
      await User.updateOne({ userId }, { $push: { activity: myActivity } });
      res.status(200).json(myActivity);
    }
    const myActivity = {
      activityCalories: getAc.data.summary.activityCalories,
      caloriesBMR: getAc.data.summary.caloriesBMR,
      caloriesOut: getAc.data.summary.caloriesOut,
    };
    await User.updateOne({ userId }, { $push: { activity: myActivity } });
    res.status(200).json(myActivity);
  } catch (error) {
    console.log(error);
    res.status(400).json({ success: false, message: error.response.data });
  }
});

router.get("/breathrate/:id/:date", async (req, res) => {
  try {
    const userId = req.params.id;
    const date = req.params.date;
    const user = await User.findOne({ userId });
    const getBR = await getBreathingRate(user.acs_token, userId, date);
    if (getBR.data.br !== []) {
      const resultJson = {};
      resultJson.value = getBR.data.br[0].value;
      resultJson.value = getBR.date.br[0].dateTime;
      await User.updateOne({ userId }, { $push: { heartRate: resultJson } });
    }
    res.status(200).json(resultJson);
  } catch (error) {
    console.log(error);
    res.status(400).json({ success: false, message: error });
  }
});

router.get("/heartratevar/:id/:date", async (req, res) => {
  try {
    const userId = req.params.id;
    const date = req.params.date;
    const user = await User.findOne({ userId });
    const getHRV = await getHeartRateVar(user.acs_token, userId, date);
    res.status(200).json(getHRV.data);
  } catch (error) {
    console.log(error);
    res.status(400).json({ success: false, message: error });
  }
});

router.get("/water/:id", async (req, res) => {
  try {
    const userId = req.params.id;
    const date = req.params.date;
    const user = await User.findOne({ userId });
    const getWater = await getNutrition(user.acs_token, userId);
    res.status(200).json(getWater.data);
  } catch (error) {
    console.log(error);
    res.status(400).json({ success: false, message: error });
  }
});

router.get("/sleep/:id/:date", async (req, res) => {
  try {
    const userId = req.params.id;
    const date = req.params.date;
    const user = await User.findOne({ userId });
    const getsleep = await getSleep(user.acs_token, userId, date);
    res.status(200).json(getsleep.data.sleep);
  } catch (error) {
    console.log(error);
    res.status(400).json({ success: false, message: error });
  }
});

router.get("/spo2/:id/:date", async (req, res) => {
  try {
    const userId = req.params.id;
    const date = req.params.date;
    const user = await User.findOne({ userId });
    const getspo2 = await getSpo2(user.acs_token, userId, date);
    res.status(200).json(getspo2.data);
  } catch (error) {
    console.log(error);
    res.status(400).json({ success: false, message: error });
  }
});

router.get("/temp/:id/:date", async (req, res) => {
  try {
    const userId = req.params.id;
    const date = req.params.date;
    const user = await User.findOne({ userId });
    const gettemp = await getTemp(user.acs_token, userId, date);
    res.status(200).json(gettemp.data);
  } catch (error) {
    console.log(error);
    res.status(400).json({ success: false, message: error });
  }
});

router.get("/vo2/:id/:date", async (req, res) => {
  try {
    const userId = req.params.id;
    const date = req.params.date;
    const user = await User.findOne({ userId });
    const getvo2 = await getVo2(user.acs_token, userId, date);
    res.status(200).json(getvo2.data);
  } catch (error) {
    console.log(error);
    res.status(400).json({ success: false, message: error });
  }
});

router.get("/yellowbar/:id/:date", async (req, res) => {
  try {
    const userId = req.params.id;
    const date = req.params.date;
    const user = await User.findOne({ userId });
    const getYellowCardData = await getActivity(userId, user.acs_token, date);
    res.status(200).json({
      status: "success",
      stepGoal: getYellowCardData.data.goals.steps,
      step: getYellowCardData.data.summary.steps,
      distance: getYellowCardData.data.summary.distances[0].distance,
      calories: getYellowCardData.data.summary.caloriesOut,
    });
  } catch (error) {
    console.log(error);
    res.status(400).json({ success: false, message: error });
  }
});

module.exports = router;
