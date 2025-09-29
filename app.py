import os
from flask import Flask
app = Flask(__name__)

@app.route('/health')
def health():
    return "OK", 200

@app.route('/')
def hello():
    password = os.getenv('APP_PASSWORD', 'No password found')
    return f"Secret password is: {password}"

@app.route('/write')
def write():
    with open('/data/message.txt', 'w') as f:
        f.write('Hello from persistent volume!')
    return 'Message written.'

@app.route('/read')
def read():
    try:
        with open('/data/message.txt', 'r') as f:
            return f.read()
    except FileNotFoundError:
        return 'No message found.'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)

