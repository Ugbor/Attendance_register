#!/bin/bash

cp attendance_app.py tempdir/.
cp -r templates/* tempdir/templates/.
cp -r static/* tempdir/static/.

echo "From python" >> tempdir/Dockerfile
echo "RUN pip install flask" >> tempdir/Dockerfile
echo "COPY ./static /home/myapp/static/" >> tempdir/Dockerfile
echo "COPY ./templates /home/myapp/templates/" >>tempdir/Dockerfile
echo "COPY attendance_app.py /home/myapp/" >> tempdir/Dockerfile
echo "EXPOSE 5000" >> tempdir/Dockerfile
echo "CMD python /home/myapp/attendance_app.py" >>tempdir/Dockerfile

cd tempdir

sudo docker build -t attendanceregister .
sudo docker run -t -d -p 5000:5000 --name samplerunning attendanceregister
sudo docker ps -a

