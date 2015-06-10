NIFTY Romo Project
------------------------------------------------------------

This P-r is an simple IoT Demo which has been on show at「Cloud Computing Expo Japan Spring 2015」and「APPS JAPAN 2015」.
We used the smartphone robot Romo, MQTT and WebRTC to show how to creat a simple application for IoT.


![img](https://scontent.xx.fbcdn.net/hphotos-xpt1/v/t1.0-9/11044952_811750628903416_2888003761710349589_n.jpg?oh=2e0e043b78a565b0461c66667c3f3388&oe=56021BAF)

## Requirements

### Driver

* Romo 
Romoの公式サイト（日本）：(http://www.romotive.jp/)
* iphone
iphone5, iphone5s, iphone5c 

### Software

* xcode 6.0 以上
* ios 7.0 以上

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

this p-r use the 「NIFTYCloud MQTT」as default setting .you also can change it with your MQTT Server.

* 「NIFTYCloud MQTT」(http://cloud.nifty.com/service/mqtt.htm)

