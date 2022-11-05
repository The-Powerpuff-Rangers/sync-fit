const axios = require("axios");
require("dotenv");

const baseUrl = http://localhost:8080/api/fitness/heartratevar;

const getMyHeartRate = async (userId, date) => {
  try {
    const myHrData = await axios.get(
      "http://localhost:8080/api/fitness/heartrate"
    );
    return myHrData;
  } catch (error) {
    console.log("Something wrong with myApi");
    console.log(error);
  }
};

const getMyBreathingRate = async (userId, date) => {
  try {
    const myBreathingRate = await axios.get(
      "http://localhost:8080/api/fitness/breathrate"
    );
    return myBreathingRate;
  } catch (error) {}
};

const getMyActivity = async(userId,date)=>{
    try {
        const myActivity = await axios.get("http://localhost:8080/api/fitness/activity");
        return myActivity;
    } catch (error) {
        
    }
}

const getMyheartRateVar = async(userId,date)=>{
    try {
        const myHrvData = await axios.get("http://localhost:8080/api/fitness/heartratevar");
        return myHrvData;
    } catch (error) {
        
    }
}

const getMyWater = async(userId,date)=>{
    try {
        const myWaterLog = await axios.get("http://localhost:8080/api/fitness/water");
        return myWaterLog;
    } catch (error) {
        
    }
}

const getMySleep = async(userId,date)=>{
    try {
        const mySleep = await axios.get("http://localhost:8080/api/fitness/sleep");
        return mySleep;
    } catch (error) {
        
    }
}

const getMySpo2 = async(userId,date)=>{
    try {
        const mySpo2 = await axios.get("http://localhost:8080/api/fitness/spo2");
        return mySpo2;
    } catch (error) {
        
    }
}

const getMyTemp = async(userId,date)=>{
    try {
        const myTemp = await axios.get("http://localhost:8080/api/fitness/temp");
        return myTemp;
    } catch (error) {
        
    }
}

const getMyVo2 = async(userId,date)=>{
    try {
        const myVo2 = await axios.get("http://localhost:8080/api/fitness/vo2");
        return myVo2;
    } catch (error) {
        
    }
}