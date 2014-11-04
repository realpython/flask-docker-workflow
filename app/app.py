import os
from flask import Flask, jsonify

app = Flask(__name__)


@app.route('/')
def index():
    return 'Flask is running on Docker!'


@app.route('/data')
def cities():
    data = {
        "cities": ["Seattle", "San Francisco", "Chicago",
                   "New York", "Denver", "San Diego", "Tokyo"]
    }
    return jsonify(data)


if __name__ == '__main__':
    port = int(os.environ.get('PORT', 5000))
    app.run(host='0.0.0.0', port=port)
