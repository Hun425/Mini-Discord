package com.example.chat

import org.springframework.http.MediaType
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RestController

@RestController
class HomeController {
    @GetMapping("/", produces = [MediaType.TEXT_HTML_VALUE])
    fun index() = """
        <!DOCTYPE html>
        <html>
        <head>
            <meta charset=\"UTF-8\"/>
            <title>Chat</title>
            <script>
                let ws;
                function connect() {
                    ws = new WebSocket('ws://' + location.host + '/ws/chat');
                    ws.onmessage = function(e) {
                        const log = document.getElementById('log');
                        log.value += e.data + '\n';
                    };
                }
                function sendMsg() {
                    const input = document.getElementById('msg');
                    ws.send(input.value);
                    input.value = '';
                }
            </script>
        </head>
        <body onload=\"connect()\">
            <textarea id=\"log\" rows=\"10\" cols=\"40\" readonly></textarea><br/>
            <input id=\"msg\" type=\"text\"/>
            <button onclick=\"sendMsg()\">send</button>
        </body>
        </html>
    """.trimIndent()
}
