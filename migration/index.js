#!/usr/bin/env node

const fs = require('fs')
const transformAndWriteToFile = require('json-to-frontmatter-markdown').default;
const TurndownService = require('turndown')
const turndownService = new TurndownService()
const HTMLParser = require('node-html-parser');
const YAML = require('json2yaml');

let rawdata = fs.readFileSync( __dirname + '/data/3-resource.json')
let posts = JSON.parse(rawdata)

posts.forEach((post) => {
  let notice = frontmatter = post;
  // body
  let body = notice.content
  let markdown = turndownService.turndown(body)
  // console.log(body, "\n\n=======\n\n", markdown);return;

  // frontmatter
  delete frontmatter['content']
  for (var propName in frontmatter) {
    if (frontmatter[propName] === null || frontmatter[propName] === undefined || frontmatter[propName] === '') {
      delete frontmatter[propName];
    }
  }
  // process datetime -- ex) 20180829212530
  const parseDatetime = (str) => {
    arr = str.split('')
    arr.splice(4, 0, '-')
    arr.splice(7, 0, '-')
    arr.splice(10, 0, ' ')
    arr.splice(13, 0, ':')
    arr.splice(16, 0, ':')
    return arr.join('')
  }
  frontmatter['created'] = parseDatetime(frontmatter['created'])
  frontmatter['updated'] = parseDatetime(frontmatter['updated'])

  // process image
  if ('thumbnail_file' in frontmatter) {
    frontmatter['image'] = frontmatter['thumbnail_file'];
    if (frontmatter['thumbnail_file'].startsWith('/wp-content/')) {
      frontmatter['image'] = '/kr' + frontmatter['thumbnail_file'];
    }
    delete frontmatter['thumbnail_file'];
  }
  else {
    let dom = HTMLParser.parse(body)
    let firstImg = dom.querySelector('img')?.getAttribute('src')
    if (firstImg) {
      frontmatter['image'] = firstImg
    }
  }

  // process attachments
  let attachments = [];
  if ('files_name' in frontmatter) {
    names = frontmatter['files_name'].split('|');
    urls = frontmatter['files_path'].split('|');
    download_counts = frontmatter['files_download_count'].split('|');
    if (typeof names != 'string') {
      for (let [index, val] of names.entries()) {
        attachments.push({label: val, url: '/kr' + urls[index], count: download_counts[index]})
      }
    }
    else {
      attachments.push({label: val, url: '/kr' + urls, count: download_counts})
    }
    delete frontmatter['files_name'];
    delete frontmatter['files_path'];
    delete frontmatter['files_download_count'];
    frontmatter['attachments'] = attachments;
  }

  markdown = YAML.stringify(frontmatter, null) + "---\n" + markdown;

  transformAndWriteToFile({
    frontmatterMarkdown: {
      body: markdown
    },
    path: '/home/ubuntu/team-durumi/womenandwar/migration/data/resource/',
    fileName: frontmatter.id + '.md'
  });
})
