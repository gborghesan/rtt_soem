cd /etc/ld.so.conf.d/
sudo touch ros2.conf
sudo sh -c 'echo "/opt/ros/foxy/lib/" > ros2.conf'
sudo ldconfig
