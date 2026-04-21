#!/bin/bash

echo "🏭 Android Factory Setup শুরু..."

# system update
apt update -y

# tools install
apt install -y wget unzip git curl openjdk-17-jdk

# Android SDK folder
mkdir -p $HOME/android-sdk/cmdline-tools
cd $HOME/android-sdk/cmdline-tools

# download SDK
wget https://dl.google.com/android/repository/commandlinetools-linux-10406996_latest.zip

unzip commandlinetools-linux-*.zip
mv cmdline-tools latest

# environment setup
export ANDROID_HOME=$HOME/android-sdk
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools

# accept licenses
yes | sdkmanager --licenses

# install Android tools
sdkmanager "platforms;android-34" "build-tools;34.0.0" "platform-tools"

echo "✅ Setup Complete!"
