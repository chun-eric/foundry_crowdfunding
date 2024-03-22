# Foundry Crowdfunding Smart Contract

## Setting up Foundry

<br/>
<br/>

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

<br/>
<br/>

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

<br/>
<br/>

### Step 3: Install Foundry.

Reading the Foundry documentation is the easiest way to install Founder.
The url is at: `https://book.getfoundry.sh/`

To install Foundry type this in your terminal.

```
curl -L https://foundry.paradigm.xyz | bash
```

Then in a new terminal type:

```
foundryup
```

This will install 4 components `forge, cast, anvil and chisel.`

<br/>
<br/>

### Step 4: Create a Foundry project.

To create a new project type:

```
forge initi
```

Sometimes you might have to type the below code, which forces it initiazlie.
It's best to initialize a new project without content inside or else it might
delete it! That's what happened to me and I had to go back and revert some changes
in the Timeline. Oh jeez!

```
forge initi --force
```

We also need to delete our default files in script, src, and test folders.

After that we can go into our preferences, by pressing
` Ctrl + Shift + P` and click on `Open User Settings: JSON`

and adding the following code.

```
"[solidity]": {
    "editor.defaultFormatter": "NomicFoundation.hardhat-solidity"
  },
  "window.zoomLevel": 1,
  "[javascript]":{
  "editor.defaultFormatter": "esbenp.prettier-vscode"
}
```

I was getting error messages for the `esbenp.prettier-vscode` extension.
After some research, I had to just install the extension in vscode through
`Ctrl + P` and add the following line `ext install esbenp.prettier-vscode`.
Now all my JSON files are properly formatted.

This will also make solidity our default formatter and increase our zoom level to 1.

We will also should add a TOML extension to make the file format correctly using TOML. Choose any TOML extension you want. I used the "Better TOML" extension.

In preferences, you can format on save by going to:

```
Open user settings > Click > Format on Save
```

This is the end of setting up Foundry. Wow, that was more challenging that I thought.

<br/>

## Compiling a Smart Contract

How do we compile a smart contract in foundry with VS Code?
It was easy in Remix but how do we go about doing this?

It's very easy we only need to type:

```
forge build
```

It will then create a new folder called `out` that will spit out a json file in a huge object.

## Deploying a Smart Contract to your Local Machine

We can deploy a smart contract by typing `anvil`.

It's similar to Remix for dev purposes but it's not very UI/UX friendly. It has that Linux Bash Terminal look. Personally, I don't mind that at all.

Anvil creates a virtual environent, and it comes with fake available accounts, fake private keys, a RPC URL, wallet mnomic and some other details.

If you want to have better UI/UX to see your transactions and its logs you can install Ganache as well.

Anvil has a default chain ID of 31337.
Ganache has a default chain ID of 1337.

## Deploying a Smart Contract to Metamask

We can add a custom network in Metamask.

Open and login to Metamask.

The click the three dots on the top right.

<a href="https://ibb.co/1GqHKKR"><img src="https://i.ibb.co/Ldt4669/6.png" alt="6" border="0"></a>

Go to:

```
Settings > Networks > Add Network
```

<a href="https://ibb.co/3dHdjmy"><img src="https://i.ibb.co/9gjg1H9/7.png" alt="7" border="0"></a>

<a href="https://ibb.co/ckHN4kY"><img src="https://i.ibb.co/HBsr5Bh/8.png" alt="8" border="0"></a>

<a href="https://ibb.co/Z2mf0s2"><img src="https://i.ibb.co/6XBykhX/9.png" alt="9" border="0"></a>

```
Click > Add a network manually
```

<a href="https://ibb.co/Y8T92rh"><img src="https://i.ibb.co/P4zpxSg/10.png" alt="10" border="0"></a>

Fill in the details.

<a href="https://ibb.co/YD1MsS7"><img src="https://i.ibb.co/tZvtr6M/11.png" alt="11" border="0"></a>

```
Name: Localhost
RPC URL: http://(add ip address: add port number)
Chain Id : 31337
Symbol: ETH
```

