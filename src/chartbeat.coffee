# Description:
#   Display number of concurrent visitors to the specified site or section.
#
# Dependencies:
#   None
#
# Configuration:
#   HUBOT_CHARTBEAT_SITE
#   HUBOT_CHARTBEAT_SITES <comma separated string of all sites>
#   HUBOT_CHARTBEAT_API_KEY <use global key for access to all sites>
#   HUBOT_CHARTBEAT_SECTION <optional section for Chartbeat Publishing users>
#
# Commands:
#   hubot chart me - Returns active concurrent visitors from the default site specified.
#   hubot chart me <site> - Returns active concurrent visitors from the site specified.
#   hubot chart bomb - Returns active concurrent visitors from all sites.
#
# Notes:
#   How to find these settings:
#   Log into chartbeat then browse to
#   http://chartbeat.com/docs/api/explore
#
# Author:
#   Drew Delianides

getChart = (msg, apiKey, site, section) ->
  postUrl = "http://api.chartbeat.com/live/quickstats/v4/?apikey=#{apiKey}&host=#{site}"
  if (section)
    postUrl += "&section=#{section}"
  msg.robot.http(postUrl)
      .get() (err, res, body) ->
        unless res.statusCode is 200
         msg.send "There was a problem with Chartbeat. Do you have access to this domain?"
         return

        response = JSON.parse(body)
        people = response.data.stats.people || []

        if (people < 1)
          msg.send "It doesn't appear that #{site} has any visitors right now"
          return

        pluralize = if (people == 1) then "person" else "people"
        section = if (section) then " '#{section}' section" else ""
        msg.send "I see #{people} #{pluralize} on #{site}#{section} right now!"

module.exports = (robot) ->
  robot.respond /chart( me)? (.*)/i, (msg) ->
    if (!process.env.HUBOT_CHARTBEAT_SITE && msg.match[2] == 'me')
      msg.send "You need to set a default site"
      return
    if (!process.env.HUBOT_CHARTBEAT_SITES && msg.match[2] == 'bomb')
      msg.send "You need to set a list of sites"
      return

    sites = switch msg.match[2]
      when "me" then [process.env.HUBOT_CHARTBEAT_SITE]
      when "bomb" then process.env.HUBOT_CHARTBEAT_SITES.split(",")
      when "*" then process.env.HUBOT_CHARTBEAT_SITES.split(",")
      else [msg.match[2]]

    apiKey = process.env.HUBOT_CHARTBEAT_API_KEY
    section = process.env.HUBOT_CHARTBEAT_SECTION

    getChart(msg, apiKey, site, section) for site in sites
