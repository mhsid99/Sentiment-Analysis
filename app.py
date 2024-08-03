# -*- coding: utf-8 -*-
"""
Created on Mon Jul  6 23:59:31 2020

@author: Hamza
"""

import pandas as pd
import re
import string as st
from sklearn.model_selection import train_test_split as tts
from sklearn.feature_extraction.text import TfidfVectorizer as tfidf
from sklearn.linear_model import LogisticRegression as lr
from sklearn.pipeline import Pipeline
from sklearn.metrics import accuracy_score as acc, precision_score as prec, recall_score as rec
import pickle # for saving and loading the file
from flask import Flask, request, jsonify, render_template
from flask_cors import CORS

# Load the trained model
with open('sentimental_analyze_on_movie_reviews.pkl', 'rb') as f:
    sentimental_analyze = pickle.load(f)

# Define the Flask app
app = Flask(__name__)
CORS(app)  # Enable CORS for all routes

@app.route('/')
def home():
    return render_template('index.html')  # Serve the index.html file

@app.route('/predict', methods=['POST'])
def predict():
    data = request.json
    review = data['review']
    prediction = sentimental_analyze.predict([review])
    sentiment = 'positive' if prediction[0] == 'positive' else 'negative'
    return jsonify({'sentiment': sentiment})

if __name__ == '__main__':
    app.run() 
