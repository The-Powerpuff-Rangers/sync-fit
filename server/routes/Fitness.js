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
    if (getHR === "expired_token") {
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
      const getHR = await getHeartRate(user.acs_token, userId);
      const resultJson = getHR["activities-heart"][0].value.heartRateZones;
      const resultData = {};
      for (let i = 0; i < 4; i++) {
        const data = resultJson[i].name;
        resultData[data] = resultJson[i];
      }
      await User.updateOne({ userId }, { $push: { heartRate: resultData } });
      res.status(200).json(resultData);
    }
    const resultJson = getHR["activities-heart"][0].value.heartRateZones;
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
        activityCalories: getAc.summary.activityCalories,
        caloriesBMR: getAc.summary.caloriesBMR,
        caloriesOut: getAc.summary.caloriesOut,
      };
      await User.updateOne({ userId }, { $push: { activity: myActivity } });
      res.status(200).json(myActivity);
    }
    const myActivity = {
      activityCalories: getAc.summary.activityCalories,
      caloriesBMR: getAc.summary.caloriesBMR,
      caloriesOut: getAc.summary.caloriesOut,
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
    if (getBR === "expired_token") {
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
      const getBR = await getBreathingRate(user.acs_token, userId, date);
      if (getBR.br.length !== 0) {
        const resultJson = {
          breathingRate: getBR.br[0].value.breathingRate,
          date: getBR.br[0].dateTime,
        };
        await User.updateOne(
          { userId },
          { $push: { breathingRate: resultJson } }
        );
        res.status(200).json(resultJson);
      }
      res
        .status(200)
        .json({ status: "failure", message: "No Breathing Data Found" });
    }
    if (getBR.br.length !== 0) {
      const resultJson = {
        breathingRate: getBR.br[0].value.breathingRate,
        date: getBR.br[0].dateTime,
      };
      await User.updateOne(
        { userId },
        { $push: { breathingRate: resultJson } }
      );
      res.status(200).json(resultJson);
    }
    res
      .status(200)
      .json({ status: "failure", message: "No Breathing Data Found" });
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
    if (getHRV === "expired_token") {
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
      const getHRV = await getHeartRateVar(user.acs_token, userId, date);
      if (getHRV.hrv.length !== 0) {
        const resultJson = {
          dailyRmssd: getHRV.hrv[0].value.dailyRmssd,
          deepRmssd: getHRV.hrv[0].value.deepRmssd,
          date: getHRV.hrv[0].dateTime,
        };
        await User.updateOne(
          { userId },
          { $push: { heartRateVar: resultJson } }
        );
        res.status(200).json(resultJson);
      }
      res.status(200).json({
        status: "failure",
        message: "No Heart Rate Variability Data Found",
      });
    }
    if (getHRV.hrv.length !== 0) {
      const resultJson = {
        dailyRmssd: getHRV.hrv[0].value.dailyRmssd,
        deepRmssd: getHRV.hrv[0].value.deepRmssd,
        date: getHRV.hrv[0].dateTime,
      };
      await User.updateOne({ userId }, { $push: { heartRateVar: resultJson } });
      res.status(200).json(resultJson);
    }
    res.status(200).json({
      status: "failure",
      message: "No Heart Rate Variability Data Found",
    });
  } catch (error) {
    console.log(error);
    res.status(400).json({ success: false, message: error });
  }
});

