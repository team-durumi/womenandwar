import resolveConfig from 'tailwindcss/resolveConfig'
import tailwindConfig from './tailwind.config.js'
import Alpine from 'alpinejs'
import { Iodine } from '@kingshott/iodine'
import * as params from '@params';

window.params = params;
window.iodine = new Iodine();
window.Alpine = Alpine
window.Alpine.start()

const twConfig = resolveConfig(tailwindConfig)
const twScreens = twConfig.theme.screens
const getScreenBreakpoint = (name) => {
  let breakpoint = 0
  if (name in twScreens) {
    breakpoint = parseInt(twScreens[name], 10)
  }
  return breakpoint
}
const getScreenName = () => {
  let screenName = '';
  let nextBreakpoint = 0;
  const width = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth
  for (const name of Object.keys(twScreens)) {
    const breakpoint = getScreenBreakpoint(name)
    if (breakpoint > nextBreakpoint && breakpoint <= width)  {
      nextBreakpoint = breakpoint
      screenName = name
    }
  }
  return screenName
}

const $ = document.querySelector.bind(document)
const $$ = document.querySelectorAll.bind(document)

window.addEventListener('DOMContentLoaded', () => {
  console.log('domready!', twScreens, getScreenName(), params)
})
