# 项目架构

## 传感器层
- 使用 sensors_plus 包读取加速度计、陀螺仪
- 滤波处理数据以减少噪声

## 音频引擎
- just_audio 或 audioplayers 处理循环样本和交叉淡入
- RPM 到 pitch/volume 映射
- 支持预加载多个引擎声音

## 蓝牙
- flutter_blue_plus 连接 A2DP
- 音频路由到外部设备

## 物理模拟
- 简单物理模型: accel -> torque -> rpm change
