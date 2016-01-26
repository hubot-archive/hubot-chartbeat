Chartbeat Hubot Script
=====================
[![NPM version](https://badge.fury.io/js/hubot-chartbeat.svg)](http://badge.fury.io/js/hubot-chartbeat)

A Hubot script for accessing the current live traffic count from the Chartbeat
service.

Configuration
-------------
    #Default Site, responds to `chart me`
    HUBOT_CHARTBEAT_SITE=example.com

    #Comman separated list of all sites in Chartbeat
    HUBOT_CHARTBEAT_SITES=example1.com,example2.com

    #API Key
    HUBOT_CHARTBEAT_API_KEY=XXXXXXXXXXXXXXXX

    #Optional Chartbeat section (Chartbeat Publishing only)
    HUBOT_CHARTBEAT_SECTION=example

Usage
-----
    hubot chart me        - Returns active concurrent visitors from the default site specified.
    hubot chart me <site> - Returns active concurrent vistors from the site specified.
    hubot chart bomb      - Returns active concurrent vistors from all sites
