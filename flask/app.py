from flask import Flask
import os

app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello, World!'

if __name__ == '__main__':
    port = int(os.getenv('PORT', 81))  # Get the port number from the PORT environment variable, default to 81 if not set
    app.run(host='0.0.0.0', port=port)