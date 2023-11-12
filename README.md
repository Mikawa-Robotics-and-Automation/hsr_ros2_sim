# hsr_ros2_sim

# 動作環境
- Ubuntu22.04
- (ROS2 Humble)

# Docker
## ビルド
```
bash build_docker_humble.bash
```

## 実行
GUIの権限を最初にdockerに付与する。この操作はPCを起動するたびに行う
```
xhost +local:docker
```

```
docker compose up
```


VS Codeで作業する場合拡張の「Dev Containers」を入れて「Attach to Running Container」でhsr_ros2_sim-xxxを選んで中に入ると作業できる

## コンテナ内
### Clone & ビルド
```
cd ros2_ws
source setup_build.bash
```

### シミュレーション立ち上げ
```
ros2 launch hsrb_gazebo_bringup sim.launch.py

# GazeboとHSRを別々に立ち上げる場合は以下
# ros2 launch hsrb_gazebo_bringup gazebo_bringup.launch.py
# ros2 launch hsrb_gazebo_bringup spawn_hsrb.launch.py
```

### HSRを動かす(Todo)
```
ros2 topic pub -r 1 /omni_base_controller/command_velocity geometry_msgs/msg/Twist '{linear: {x: 1.0, y: 0.0, z: 0.0}, angular: {x: 0.0, y: 0.0, z: 0.5}}'
```

# Docker(動作比較用 ROS2 Foxy版)

以下を参考に環境構築したもの

https://github.com/hsr-project/hsr_ros2_doc

## ビルド
```
cd foxy
bash build_docker_foxy.bash
docker compose up
```

## コンテナ内
### Clone & ビルド
```
cd ros2_ws
source setup_build.bash
```

### シミュレーション立ち上げ
```
ros2 launch hsrb_gazebo_bringup gazebo_bringup.launch.py
ros2 launch hsrb_gazebo_bringup spawn_hsrb.launch.py
```
