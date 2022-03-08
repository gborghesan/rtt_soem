# ROS2 - RTT integation of the soem master


## Problems:

at the moment, using `setcap` on the deployer is not possible, this cause the enviroment variable `LD_LIBRARY_PATH` to be reset -> see https://odri.discourse.group/t/help-regarding-writing-a-ros2-wrapper-over-masterboard-sdk/184/3 

On the other hand, you can run the deployer as sudo
```
sudo su
source /home/<youruser>/.bashrc
<source what you normally would source>
deployer
```

## Dependencies

you need also the _soem package_ for ros2
https://github.com/gborghesan/soem 
branch foxy-devel



### Old stuff tried but not sucessful to make the setcap work
```
cd /etc/ld.so.conf.d/
sudo touch ros2.conf
sudo sh -c 'echo "/opt/ros/foxy/lib/" > ros2.conf'
sudo ldconfig
```
