var request = require('request-promise')
  , cheerio = require('cheerio')
  , fs = require('fs').promises
  , sha1 = require('sha1')
  , path = require('path');

var sourceDictionaryPath = path.join(__dirname, '..', 'CombineMarbles', 'Operators')
  , documentationDictionaryPath = path.join(__dirname, '..', 'documentation');

fetchURLs(sourceDictionaryPath)
  .then(urls => Promise.all(urls.map(url => loadDocumentation(url, documentationDictionaryPath))))
  .catch(error => console.log(error))

function fetchURLs(directoryPath) {

  return fs.readdir(directoryPath)
    .then(function(files) {
      return Promise.all(
        files.map(file => loadURLFromFiles(file, directoryPath))
      )
    })
    .then(function(result) {
      return result.flat()
    })
}

function loadURLFromFiles(file, directoryPath) {
  var filepath = path.join(directoryPath, file)
    , urlMatcher = /\"https:\/\/developer.apple.com\/([\w\/-]*)\"/g;
  
  return fs.readFile(filepath, 'utf8')
    .then(function(document) {
      var urls = []
      while ((match = urlMatcher.exec(document)) !== null) {
        var url = match[0]
        urls.push(url.substring(1,url.length-1))
      }
      return urls
    })
}

function loadDocumentation(url, documentationPath) {
  return request(url)
    .then(transform)
    .then(parse)
    .then(save(url, documentationPath))
}

function transform(data) {
  return new Promise(function(resolve, reject) {
    resolve(cheerio.load(data));
  })
}

function parse(body) {
  return new Promise(function(resolve, reject) {
    $ = body;
    var result = {};

    result["function"] = $('.topic-heading').text()
    result["description"] = $('.topic-description').text();
    result["params"] = $('#parameters .datalist').children('.datalist-term')
      .map((_, el) => {
        return { "terms": $(el).text(), "description": $(el).next().text() }
      })
      .get();

    result["return"] = $('#return-value .formatted-content').text()

    resolve(result)
  })
}

function save(url, documentationPath) {
  return function(body) {
    var filepath = path.join(documentationPath, sha1(url) + '.js')
      , text = JSON.stringify(body, null, 4);
      
    return fs.writeFile(filepath, text)
  }
}
