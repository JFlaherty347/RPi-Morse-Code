#! /bin/bash

#Joseph Flaherty | Comp462 | Aug 26 2020

#
#functions
#

#LED settings
makeLedManual()
{
	eval "echo none > /sys/class/leds/led0/trigger"
}

turnOnLed()
{
	eval "echo 1 > /sys/class/leds/led0/brightness"
}

turnOffLed()
{
	eval "echo 0 > /sys/class/leds/led0/brightness"
}

#morse code building blocks

sendDot()
{
	turnOnLed
	eval "sleep 1"
	turnOffLed
	
	waitBetweenPartsOfLetters
}

sendDash()
{
	turnOnLed
	eval "sleep 3"
	turnOffLed
	
	waitBetweenPartsOfLetters
}

waitBetweenPartsOfLetters()
{
	eval "sleep 1"
}

waitBetweenLetters()
{
	eval "sleep 3"
}

waitBetweenWords()
{
	eval "sleep 7"
}

#letters

sendS()
{
	echo "sending S..."

	sendDot
	sendDot
	sendDot

	waitBetweenLetters
}

sendO()
{
	echo "sending O..."

	sendDash
	sendDash
	sendDash

	waitBetweenLetters
}

sendC()
{
	echo "sending C..."

	sendDash
	sendDot	
	sendDash
	sendDot	

	waitBetweenLetters
}

sendM()
{
	echo "sending M..."

	sendDash
	sendDash

	waitBetweenLetters
}

sendP()
{
	echo "sending P..."

	sendDot
	sendDash
	sendDash
	sendDot	

	waitBetweenLetters
}

#numbers

send4()
{
	echo "sending 4..."

	sendDot
	sendDot
	sendDot
	sendDot
	sendDash

	waitBetweenLetters
}

send6()
{
	echo "sending 6..."

	sendDash
	sendDot
	sendDot
	sendDot
	sendDot

	waitBetweenLetters
}

send2()
{
	echo "sending 2..."

	sendDot
	sendDot
	sendDash
	sendDash
	sendDash

	waitBetweenLetters
}

#words

sendSOS()
{
	sendS
	sendO
	sendS

	waitBetweenWords
}

sendCOMP462()
{
	sendC
	sendO
	sendM
	sendP
	send4
	send6
	send2

	waitBetweenWords
}

#
#Program
#

echo "Sending the message 'SOS COMP462' in morse code via the ACT LED now!"

makeLedManual

sendSOS
sendCOMP462

echo "Message Sent!"

