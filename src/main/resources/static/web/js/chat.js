'use strict';

let chatWith;
let chatFrom;
let chat_room = document.getElementById("chat-inner-chat-room-chat-window");

// Try to set up WebSocket connection with the handshake at "http://localhost:8080/stomp"
//let sock = new SockJS("https://final-software-project.herokuapp.com/web/websocket");
let sock = new SockJS("/web/websocket");

// Create a new StompClient object with the WebSocket endpoint
let client = Stomp.over(sock);

// Start the STOMP communications, provide a callback for when the CONNECT frame arrives.
client.connect({}, frame => {
    // Subscribe to "/topic/messages". Whenever a message arrives add the text in a list-item element in the unordered list.
    client.subscribe("/web/topic/messages", payload => {

        let message_list = document.getElementById('message-list');
        let message = document.createElement('li');

        let chatMessage = document.createElement('div');
        chatMessage.className = "chat-message";
        let chatMessageSender = document.createElement('p');
        let chatMessageContent = document.createElement('p');

        chatMessageSender.appendChild(document.createTextNode(JSON.parse(payload.body).senderId));
        chatMessageContent.appendChild(document.createTextNode(JSON.parse(payload.body).message));
        chatMessage.appendChild(chatMessageSender);
        chatMessage.appendChild(chatMessageContent);

        // message.appendChild(document.createTextNode(JSON.parse(payload.body).message));
        // message_list.appendChild(message);
        console.log("MESSAGE=" + JSON.parse(payload.body).message);
    });

});

let errorBox = document.getElementById("noReceiverMsgBox");
let error = document.getElementById("noReceiverMsg");
const chat_room_content = "#chat-inner-chat-room-chat-window";

function displaySuccessMsg(){
    setTimeout(() => {
        errorBox.style.display = "none";
    }, 2000);
}

function getChatMessages(userId, fromId){
    chatWith = userId;
    chatFrom = fromId;
    $.ajax({
        type: "GET",
        url: '/web/chat/get-massages/?userId=' + userId,
        contentType : "application/json",
        dataType: "json",
        headers: {"X-CSRF-TOKEN" : token},
        success: function (data) {
            let messages = "";
            console.log("data=" + data)
            if(data != null){
                if(data.messages != null){
                    chat_room.innerHTML = "";
                    //console.log("MESSAGES=" + data.messages.length)
                    for(let i = 0;i < data.messages.length;i++){
                        chat_room.innerHTML += '<div class="chat-message">' +
                            '<p>' + data.messages[i].senderName + '</p>' +
                            '<p>' + data.messages[i].content + '</p>' +
                            '</div>'
                        // messages += '<div class="chat-message">' +
                        //     '<p>' + data.messages[i].senderName + '</p>' +
                        //     '<p>' + data.messages.messages[i].content + '</p>' +
                        //     '</div>'
                    }
                    //chat_room.appendChild(messages);
                    $("chat-inner-chat-room-chat-window").load(" chat-inner-chat-room-chat-window");
                    //$("#chat-inner-chat-room-chat-window").load(location.href + " #chat-inner-chat-room-chat-window");
                    console.log(chat_room.innerHTML);
                }
            }
        }
    });
}

// Take the value in the ‘message-input’ text field and send it to the server with empty headers.
function sendMessage(){
    let input = document.getElementById("message-box");
    let message = input.value;

    if(chatWith == null){
        errorBox.style.display = "flex";
        error.innerHTML = "Please select recipient";
        displaySuccessMsg();
    } else{
        client.send('/app/chat', {}, JSON.stringify({
            senderId: chatFrom,
            receiverId: chatWith,
            message: message
        }));
    }
}