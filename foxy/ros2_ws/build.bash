#!/bin/bash

# clone
mkdir src
cd src
git clone -b foxy https://github.com/hsr-project/gazebo_ros2_control.git
git clone -b foxy https://github.com/hsr-project/hsrb_description.git
git clone -b foxy https://github.com/hsr-project/hsrb_meshes.git
git clone -b foxy https://github.com/hsr-project/hsrb_controllers.git
git clone -b foxy https://github.com/hsr-project/hsrb_drivers.git # 追加
git clone -b foxy https://github.com/hsr-project/hsrb_gazebo_bringup.git
git clone -b foxy https://github.com/hsr-project/tmc_gazebo_plugins.git
git clone -b foxy https://github.com/hsr-project/tmc_control_msgs.git
cd ..

# colcon build
rosdep install --from-paths . -y --ignore-src
colcon build --symlink-install --cmake-args -DCMAKE_BUILD_TYPE=Release
source install/setup.bash