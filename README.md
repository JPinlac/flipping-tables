Ionic Box
=============================

Ionic Box is a ready-to-go hybrid development environment for building mobile apps with Ionic, Cordova, and Android. Ionic Box was built to make it easier for developers to build Android versions of their app, and especially for Windows users to get a complete dev environment set up without all the headaches.

For iOS developers, Ionic Box won't do much for you right now unless you are having trouble installing the Android SDK, and Ionic Box cannot be used for iOS development for a variety of legal reasons (however, the `ionic package` command in beta will soon fix that).

### Installation


To install, download and install [Vagrant](https://www.vagrantup.com/downloads.html) for your platform, then download and install [VirtualBox](http://virtualbox.org/).

Once Vagrant and VirtualBox are installed, you can download the latest release of this GitHub repo, and unzip it. `cd` into the unzipped folder and run:

```bash
$ vagrant up
$ vagrant ssh
```

The username for vagrant is `vagrant` and the password is `vagrant`. 

This will download and install the image, and then go through the dependencies and install them one by one. `vagrant ssh` will connect you to the image and give you a bash prompt. Once everything completes, you'll have a working box to build your apps on Android.

#### Windows users:
We need to setup a symbolic link for the node modules folder since windows has a length limitation when using shared folders. A symbolic link is basically a point from one directory to another. Windows has a directory name length limitation that we encounter when host our files through a shared folder. Since our npm dependencies (node modules) folder doesn't need to be checked into source control, we can move it to a directory on the IonicBox and just point to that from within our Ionic projects.

On the IonicBox, in the project folder which should contain "node_modules", run the following commands:
```bash
$ cd /vagrant # navigate to project folder
$ rm -rf node_modules # remove existing node_modules
$ mkdir ~/node_modules_[Your Project] # make dir which will contain node_modules dependencies
$ ln -s ~/node_modules_[Your Project] node_modules # create symbolic link to dir which we just maked
$ npm install # install npm modules
```
thanks to [Justin James](http://digitaldrummerj.me/ionicbox-notes/) post.

### Connected Android Devices

The image also has support for connected USB Android devices. To test whether devices are connected, you can run (from the box):

```bash
$ sudo /home/vagrant/android-sdk-linux/platform-tools/adb devices
```

If that does not work, or shows `????? permissions`, then run:

```bash
sudo /home/vagrant/android-sdk-linux/platform-tools/adb kill-server
sudo /home/vagrant/android-sdk-linux/platform-tools/adb start-server
```

### Pre-built image

We are testing a pre-built Vagrant cloud image which should be faster than using the Vagrantfile method above. To try it, create a folder where you want to init your dev environment (a great place for this would be in the project folder of your app). Then run:

```bash
$ vagrant init drifty/ionic-android
$ vagrant up
```

If you try this method and it works or you encounter issues, please comment on issue #7.
