import express from "express";

const app = express();

app.use(express.static("./app/build/web"));

app.listen(3001);
