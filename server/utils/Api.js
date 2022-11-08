const axios = require("axios");
require("dotenv");

// Extra api's for getting the Data

const getAccessToken = async (authCode) => {
  try {
    const clientCode = process.env.BASE64AUTH;
    const data = {};
    const params = new URLSearchParams({
      client_id: process.env.ClientId,
      code: `${authCode}`,
      grant_type: "authorization_code",
      redirect_uri: "http://localhost:3000",
    }).toString();
    const baseUrl = `https://api.fitbit.com/oauth2/token?${params}`;
    const jsonData = await axios.post(baseUrl, data, {
      headers: {
        Authorization: `Basic ${clientCode}`,
        "Content-Type": "application/x-www-form-urlencoded",
      },
    });
    return jsonData.data;
  } catch (error) {
    console.log("Something is wrong with the fitbit request");
    console.log(error);
  }
};

const userData = async (accessToken, userId) => {
  try {
    const baseUrl = `https://api.fitbit.com/1/user/${userId}/profile.json`;
    const userJsonData = await axios.get(baseUrl, {
      headers: {
        authorization: `Bearer ${accessToken}`,
      },
    });
    return userJsonData.data;
  } catch (error) {
    console.log("Something is wrong with the fitbit request");
    console.log(error);
  }
};

const getNewAccess = async (ref_token) => {
  const clientCode = process.env.BASE64AUTH;
  const data = {};
  const params = new URLSearchParams({
    grant_type: "refresh_token",
    refresh_token: ref_token,
  }).toString();
  const baseUrl = `https://api.fitbit.com/oauth2/token?${params}`;
  const newAccessToken = await axios.post(baseUrl, data, {
    headers: {
      Authorization: `Basic ${clientCode}`,
      "Content-Type": "application/x-www-form-urlencoded",
    },
  });
  return newAccessToken.data;
};

const getActivity = async (userId, accessToken, date) => {
  try {
    const baseUrl = `https://api.fitbit.com/1/user/${userId}/activities/date/${date}.json`;
    const userAcData = await axios.get(baseUrl, {
      headers: {
        authorization: `Bearer ${accessToken}`,
      },
    });
    return userAcData;
  } catch (error) {
    if (error.response.data.errors[0].errorType === "expired_token") {
      return "expired_token";
    }
    console.log("Something is wrong with the fitbit request");
    console.log(error);
  }
};

const getBreathingRate = async (accessToken, userId, date) => {
  try {
    const baseUrl = `https://api.fitbit.com/1/user/${userId}/br/date/${date}.json`;
    const userBrData = await axios.get(baseUrl, {
      headers: {
        authorization: `Bearer ${accessToken}`,
      },
    });
    return userBrData;
  } catch (error) {
    console.log("Something is wrong with the fitbit request");
    console.log(error);
  }
};

const getVo2 = async (accessToken, userId, date) => {
  try {
    const baseUrl = `https://api.fitbit.com/1/user/${userId}/cardioscore/date/${date}.json`;
    const userVo2Data = await axios.get(baseUrl, {
      headers: {
        authorization: `Bearer ${accessToken}`,
      },
    });
    return userVo2Data;
  } catch (error) {
    console.log("Something is wrong with the fitbit request");
    console.log(error);
  }
};

const getHeartRate = async (accessToken, userId) => {
  try {
    const baseUrl = `https://api.fitbit.com/1/user/${userId}/activities/heart/date/today/1d.json`;
    const userHrData = await axios.get(baseUrl, {
      headers: {
        authorization: `Bearer ${accessToken}`,
      },
    });
    return userHrData;
  } catch (error) {
    console.log("Something is wrong with the fitbit request");
    console.log(error);
  }
};

const getHeartRateVar = async (accessToken, userId, date) => {
  try {
    const baseUrl = `https://api.fitbit.com/1/user/${userId}/hrv/date/${date}.json`;
    const userHrvData = await axios.get(baseUrl, {
      headers: {
        authorization: `Bearer ${accessToken}`,
      },
    });
    return userHrvData;
  } catch (error) {
    console.log("Something is wrong with the fitbit request");
    console.log(error);
  }
};

const getNutrition = async (accessToken, userId) => {
  try {
    const baseUrl = `https://api.fitbit.com/1/user/${userId}/foods/log/water/date/today/1d.json`;
    const userWaterData = await axios.get(baseUrl, {
      headers: {
        authorization: `Bearer ${accessToken}`,
      },
    });
    return userWaterData;
  } catch (error) {
    console.log("Something is wrong with the fitbit request");
    console.log(error);
  }
};

const getSleep = async (accessToken, userId, date) => {
  try {
    const baseUrl = `https://api.fitbit.com/1/user/${userId}/sleep/date/${date}.json`;
    const userSleepData = await axios.get(baseUrl, {
      headers: {
        authorization: `Bearer ${accessToken}`,
      },
    });
    return userSleepData;
  } catch (error) {
    console.log("Something is wrong with the fitbit request");
    console.log(error);
  }
};

const getSpo2 = async (accessToken, userId, date) => {
  try {
    const baseUrl = `https://api.fitbit.com/1/user/${userId}/spo2/date/${date}.json`;
    const userSpo2Data = await axios.get(baseUrl, {
      headers: {
        authorization: `Bearer ${accessToken}`,
      },
    });
    return userSpo2Data;
  } catch (error) {
    console.log("Something is wrong with the fitbit request");
    console.log(error);
  }
};

const getTemp = async (accessToken, userId, date) => {
  try {
    const baseUrl = `https://api.fitbit.com/1/user/${userId}/temp/core/date/${date}.json`;
    const userTempData = await axios.get(baseUrl, {
      headers: {
        authorization: `Bearer ${accessToken}`,
      },
    });
    return userTempData;
  } catch (error) {
    console.log("Something is wrong with the fitbit request");
    console.log(error);
  }
};

module.exports = {
  getAccessToken,
  userData,
  getNewAccess,
  getActivity,
  getBreathingRate,
  getHeartRate,
  getHeartRateVar,
  getNutrition,
  getSleep,
  getSpo2,
  getTemp,
  getVo2,
};
