const mongoose = require("mongoose");

const UserSchema = new mongoose.Schema({
  userId: {
    type: String,
    required: true,
  },
  name: {
    type: String,
    required: true,
  },
  email: {
    type: String,
    required: true,
    unique: true,
  },
  docEmail: {
    type: String,
    required: true,
  },
  gender: {
    type: String,
    required: true,
  },
  age: {
    type: Number,
  },
  weight: {
    type: Number,
  },
  p_no: {
    type: Number,
    required: true,
  },
  acs_token: {
    type: String,
    required: true,
  },
  rfh_token: {
    type: String,
    required: true,
  },
  fitness: {
    activity: [
      {
        type: Object,
      },
    ],
    breathingRate: [
      {
        type: Object,
      },
    ],
    vo2: [
      {
        type: Object,
      },
    ],
    heartRate: [
      {
        type: Object,
      },
    ],
    heartRateVar: [
      {
        type: Object,
      },
    ],
    nutrition: [
      {
        type: Object,
      },
    ],
    sleep: [
      {
        type: Object,
      },
    ],
    spo2: [
      {
        type: Object,
      },
    ],
    temp: [
      {
        type: Object,
      },
    ],
  },
});

module.exports = mongoose.model("User", UserSchema);
