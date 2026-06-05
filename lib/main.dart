import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:just_audio/just_audio.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Car Engine Simulator',
      home: EngineSimulatorScreen(),
    );
  }
}

class EngineSimulatorScreen extends StatefulWidget {
  const EngineSimulatorScreen({super.key});

  @override
  State<EngineSimulatorScreen> createState() => _EngineSimulatorScreenState();
}

class _EngineSimulatorScreenState extends State<EngineSimulatorScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  double _rpm = 1000;
  bool _isDriving = false;

  @override
  void initState() {
    super.initState();
    accelerometerEvents.listen((AccelerometerEvent event) {
      if (_isDriving) {
        // Simulate RPM based on acceleration
        double accel = event.x.abs() + event.y.abs() + event.z.abs();
        _rpm = 1000 + (accel * 2000).clamp(0, 8000);
        _updateEngineSound();
      }
    });
  }

  void _updateEngineSound() async {
    // TODO: Load and play sound based on RPM
    print('RPM: $_rpm');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('赛车引擎模拟器')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('当前 RPM: ${_rpm.toStringAsFixed(0)}'),
            ElevatedButton(
              onPressed: () { setState(() => _isDriving = !_isDriving); },
              child: Text(_isDriving ? '停止' : '开始驾驶模式'),
            ),
            // Add Bluetooth connect button etc.
          ],
        ),
      ),
    );
  }
}
