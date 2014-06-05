Chartbeat Hubot Script
=====================
A Hubot script for accessing the current live traffic count from the Chartbeat
service.

Configuration
-------------
    HUBOT_CHARTBEAT_SITE #Default Site
    HUBOT_CHARTBEAT_SITES #All Sites in Chartbeat separated by comma"
    HUBOT_CHARTBEAT_API_KEY #API Key From Chartbeat

Usage
-----
    hubot chart me - Returns active concurrent visitors from the default site
    specified.
    hubot chart me <host> - Returns active concurrent vistors from the site
    specified.
    hubot chart bomb - Returns active concurrent vistors from all sites


