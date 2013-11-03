critic
======

code review tool - integrated tightly with github

## What is it?

It's a tool that allows users to review other's code (either public github code, or other users code). Pretty straightforward!  
Try it at [b3ngr33ni3r.github.com/critic](http://b3ngr33ni3r.github.io/critic).

## How's it work?

It's written in __javascript__, with an (optional) __node__ backend. This means you can run critic in the browser, or a full-fledged
server via the command line. If you're hosting critic yourself, and you can run long-term processes on your hosting box, *node is way easier*.

## Is it easy to setup?

Yes and no. If you want to __run a node server__, you can just `npm install critic` (maybe, if i can secure this name). Then, `npm start` and fill
out the command line prompts (github app info, callback url, etc). You'll only be prompted for this on the first launch, upon which we create
a json or yaml config file. This will be used for the next launches.  

If you're using __the browser version__ then it's a little trickier. the easiest way is to clone the `prod-web` branch of this repo, and follow
the instructions in the `INSTALL.md` file. 

## Licensing?

Sharing is caring... It's the [MIT License](./blob/master/LICENSE). Questions? Open an issue, or tweet at me!