const client = require("twilio")(
  "ACeb4286c376ef472f6111e70722e4ecaa",
  "5c3ab726eeaff185869192b441c195f0"
);
try {
  client.messages
    .create({
      from: "+12673290739",
      to: "011923330387860",
      body: "You just sent an SMS from Node.js using Twilio!",
    })
    .then((messsage) => console.log(messsage.sid));
} catch (e) {
  console.log(e);
}
