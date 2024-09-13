#!/bin/bash

# 1. Install Homebrew (if not already installed)
echo "Checking for Homebrew..."
if ! command -v brew &> /dev/null
then
    echo "Homebrew not found. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    echo "Homebrew is already installed."
fi

# 2. Install Xcode Command Line Tools
echo "Installing Xcode Command Line Tools..."
xcode-select --install

# 3. Accept Xcode license agreement
echo "Accepting Xcode license agreement..."
sudo xcodebuild -license accept

# 4. Download and install Android Studio
echo "Downloading Android Studio..."
brew install --cask android-studio

# 5. Install Node.js using Homebrew
echo "Installing Node.js..."
brew install node

# 6. Install Watchman using Homebrew
echo "Installing Watchman..."
brew install watchman

# 7. Install CocoaPods (for iOS projects)
echo "Installing CocoaPods..."
sudo gem install cocoapods

# 8. Verify installations
echo "Verifying installations..."
brew list --cask android-studio && echo "Android Studio installed."
brew list node && node -v
brew list watchman && watchman -v
pod --version && echo "CocoaPods installed."
xcode-select -p && echo "Xcode Command Line Tools installed."

# 9. Install React Native CLI globally
echo "Installing React Native CLI..."
npm install -g react-native-cli

# 10. Prompt user for Android SDK setup
echo "Make sure to set up Android SDK in Android Studio and configure environment variables for Android development:"
echo "1. Open Android Studio."
echo "2. Go to 'Preferences' > 'Appearance & Behavior' > 'System Settings' > 'Android SDK'."
echo "3. Install 'Android SDK', 'Android SDK Platform-Tools', and 'Android SDK Build-Tools'."
echo "4. Set the following environment variables in ~/.zshrc or ~/.bash_profile:"
echo 'export ANDROID_HOME=$HOME/Library/Android/sdk'
echo 'export PATH=$PATH:$ANDROID_HOME/emulator'
echo 'export PATH=$PATH:$ANDROID_HOME/tools'
echo 'export PATH=$PATH:$ANDROID_HOME/tools/bin'
echo 'export PATH=$PATH:$ANDROID_HOME/platform-tools'

echo "Script completed successfully! Please follow the final setup steps for Android SDK."

