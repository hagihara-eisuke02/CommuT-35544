window.addEventListener('load', () => {
  const roomButton = document.getElementById("video-button")
  const videoEnd = document.getElementById("video-end")

roomButton.addEventListener('click', () => {
  document.getElementById("room").style.display = 'block';
  document.getElementById("message").style.height = 'calc(100vh - 538.5px)';
})

videoEnd.addEventListener('click', () => {
  location.reload();
})
})

import Vue from 'vue/dist/vue.esm'
import Room from '../room.vue'

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    el: '#room',
    data: {
    },
    components: { Room }
  })
})

