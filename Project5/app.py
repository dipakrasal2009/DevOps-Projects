from flask import Flask

app = Flask(__name__)

@app.route('/')
def index():
    return "hello From Dipak"

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=90)