<a href="https://ibb.co/3vFLwkw"><img src="https://i.ibb.co/vhdKbDb/12.png" alt="12" border="0"></a>

Great, we have now created our localhost in Metamask.
It's important that anvil is running in the background.
Otherwise we cannot create a localhost and save it in Metamask.

Now we can import an account into our Metamask.

Grab one of the private keys that Anvil has given us then go to
Metamask and paste it into your Account.

Add your private key.

<a href="https://ibb.co/Tg9XBKh"><img src="https://i.ibb.co/vj05xsz/13.png" alt="13" border="0"></a>

Great it is all working now. We have 10000 Fake ETH in our account.
This is the same exact process we can add any new network into Metamask.

<a href="https://ibb.co/4Jx3Yhs"><img src="https://i.ibb.co/SJpGdFQ/14.png" alt="14" border="0"></a>

## Deploying a Smart Contract with Forge

The below code will create a new contract called SimpleStorage.
It doesn't reqlly require the rpc url as we are deploying from anvil, but good to do sometimes. The also want to use a private key so we will use the --interactive flag.

```
forge create SimpleStorage --rpc-url http://127.0.0.1:8545 --interactive
```

Input your private keys.

As you can see below, we can see a transaction has gone through.

<a href="https://ibb.co/tB8CgM2"><img src="https://i.ibb.co/mJ6zkCy/15.png" alt="15" border="0"></a>

However a better way to deploy smart contracts is through scripts.

Create a new script in called DeployeSimpleStorage in the src folder.

We will need to import the Script library from forge-std as well as the SimpleStorage contract.

This is the code below.

```
import {Script} from "forge-std/Script.sol";
import {SimpleStorage} from "../src/SimpleStorage.sol";
```

Now we can name our new contract DeploySimpleStorage like this.

```
contract DeploySimpleStorage is Script {
    function run() external returns (SimpleStorage) {}
}
```

The `is` keyword means DeploySimpleStorage is inheriting from the Script contract. It allows us run methods attached to the Script contract.

The run function means it can be called from outside and it will return an instance of the SimpleStorage contract.

One of the methods we can use from the Script contract is called,
`vm.startBroadcast()` and `vm.stopBroadcast()` functions.

Any code within these two functions will run and be executed.
That means we can insert a new SimpleStorage instance here.
The code below will make it clear.

```
contract DeploySimpleStorage is Script {
    function run() external returns (SimpleStorage) {
        vm.startBroadcast();
        SimpleStorage simpleStorage = new SimpleStorage();
        vm.stopBroadcast();
        return simpleStorage;
    }
}
```

Now we can try and deploy our script.
Type:

```
forge script script/DeploySimpleStorage.s.sol --rpc-url $RPC_URL --broadcast --private-key $PRIVATE_KEY
```

`$RPC_URL` and `$PRIVATE_KEY` are variables that hold the value of each a rpc url and our demo private key. They are stored in a separate .env or environment variable file.

To run the above script we have to run the below code before running the script:

```
source .env
```

This will add the environment variables in the shell.

**Error message troubleshooting**
I have been getting an error message when executing the script:
```contract source info format must be `<path>:<contractname>`or`<contractname>`

**Solution fix**
There was a typo in my command line.
Okay the transaction has gone through now. Great.

<a href="https://ibb.co/C1bjgRj"><img src="https://i.ibb.co/K02tdTt/16.png" alt="16" border="0"></a>

For real production that uses real money, this is not good practice but for development purposes this is fine for now. We will discuss a better way to keep our private keys more secure.

With real money we should use a keystore file. I will research into that later.

**Important side note**
A great tip for converting from hexadecimal to a decimal value, we can use the following code:

```
cast --base-to <hexadecimal> dec
```

This will convert a hex number to a decimal value.
So this is great if you want to find out the gas value.
Gas values are stored as hexadecimal.

If you look in the broadaast folder and under the "transaction" key object you can see all gas, value, data, type, from, nonce and accessList.

This transaction key object is critical and will send all the data in the transaction. This transaction also will need to be signed by the private key under the hood.
