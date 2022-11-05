require("dotenv").config();

const express = require("express");
const bodyParser = require("body-parser");
const mongoose = require("mongoose");
const cors = require("cors");
const cronSchedule = require("./utils/JobSchedular");

const app = express();
const port = process.env.PORT || 8080;
const dbUrl = process.env.DB_URL;

mongoose
  .connect(dbUrl)
  .then((res) => {
    console.log("Database Connected");
  })
  .catch((err) => {
    console.log("Database Error");
    console.log(err);
  });

app.use(cors());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

app.use("/", require("./routes/User"));
app.use("/fitness", require("./routes/Fitness"));

app.get("/", (req, res) => {
  // res.status(200).json({ Harsh: "hemlo" });
  res.status(200).json({ ok: "hi" });
});

app.listen(port, () => {
  console.log(`Server is Running on port ${port}`);
});
