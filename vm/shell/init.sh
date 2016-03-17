#!/usr/bin/env bash

echo -e "[SHELL-INIT] executing...\n";


echo -e "[ADB] restarting server...\n";
sudo /home/vagrant/android-sdk-linux/platform-tools/adb kill-server
sudo /home/vagrant/android-sdk-linux/platform-tools/adb start-server
sudo /home/vagrant/android-sdk-linux/platform-tools/adb devices

echo -e "[SHELL-INIT] completed ;) \n";
