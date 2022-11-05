const axios = require("axios");
require("dotenv");

const baseUrl = http://localhost:8080/api/fitness/heartratevar;

const getMyHeartRate = async(userId,date)=>{
    try {
       const myHrData = await axios.get("http://localhost:8080/api/fitness/heartratevar");
       return myHrData;
    } catch (error) {
        console.log("Something wrong with myApi");
        console.log(error);
    }
};
