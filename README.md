# Foundry Crowdfunding Smart Contract

## Setting up Foundry

### Step 1: Install Windows Terminal and Windows System for Linux

First, download windows terminal from the Microsoft Store. 


We will be installing linux for windows or Windows Subsystem for Linux. (wsl)

Run as administrator.Then type in the below code:

```
wsl --install
```

<a href="https://ibb.co/rw93xY7"><img src="https://i.ibb.co/CHL6bg1/1.png" alt="1" border="0"></a>


It will ask you to make a new username and password.
Fill in the new username and password information. 

Wait a couple of minutes. The installation should be done. 

<a href="https://ibb.co/9n2CFWv"><img src="https://i.ibb.co/VVDP7TN/2.png" alt="2" border="0"></a>


Reboot the system.


Now open a new instance on the windows terminal from the drop down arrow. 

```
Choose > Ubuntu
```

We need VS code to be compatible with WSL.
In VS code download the following extension, 
remote development. 

<a href="https://ibb.co/N24qbcs"><img src="https://i.ibb.co/60dSLjm/3.png" alt="3" border="0"></a>

In the bottom left corner there is "Open remote Window" icon. 


<a href="https://ibb.co/2YVS53N"><img src="https://i.ibb.co/yBvpVFS/4.png" alt="4" border="0"></a>


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

<a href="https://ibb.co/Jt2t1xw"><img src="https://i.ibb.co/vqmqFs6/5.png" alt="5" border="0"></a>


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

### Step 2: Setting up our GitHub Repository.

We will be creating a repo from the terminal. This was the most confusing
part of my development. Especially with merge conflicts. I am still 
learning how to get better at Git and version control. 

So after a lot of mistakes, this is what I did. 

First initialize Git:

```
git init
```


Then I have to make sure to install and authenticate with GitHub CLI.

```
gh auth login
```

You have to go through the authentication process. 

Next type:

```
gh repo create
```

This will create the repository creation process. 
After you have done that, you will be prompted to add the repository details. 
Add whatever details you want. You can also set it to public and private. 

You will then need to push your local repo to Github. 
After the repo creation, Github should have given you a url for your repo. 

Type the following:

```
get remote add origin <url>
git branch -M main
git push -u origin main
```


Everything should be setup with your repo. 

To add a filename type git and then add the filename. For now I want to add everything so type:

```
git add .
```

In reality, this isn't a good development practice.

You should make it separate branch and work on it locally. 
Any code changes I make should then be pushed into the main branch.

The pull request can either then be accepted or merged into the main branch
or it can be rejected. 








