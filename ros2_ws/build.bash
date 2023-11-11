#!/bin/bash

# clone
mkdir src
cd src
git clone -b humble https://github.com/Mikawa-Robotics-and-Automation/hsrb_controllers
git clone -b humble https://github.com/Mikawa-Robotics-and-Automation/hsrb_description
git clone -b humble https://github.com/Mikawa-Robotics-and-Automation/hsrb_meshes
git clone -b humble https://github.com/Mikawa-Robotics-and-Automation/hsrb_drivers
git clone -b humble https://github.com/Mikawa-Robotics-and-Automation/hsrb_gazebo_bringup
git clone -b humble https://github.com/Mikawa-Robotics-and-Automation/tmc_gazebo_plugins
git clone -b humble https://github.com/Mikawa-Robotics-and-Automation/tmc_control_msgs
cd ..

# colcon build
rosdep install --from-paths . -y --ignore-src
colcon build --symlink-install --cmake-args -DCMAKE_BUILD_TYPE=Release
source install/setup.bash