DPPReachability
===============

Is a library built on top of [Reachability](https://github.com/tonymillion/Reachability) by Toni Million that manages 
the reachability of network Wifi either WAN.
DPPReachability is based on idea that allows developer to don't create instance Reachability class inside every 
ViewControlleror use [UIApplication sharedApplication] to share object through different classes 
but to use a single object through different classes.

The class maintains all advantages of Reachability.

Use
===
DPPReachability should be istantiated only once. To istantiate class, you should invoke
<code>
DPPReachability *reachManager = [DPPReachability sharedInstance];
</code>

And then invoke the method
<p>
<code>
(void)setupReachibilityManagerUrl:(NSString*)url reachableOnWAN:(BOOL)reachOnWan
</code>
</p>
Above method should be called only once.

I suggest to setup your DPPReachability inside AppDelegate, particularly in method 
<p>
<code> 
(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
</code>
</p>

In every class where you are need to check connection, you can retrieve singleton and then check the BOOL property <code>isReachable</code> that indicate when connection available or not.

It's also possibile to use Blocks, called when the OS lost or retrieve the connection, to accomplish some operation.
You use Blocks invoking the method 

<code> 
(void)setupReachableBlock:(DPPReacheableBlock)reachBlock unreachableBlock:(DPPUnreacheableBlock)unreachBlock
</code>

The <bold>reachableBlock</bold> will be called every time the connection goes up. 
The <bold>unreachableBlock</bold> will be called every time the connection goes down.

ToDo
====


License
=======

The MIT License (MIT)

Copyright (c) 2014 Dario Pizzuto

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
