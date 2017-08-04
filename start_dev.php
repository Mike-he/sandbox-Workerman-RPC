<?php

require_once __DIR__ . '/vendor/autoload.php';

use \Workerman\Worker;
use \Workerman\Lib\Timer;

$task = new Worker();
// 开启多少个进程运行定时任务，注意业务是否在多进程有并发问题
$task->count = 1;
$task->onWorkerStart = function($task)
{
    system('php start.php start -d');

    // 每1秒执行一次
    $time_interval = 1;
    Timer::add($time_interval, function()
    {
        system('php start.php reload');
    });
};

// 运行worker
Worker::runAll();