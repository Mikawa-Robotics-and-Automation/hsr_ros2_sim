#!/bin/bash

# clone
vcs import src < hsr_sim_humble.repos

# colcon build
rosdep install --from-paths . -y --ignore-src
colcon build --symlink-install --cmake-args -DCMAKE_BUILD_TYPE=Release
source install/setup.bash