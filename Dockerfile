FROM osrf/ros:humble-desktop

# コンテナ内で apt パッケージマネージャを更新
RUN apt update && apt upgrade -y

# ゾンビ化したGazeboを止めるため
RUN sudo apt install -y psmisc
# killall gzserver
# killall gzclient

# Gazebo
RUN apt install -y ros-humble-gazebo-ros-pkgs

# Nav2
RUN apt install -y ros-humble-navigation2 ros-humble-nav2-bringup
RUN apt install -y ros-humble-turtlebot3*

# ros2_control
RUN apt install -y ros-humble-gazebo-ros2-control ros-humble-gazebo-ros ros-humble-xacro

# bashrc
RUN echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc
RUN echo "export TURTLEBOT3_MODEL=waffle" >> ~/.bashrc
RUN echo "export GAZEBO_MODEL_PATH=$GAZEBO_MODEL_PATH:/opt/ros/humble/share/turtlebot3_gazebo/models" >> ~/.bashrc

## https://github.com/ros-planning/navigation2/issues/2730#issuecomment-1189726626
## https://classic.gazebosim.org/tutorials?tut=ros2_installing&cat=connect_ros
RUN echo "source /usr/share/gazebo/setup.sh" >> ~/.bashrc


CMD ["/bin/bash"]