#!flask/bin/python
from flask import Flask, jsonify
from pymongo import MongoClient
import json
from bson import json_util
app = Flask(__name__)

@app.route('/todo/api/v1.0/<tools_id>', methods=['GET'])
def get_currencies(tools_id):
    client = MongoClient('localhost', 27017)
    docs_list  = list(client["local"][tools_id].find())
    return json.dumps(docs_list, default=json_util.default, ensure_ascii=False)


@app.route('/todo/api/v1.0/ideas', methods=['GET'])
def get_ideas():
    client = MongoClient('localhost', 27017)
    docs_list  = list(client["local"]["ideas"].find())
    return json.dumps(docs_list, default=json_util.default, ensure_ascii=False)


@app.route('/todo/api/v1.0/tasks/<tool_id>', methods=['GET'])
def get_tool(tool_id):
    client = MongoClient('localhost', 27017)
    docs_list = list(client["local"][tool_id.upper().replace("-", "!")].find())
    return json.dumps(docs_list, default=json_util.default, ensure_ascii=False)


if __name__ == '__main__':
    app.run(debug=True)