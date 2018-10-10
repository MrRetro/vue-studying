import Vue from 'vue'
import App from './App.vue'
import Clock from './lib'

Vue.use(Clock)

new Vue({
  el: '#app',
  render: h => h(App)
})
