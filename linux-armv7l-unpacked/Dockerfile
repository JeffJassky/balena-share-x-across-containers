FROM jassky/reflx-os:buster-opencv-node-python
WORKDIR /usr/app
RUN echo "#!/bin/bash" > /etc/X11/xinit/xserverrc \
  && echo "" >> /etc/X11/xinit/xserverrc \
  && echo 'exec /usr/bin/X -ac -s 0 dpms -nolisten tcp "$@"' >> /etc/X11/xinit/xserverrc
COPY ./ ./
CMD ["bash", "/usr/app/start.sh"]
