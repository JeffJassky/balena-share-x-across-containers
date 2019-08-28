FROM jassky/reflx-os:buster-opencv-node-python
WORKDIR /usr/app
RUN apt install python3-opencv \
    && pip3 install forever imutils websockets picamera \
    && python3 -m pip install numpy -I
COPY ./ ./
CMD ["python3", "/usr/app/server.py"]
