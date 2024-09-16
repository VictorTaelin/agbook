const WebSocket = require('ws');

class WebSocketClient {
  constructor(url) {
    this.url = url;
    this.socket = null;
  }

  connect() {
    return new Promise((resolve, reject) => {
      this.socket = new WebSocket(this.url);
      this.socket.onopen = () => resolve();
      this.socket.onerror = (error) => reject(error);
    });
  }

  send(message) {
    return new Promise((resolve, reject) => {
      if (this.socket && this.socket.readyState === WebSocket.OPEN) {
        this.socket.send(message);
        resolve();
      } else {
        reject(new Error('WebSocket is not open'));
      }
    });
  }

  receive() {
    return new Promise((resolve) => {
      this.socket.onmessage = (event) => resolve(event.data);
    });
  }

  close() {
    return new Promise((resolve) => {
      if (this.socket) {
        this.socket.onclose = () => resolve();
        this.socket.close();
      } else {
        resolve();
      }
    });
  }
}

// Example usage
async function exampleWebSocket() {
  const client = new WebSocketClient('wss://echo.websocket.org');
  
  try {
    console.log('Connecting to WebSocket...');
    await client.connect();
    
    console.log('Sending message...');
    await client.send('Hello, WebSocket!');
    
    console.log('Waiting for response...');
    const response = await client.receive();
    console.log('Received:', response);
    
    console.log('Closing connection...');
    await client.close();
  } catch (error) {
    console.error('Error:', error);
  }
}

exampleWebSocket();
