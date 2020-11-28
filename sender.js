const express = require('express')
const bodyParser = require("body-parser")
const app = express()
const port = 3000

const axios = require("axios").default;

const local_token = "345678910"

app.use(bodyParser.json())
app.use(bodyParser.urlencoded({extended: true}))

app.get('/', (req, res) => {
    console.log(req.query);
    const challenge = req.query["hub.challenge"]
    const token = req.query["hub.verify_token"]

    if(local_token == token){
        res.send(challenge);
    }else{
        res.send("Failed")
    }
})


app.post('/', (req, res) => {
    //console.log(JSON.stringify(req.body));
    const body = req.body;

    body.entry.forEach(entry => {
        if(entry["messaging"]){
            entry.messaging.forEach(messaging => {
                //console.log(messaging);
                respond(messaging.sender, messaging.message.text);
            });
        }
    })

    res.send("ok");
})


function respond(sender, text){
    console.log(sender, text);

    const access_token = "Enter_Acess_Token"

    const url = 'https://graph.facebook.com/v9.0/me/messages?access_token='+access_token;

    var message = {
        "recipient": sender,
        "message": {
          "text": text + "- by the bot"
        }
      }

    axios.post(url, message).then((response) => {
        console.log("Responded");
    });
}

app.listen(port, () => {
  console.log(`App listening at http://localhost:${port}`)
})