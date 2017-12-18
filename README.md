<a href="https://github.com/Requarks/wiki">
    <img src="https://raw.githubusercontent.com/Requarks/wiki/master/assets/favicons/favicon-96x96.png" alt="Wiki.js" title="Wiki.js" align="right" />
</a>

# Wiki.js Docker image

>docker run -itd -p 8080:3000 -v wikijs_db:/data/db -v wikijs_data:/var/wiki/persistent --name wiki bubblepackpirate/wikijs:latest


The first run of the container will run `node wiki configure`which will run through first setup items. Pay close attention to the port you're exposing and the hostname you set in the setup.  Assuming you mapped your volumes correctly, future startups will just run the normal `node wiki start`


## Pre-bundled: 
* MongoDB
* local Git

#### Recommend splitting these out for large scale deployments! Just point to them in either your initial config or the `/var/wiki/config.yml`

