## BASH Script Storage Project

This is a BASH scripting project that determines how much storage you have on your machine. 

## Requirements
* Bash `vX.X.X`
* Vim or any bash text editior

## Figuring our disk space on the CLI (Command Line Interface)

Open your CLI and type in the df (disk free) command, `df` which will show you the amount of space available on the machine you are using. I recommend using `-H` at the end of the command which stands for “human-readable”. This will provie you with a general idea of how much space is available on your machine. In this scenario, I will be actually using `-k` because I want to see the data in kilobytes which will eventually be converted into gigabytes.

```
df -H
```
or
```
df -k
```
## Building the script in BASH

First create a directory. I will name my new directory `hardwaretest/` and create a file named `example.sh`. [Vim](https://www.vim.org/) is a text editor that is used in the CLI and where you will actually start writing your script. 

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

## Finding Out Total Available Storage

This part of the script determines how much space is used and total available space is on the machine. There are two variabes being created here (USEDKB & FREEKB). They both take the output of the `df` command in kilobytes and will add up the total used storage (USEDKB) and the total free storage (FREEKB).   

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

This portion of the script will prompt the user if they would like to see how their system storage is being distributed in detail. 

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
## Making The Script Executable. 

The `chmod` command will make this script executable. The (u+x) in the below command stands for user+executable.

```
$ chmod u+x hardwaretest/example.sh
```
## Running the scirpt

In your CLI just type in the name of the path and your script will run

```
$ hardwaretest/example.sh
```
OR

```
$ cd hardwaretest/
$ ./example.sh
```


  

