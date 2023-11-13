#!/bin/bash

# clone
mkdir -p src
vcs import src < hsr_sim_foxy.repos

# colcon build
rosdep install --from-paths . -y --ignore-src
colcon build --symlink-install --cmake-args -DCMAKE_BUILD_TYPE=Release
source install/setup.bash