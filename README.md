critic
======

> __Note:__ This needs to be rewritten, as it doesn't reflect the decisions that have been made about how critic works. 

code review tool - integrated tightly with github

## What is it?

It's a tool that allows users to review other's code (either public github code, or other users code). Pretty straightforward!  
Try it at [b3ngr33ni3r.github.com/critic](http://b3ngr33ni3r.github.io/critic).

## How's it work?

It's written in __javascript__, with a __node__ backend. This means critic runs in the browser.

## Is it easy to setup?

Yes and no. If you want to __run a node server__, you can just `npm install critic` (maybe, if i can secure this name). Then, `npm start` and fill
out the command line prompts (github app info, callback url, etc). You'll only be prompted for this on the first launch, upon which we create
a json or yaml config file. This will be used for the next launches.  


## Licensing?

Sharing is caring... It's the [MIT License](./blob/master/LICENSE). Questions? Open an issue, or tweet at me!
