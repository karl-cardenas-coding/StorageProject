## BASH Script Storage Project

This is a qucik BASH scripting project that determines how much storage you have on your machine. This is one of the first projects I have worked on while on my jounrey to learn Linux and BASH Scripting.  

## Figuring our disk space on the CLI (Command Line Interface)

For starters, I am on a Mac using iMac Sierra Version 10.12.6 so some of the commands may differ from machine to machine. Open your CLI and type in the df (disk free) command which will show you the amount of space available on the machine you are using. I would recommend using -H at the end of the command which stands for “human-readable” and this will provie you a general idea of how much space is available on your machine. In this scenario, I will be actually using -k because I want to see the data in kilobytes which will eventually be converted into gigabytes.

```
df -k
```
## Building the script in BASH

First you may create a directory. I will name my new directory hardwaretest and create a file named example.sh. Vim is a text editor that is used in the CLI. 

```
$ mkdir hardwaretest
$ vim hardwaretest/example.sh
```
      
Below are ways to exit/save from the vim scripting window in your CLI.

```
:w - write file (save file)
:q - quit vim
:wq - write and quit
```
## Making The Script Executable. 

The chmod command will make this script executable. The (u+x) in the below command stands for user+executable.

$ chmod u+x hardwaretest/example.sh
  
## Finding Out Total Available Storage

This part of the script determines how much used and available space is on the machine. There are two variabes being created here (USEDKB & FREEKB). They both take the output of the _df_ command in kilobytes and pipes the output to 

```
#!/bin/bash

USEDKB=`df -k | awk '{s += \$3} END {print s}'`
FREEKB=`df -k | awk '{s += \$4} END {print s}'`
```

Converting kilobytes to gigabytes and displaying the results

```
USEDGB=`expr $USEDKB / 1000000`
FREEGB=`expr $FREEKB / 1000000`
echo You are using $USEDGB GB and have $FREEGB GB available.
```

This piece of the script will ask the user if they would like to see how thier storage is being distributed in detail. 

```
echo -n "Would you like to see how your storage is being distributed in detail? (Y/N) ";
read REPLY;

{
if [ "$REPLY" == "Y" ] || [ "$REPLY" == "y" ];

then
  df
  
fi
}
```

## Running the scirpt

In your CLI just type in the name of the path and your script will run

```
$ hardwaretest/example.sh
```

  

