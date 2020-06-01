#!python3
import sqlalchemy
import os

password = os.environ["DB_PASSWORD"]
db_name = os.environ["DB_NAME"]

engine = sqlalchemy.create_engine('mysql://root:{}@127.0.0.1'.format(password))  # connect to server
engine.execute("CREATE DATABASE {}".format(db_name)) #create db
engine.execute("USE {}".format(db_name)) # select new db