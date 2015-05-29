testx-soap-keywords
=====

A library that extends testx with keywords for testing soap services. This library is packaged as a npm package.

## How does it work
From the directory of the art code install the package as follows:
```sh
npm install testx-soap-keywords --save --registry=http://npm.isd.ictu
```

After installing the package add the keywords to your protractor config file as follows:

```
testx.addKeywords(require 'testx-soap-keywords')
```

## Keywords

| Keyword                | Argument name | Argument value  | Description | Supports repeating arguments |
| ---------------------- | ------------- | --------------- |------------ | ---------------------------- |
| soap                   |               |                 | Send soap request and assert soap response |  |
|                        | url           | location to the webservice || No |
|                        | request       | the request to send to the service || No |
|                        | xpath         | xpath expression to the node value or node attribute value || No |
|                        | expected      | expected value || No |
|                        | [xmlns attr name] | [xmlns attr value] | Specify the xmlns attribute name (e.g. saml2p) and value (e.g. http://...) | Yes |
