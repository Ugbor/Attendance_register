# attendance_app.py
from flask import Flask, render_template

app = Flask(__name__)

@app.route('/')
def home():
    return render_template('index.html', title='Attendance Register')

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')
