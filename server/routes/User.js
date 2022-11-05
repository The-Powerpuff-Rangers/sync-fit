const express = require("express");
const router = express.Router();
const { getAccessToken, userData } = require("../utils/Api.js");
const User = require("../models/User");

router.get("/", (req, res) => {
  res.status(200).json({ ok: "hi" });
});

router.post("/newuser", async (req, res) => {
  try {
    const { authCode, email, docEmail, mobileNo } = req.body;
    const tokenData = await getAccessToken(authCode);
    const UserData = await userData(tokenData.access_token, tokenData.user_id);
    const { age, dateOfBirth, fullName, gender, weight } = UserData.user;
    const newUser = await new User({
      userId: tokenData.user_id,
      name: fullName,
      email,
      docEmail,
      gender,
      p_no: mobileNo,
      acs_token: tokenData.access_token,
      rfh_token: tokenData.refresh_token,
      age,
      weight,
    });
    await newUser.save();
    res.status(200).send({ success: true });
  } catch (err) {
    console.log("Something went wrong during creating a new user");
    console.log(err);
    res.status(200).send({ success: false });
  }
});

module.exports = router;
