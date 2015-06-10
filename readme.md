NIFTY Romo Project
------------------------------------------------------------

This P-r is an simple IoT Demo which has been on show at�uCloud Computing Expo Japan Spring 2015�vand�uAPPS JAPAN 2015�v.
We used the smartphone robot Romo, MQTT and WebRTC to show how to creat a simple application for IoT.


![img](https://scontent.xx.fbcdn.net/hphotos-xpt1/v/t1.0-9/11044952_811750628903416_2888003761710349589_n.jpg?oh=2e0e043b78a565b0461c66667c3f3388&oe=56021BAF)

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

