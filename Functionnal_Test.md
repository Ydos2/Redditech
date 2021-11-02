### Functionnal test Documentation
<br/>

Here is a short introduction if you want to know how to test the program.
As its a Rest-Api Oauth2 application, we **can't** really test it out _automatically_ <br/>

<br/>

### Authentification
<br/>

First you should build _TokenAsk_ Widget, it will require you to log into reddit <br/>
after that try declining when it asks you for permissions <br/>
if it successed the application **must** send you back to the page that asks for permissions <br/>
After that you may try **accepting** the request, it must redirect you to the home pageafter a few moment <br/>
<br/>

### Getting informations
<br/>

Now that you have a Token, you can try pulling data <br/>
First create a subReddit object **_with the name of a subReddit you know_** <br/>
Then use the getInfo() function and print the result<br/>
The result **must** be the same as in the subReddit on the website<br/>
<br/>

### Pulling a subReddit
<br/>

Use the previously subReddit object created.
Then call either getTop(), getHot() or getNew() depending on what you want to test <br/>
Afterward the _posts_ member of your subReddit variable has been fullfilled <br/>
Iterate through the list of posts, it **must** have posts inside **BUT** not in the same order than in reddit <br/>
<br/>