router.get("/water/:id/:date", async (req, res) => {
  try {
    const userId = req.params.id;
    const date = req.params.date;
    const user = await User.findOne({ userId });
    const getWater = await getNutrition(user.acs_token, userId, date);
    if (getWater === "expired_token") {
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
      const getWater = await getNutrition(user.acs_token, userId, date);
      const resultData = {
        waterLog: getWater.summary.water,
      };
      await User.updateOne({ userId }, { $push: { nutrition: resultData } });
      res.status(200).json(resultData);
    }
    const resultData = {
      waterLog: getWater.summary.water,
    };
    await User.updateOne({ userId }, { $push: { nutrition: resultData } });
    res.status(200).json(resultData);
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
    if (getsleep === "expired_token") {
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
      const getsleep = await getSleep(user.acs_token, userId, date);
      if (getsleep.sleep.length !== 0) {
        const resultData = {
          date,
          awakeCount: getsleep.sleep[0].awakeCount,
          awakeDuration: getsleep.sleep[0].awakeDuration,
          awakeningsCount: getsleep.sleep[0].awakeningsCount,
          duration: getsleep.sleep[0].duration,
          efficiency: getsleep.sleep[0].efficiency,
          minutesAsleep: getsleep.sleep[0].minutesAsleep,
          minutesAwake: getsleep.sleep[0].minutesAwake,
          restlessCount: getsleep.sleep[0].restlessCount,
          restlessDuration: getsleep.sleep[0].restlessDuration,
          totalMinutesAsleep: getsleep.summary.totalMinutesAsleep,
          totalSleepRecords: getsleep.summary.totalSleepRecords,
          totalTimeInBed: getsleep.summary.totalTimeInBed,
        };
        await User.updateOne({ userId }, { $push: { sleep: resultData } });
        res.status(200).json(resultData);
      }
      res
        .status(200)
        .json({ status: "failure", message: "No sleep Data Found" });
    }
    if (getsleep.sleep.length !== 0) {
      const resultData = {
        date,
        awakeCount: getsleep.sleep[0].awakeCount,
        awakeDuration: getsleep.sleep[0].awakeDuration,
        awakeningsCount: getsleep.sleep[0].awakeningsCount,
        duration: getsleep.sleep[0].duration,
        efficiency: getsleep.sleep[0].efficiency,
        minutesAsleep: getsleep.sleep[0].minutesAsleep,
        minutesAwake: getsleep.sleep[0].minutesAwake,
        restlessCount: getsleep.sleep[0].restlessCount,
        restlessDuration: getsleep.sleep[0].restlessDuration,
        totalMinutesAsleep: getsleep.summary.totalMinutesAsleep,
        totalSleepRecords: getsleep.summary.totalSleepRecords,
        totalTimeInBed: getsleep.summary.totalTimeInBed,
      };
      await User.updateOne({ userId }, { $push: { sleep: resultData } });
      res.status(200).json(resultData);
    }
    res.status(200).json({ status: "failure", message: "No sleep Data Found" });
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
    if (getspo2 === "expired_token") {
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
      const getspo2 = await getSpo2(user.acs_token, userId, date);
      if (Object.keys(getspo2).length !== 0) {
        const resultData = {
          date: getspo2.dateTime,
          min: getspo2.value.min,
          avg: getspo2.value.avg,
          max: getspo2.value.max,
        };
        await User.updateOne({ userId }, { $push: { spo2: resultData } });
        res.status(200).json(resultData);
      }
      res
        .status(200)
        .json({ status: "failure", message: "No Spo2 Data Found" });
    }
    if (Object.keys(getspo2).length !== 0) {
      const resultData = {
        date: getspo2.dateTime,
        min: getspo2.value.min,
        avg: getspo2.value.avg,
        max: getspo2.value.max,
      };
      await User.updateOne({ userId }, { $push: { spo2: resultData } });
      res.status(200).json(resultData);
    }
    res.status(200).json({ status: "failure", message: "No Spo2 Data Found" });
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
    if (gettemp === "expired_token") {
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
      const gettemp = await getTemp(user.acs_token, userId, date);
      if (gettemp.tempCore.length !== 0) {
        const resultData = {
          from: {
            dateTime: gettemp.tempCore[0].dateTime,
            temp: gettemp.tempCore[0].value,
          },
          to: {
            dateTime: gettemp.tempCore[1].dateTime,
            temp: gettemp.tempCore[1].value,
          },
        };
        await User.updateOne({ userId }, { $push: { temp: resultData } });
        res.status(200).json(resultData);
      }
      res
        .status(200)
        .json({ status: "failure", message: "No Temp Core Data Found" });
    }
    if (gettemp.tempCore.length !== 0) {
      const resultData = {
        from: {
          dateTime: gettemp.tempCore[0].dateTime,
          temp: gettemp.tempCore[0].value,
        },
        to: {
          dateTime: gettemp.tempCore[1].dateTime,
          temp: gettemp.tempCore[1].value,
        },
      };
      await User.updateOne({ userId }, { $push: { temp: resultData } });
      res.status(200).json(resultData);
    }
    res
      .status(200)
      .json({ status: "failure", message: "No Temp Core Data Found" });
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
    if (getvo2 === "expired_token") {
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
      const getvo2 = await getVo2(user.acs_token, userId, date);
      if (getvo2 !== "no_data") {
        const resultData = {
          date: cardioScore[0].dateTime,
          vo2Max: cardioScore[0].value.vo2Max,
        };
        await User.updateOne({ userId }, { $push: { vo2: resultData } });
        res.status(200).json(resultData);
      }
      res.status(200).json({
        status: "failure",
        message: "You Don't have Access to Vo2 or No Data Found",
      });
    }
    if (getvo2 !== "no_data") {
      const resultData = {
        date: cardioScore[0].dateTime,
        vo2Max: cardioScore[0].value.vo2Max,
      };
      await User.updateOne({ userId }, { $push: { vo2: resultData } });
      res.status(200).json(resultData);
    }
    res.status(200).json({
      status: "failure",
      message: "You Don't have Access to Vo2 or No Data Found",
    });
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
    if (getYellowCardData === "expired_token") {
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
      const getYellowCardData = await getActivity(userId, user.acs_token, date);
      res.status(200).json({
        status: "success",
        stepGoal: getYellowCardData.goals.steps,
        step: getYellowCardData.summary.steps,
        distance: getYellowCardData.summary.distances[0].distance,
        calories: getYellowCardData.summary.caloriesOut,
      });
    }
    res.status(200).json({
      status: "success",
      stepGoal: getYellowCardData.goals.steps,
      step: getYellowCardData.summary.steps,
      distance: getYellowCardData.summary.distances[0].distance,
      calories: getYellowCardData.summary.caloriesOut,
    });
  } catch (error) {
    console.log(error);
    res.status(400).json({ success: false, message: error });
  }
});

module.exports = router;
