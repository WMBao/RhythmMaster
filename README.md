# RhythmMaster

 --- An interactive music game on BASYS2 platform

# Introduction

This project is aimed to design an interactive music game called *“Rhythm Master”*, which is inspired by a popular smartphone game of the same name on Basys2 platform, utilizing the buttons, switches and 7-segment LEDs on board with Xilinx IDE.

![Missing image](https://github.com/WMBao/TraCAR/blob/master/images/1.png)

# How to play
The DEMO video is uploaded online (haven't edited yet). (URL: [https://s3-ap-northeast-1.amazonaws.com/wmbao-fpga/5140219191_RhythmMaster_DEMO.wmv](https://s3-ap-northeast-1.amazonaws.com/wmbao-fpga/5140219191_RhythmMaster_DEMO.wmv "RhythmMaster Demo Video (haven't edited yet)"))

After the player turns on the “power” switch, the game begins. The beep starts to play the background music and arbitrary digit on board is going to become active, which means it’ll be lit one-segment-by-one-segment, as is shown in Fig. 2 below.

![Missing image](https://github.com/WMBao/TraCAR/blob/master/images/2.png)

(Figure 2. The sequence of segments to be lit when active)

The player should press the corresponding button below exactly when the 7th segment, which is the last one of a digit, turns on. Each time the player makes it, he/she will gain 1 point, while the player will lose 1 point once he/she mis-push the button or at the wrong time.

When the music ends, the score is displayed on the 4 digits LEDs, in form of “S(-)XX”, as is illustrated in Fig. 3 and Fig. 4 below. The game is actually a little tricky, negative score is also possible.

![Missing image](https://github.com/WMBao/TraCAR/blob/master/images/3.png)

(Figure 3. Score: +08) 

![Missing image](https://github.com/WMBao/TraCAR/blob/master/images/4.png)

(Figure 4. Score: -07)

During the game, the player can pause or reset whenever he wants to.

# Design
## 3.1 Hardware Interface
The following figure shows all the components on board used in this project with their function briefly explained below.

![Missing image](https://github.com/WMBao/TraCAR/blob/master/images/5.png)

(Figure 5. The components used on board)

1. “on/off” switch
2. “pause” switch
3. “reset” switch
4. “ending” (signal)
5. 4 7-segment digital display
6. 4 buttons (corresponding to four digits on board)
7. 4 LEDs (signals showing whether the corresponding button is pushed)
8. Beep pin (B5) –connected to the additional hardware a non-source beep (Fig. 6).
 
![Missing image](https://github.com/WMBao/TraCAR/blob/master/images/6.png)

(Figure 6. The non-source beep – SFN3040 - used for background music)

## 3.2 Software Structure
I have divided the whole design into six modules.
1. The Control Module (CTR),
2. The Frequency Divider Module (fre_div),
3. The Digits Display Module (LED_display),
4. The Beep Drive Module (beep),
5. The Segment Sub Module for digits (seg_dig_sub),
6. The Segment Sub Module for symbols (seg_sym_sub).

The top-level schematic of the entire program is shown in Fig. 7 below.

![Missing image](https://github.com/WMBao/TraCAR/blob/master/images/7.png)

(Figure 7. Top-level schematic of “Rhythm Master”)

The RTL schematic is illustrated in Fig. 8 below.

![Missing image](https://github.com/WMBao/TraCAR/blob/master/images/8.png)

(Figure 8. The RTL schematic for “Rhythm Master”)

# Reflection
The entire project is a little bit complicated. 

I separated it into 6 modules and used wires and buses to connect those modules. When programing, I met quite a lot of problems. Luckily, I have got many helps, with most of the problem solved from the online forum run by Digilent company, which is well-organized and quite helpful. 

I list three main problems I have met with below along with my solutions and related thoughts.

* Problem1: Limited number of variables supported in sensitivity list
	- Solution1: Use a flag register to hold the result of the logic composed by multiple variables and put the flag register into the sensitivity list. 
	- Solution2: Check the program carefully, and it is highly possible that there are some collisions.
* Problem2: Separate the whole design into modules and cooperate
	- Solution: Before we program, we need to make it clear what we’d like to build and have the whole draft of the structure of functions and modules in mind. 
* Problem3: Non-source beep driver (generate frequency manually)
	- Solution: The non-source beep is not integrated on board, and there’s little reference of using non-source beep available online. My solution is manually generate the frequency of the specific melody, stimulated by PWM.
