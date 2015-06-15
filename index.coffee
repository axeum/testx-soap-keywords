request   = require 'request'
deasync   = require 'deasync'
dom       = require('xmldom').DOMParser
xpath     = require 'xpath'
beautify  = require('pretty-data').pd
message   = require 'jasmine-custom-message'
_         = require 'lodash'


module.exports =
  'soap': (args) ->
    if args.url.indexOf('/') == 0
      args.url = browser.baseUrl + args.url

    post = deasync request.post
    res = post
      url: args.url
      headers:
        'Content-Type': 'text/xml;charset=UTF-8'
      body: args.request
    console.log "Received soap response: \n #{beautify.xml res.body}"
    doc = new dom().parseFromString(res.body)
    namespaces = {}

    for key, val of _.omit(args, ['url', 'xpath', 'expected', 'request'])
        namespaces[key] = val

    select = xpath.useNamespaces(namespaces);

    node = select(args.xpath, doc)[0]
    if typeof node != 'undefined'
      for key, val of _.omit(args, ['url', 'xpath', 'request'])
        if key.match /expected/i
          console.log "Actual nodeValue = #{node.nodeValue}\nExpected nodeValue = #{val}"
          expect(node.nodeValue).toBe(val)
    else
      since("Node with xpath '#{args.xpath}' should be in the response body").
      expect(node).not.toBe(undefined)
