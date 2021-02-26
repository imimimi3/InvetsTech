from pymongo import MongoClient


client = MongoClient('localhost', 27017)
docs_list  = list(client["local"]["currencies"].find())
print()