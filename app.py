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

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)

