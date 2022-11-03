#!/usr/bin/env node

const fs = require('fs')
const transformAndWriteToFile = require('json-to-frontmatter-markdown').default;
const TurndownService = require('turndown')
const turndownService = new TurndownService()

let rawdata = fs.readFileSync( __dirname + '/data/notice.json')
let notices = JSON.parse(rawdata)

let notice = metaData = notices[0]
const markdown = turndownService.turndown(notice.content)
console.log(notice.content, "\n\n=======\n\n", markdown);return;
delete metaData ['content']
metaData = Object.entries(metaData).map(entry => ({ [entry[0]]: entry[1] }));

transformAndWriteToFile({
  frontmatterMarkdown: {
    frontmatter: metaData,
    body: markdown
  },
  path: '/home/ubuntu/team-durumi/womenandwar/migration',
  fileName: 'notice-1.md'
});
