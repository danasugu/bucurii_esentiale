const functions = require('firebase-functions');
const admin = require('firebase-admin');

admin.initializeApp(functions.config().firebase);

var msgData;

exports.offerTrigger = functions.firestore.document(
        'offers/{offerId}'
        ).onCreate((snapshot, context) => {
        msgData = snapshot.data();

        admin.firestore().collection('pushtokens').get().then((snapshots) => {
            var tokens = [];
            if (snapshots.empty) {
            console.log('No Devices');
            }
            else{
            for(var token of snapshots.docs){
                tokens.push(token.data().devtoken);
                }

            var payload = {
            "notification": {
                "title": "De la: " + msgData.businessName,
                "body": "Mesaj: " + msgData.offerValue,
                "sound": "default"
                },
                "data": {
                "sendername": msgData.businessName,
                "message": msgData.offerValue
                }
            }

            return admin.messaging().sendToDevice(tokens, payload).then((response) =>{
                console.log('Pushed them all');
            } ).catch((err) => {
                console.log(err);
            } )
            }
        })
        })
