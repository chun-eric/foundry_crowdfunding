# Setting up Foundry

## Step 1: Install Windows Terminal and Windows System for Linux

First download windows terminal from the Microsoft Store. 


We will be installing linux for windows or Windows Subsystem for Linux. (wsl)

Run as administrator.

Then type in the below code:

```
wsl --install
```

![img-1]()


It will ask you to make a new username and password.
Fill in the new username and password information. 

Wait a couple of minutes. The installation should be done. 

![img-2]()


Reboot the system.


Now open a new instance on the windows terminal from the drop down arrow. 

```
Choose > Ubuntu
```

We need VS code to be compatible with WSL.
In VS code download the following extension, 
remote development. 

![img-3]()

In the bottom left corner there is "Open remote Window" icon. 


![img-4]()


We can click it and run WSL from here. But there is a better way. 


From our Ubuntu terminal we can create a directory from here or if we have already created a directory, we can access it from the terminal. 

We have already created a folder so we can just access from the terminal by typing in the full path of the file name:

For example:
```
cd /mnt/g/Smart Contracts/crowd_funding
```

This will change directory to the path we just typed above. Then we can type:

```
code .
```

This will open VS code from the current directory path. 

![img-5]


Now we have opened a new instance of WSL in VS code. Awesome!


In your terminal then type the following code to update wsl and ubuntu.

```
sudo apt update
[type in password]
```


Okay next we need to make sure we have git installed.
To check if it is already installed, type:

```
git --version
```

Configuring our contract with GitHub
