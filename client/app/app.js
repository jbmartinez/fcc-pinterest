'use strict';

var imgStore = new ImageStore(); // Create a store instance.
var userStore = new UserStore();
RiotControl.addStore(imgStore); // Register the store in central dispatch.
RiotControl.addStore(userStore);

riot.mount('*'); // Kickoff the Riot app.