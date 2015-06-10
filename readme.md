NIFTY Romo Project
------------------------------------------------------------

This P-r is an simple IoT Demo which has been on show at�uCloud Computing Expo Japan Spring 2015�vand�uAPPS JAPAN 2015�v.
We used the smartphone robot Romo, MQTT and WebRTC to show how to creat a simple application for IoT.


![img](https://scontent.xx.fbcdn.net/hphotos-xfa1/v/t1.0-9/11393160_823670774378068_6055071381405467661_n.jpg?oh=cd90b4685e1be44f2e0b086f8af8743c&oe=5602782D)

## Requirements

### Driver

* Romo 
Romo�̌����T�C�g�i���{�j�F(http://www.romotive.jp/)
* iphone
iphone5, iphone5s, iphone5c 

### Software

* xcode 6.0 �ȏ�
* ios 7.0 �ȏ�

## Installation

```
$ git clone https://github.com/kuroei/NifRomoController.git
$ cd NifRomoController/
$ pod install
```
## How to Use

### Run Project and build

After installed the pods, you can start this  p-r with  NifRomo.xcworkspace and then build it to your iphone.

### Run Application

* input the authentication infomation for MQTT Server at the login screen and connect the Server.
* do the same thing at Client of this p-r.
* then you can control the Romo robot with this Controller.

## About the Client of this p-r

* (https://github.com/kuroei/NifRomoClient.git)

## About the MQTT server

this p-r use the �uNIFTYCloud MQTT�vas default setting .you also can change it with your MQTT Server.

* �uNIFTYCloud MQTT�v(http://cloud.nifty.com/service/mqtt.htm)

