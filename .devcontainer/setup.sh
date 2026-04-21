#!/bin/bash

echo "🏗️ Starting Android SDK Setup..."

# ১. সিস্টেম আপডেট এবং প্রয়োজনীয় টুলস ইন্সটল
sudo apt update -y
sudo apt install -y wget unzip openjdk-17-jdk

# ২. SDK ফোল্ডার তৈরি
mkdir -p $HOME/android-sdk/cmdline-tools
cd $HOME/android-sdk/cmdline-tools

# ৩. কমান্ড লাইন টুলস ডাউনলোড (Latest Version)
wget https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip -O tools.zip

# ৪. আনজিপ করা
unzip tools.zip
rm tools.zip
mv cmdline-tools latest

# ৫. Environment Variables সেট করা
export ANDROID_HOME=$HOME/android-sdk
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools

# ৬. লাইসেন্স একসেপ্ট করা
yes | $ANDROID_HOME/cmdline-tools/latest/bin/sdkmanager --sdk_root=$ANDROID_HOME "platform-tools" "platforms;android-34" "build-tools;34.0.0"

# ৭. local.properties আপডেট করা
echo "sdk.dir=$HOME/android-sdk" > /workspaces/ClockApp2/local.properties

echo "✅ Setup Complete! Now run: ./gradlew assembleDebug"
