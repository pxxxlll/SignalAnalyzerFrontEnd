# 文本更新

目前的问题：

Processor 处理完数据后直接通知 Receiver 接收下一帧；

```
[Processor] signal_frame_end →
→ MainController.on_frame_processed →
→ QTimer.singleShot(0, wait_for_ui_update) →
→ MainWindow.wait_for_ui_update() 开始等待 →
→ 每个图像槽函数 update_*() 执行完后调用 release(1) →
→ semaphore 累积到 total_expected_updates →
→ wait_for_ui_update() 继续执行，发出 signal_ui_all_updated →
→ receiver.next_sweep() 被触发，开始下一轮
```









