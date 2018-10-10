/**
 * User: retro.
 * Time: 2018/10/10
 */

import testClock from './clock'
let components = {}
components.install = function (Vue) {
  Vue.component(testClock.name, testClock) // testClock.name 组件的name属性
}
export default components
