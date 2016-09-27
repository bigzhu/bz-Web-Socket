<style lang=less>
</style>

<template>
  <div>
  </div>
</template>

<script>
  import _ from 'underscore'
  export default {
    props: {
      path: {
        type: String,
        required: true
      },
      key: {
        type: String,
        required: true
      },
      call_back: {
        type: Function
      },
      web_socket: {
        type: Object,
        twoWay: true
      }
    },
    components: {
    },
    computed: {
    },
    watch: {
    },
    data: function () {
      return {
        web_socket: {}
      }
    },
    ready () {
      if (_.isEmpty(this.web_socket)) this.init()
      this.web_socket.onmessage = this.onMessage
    },
    methods: {
      init: function () {
        console.log('init')
        let url = 'ws://' + window.location.hostname + ':' + window.location.port + this.path
        this.web_socket = new window.WebSocket(url)
        this.web_socket.onopen = this.register
        this.web_socket.onclose = this.onClose
      },
      onClose: function (event) {
        window.setTimeout(this.init(), 5000)
      },
      onMessage: function (event) {
        let data = JSON.parse(event.data)
        if (data.error !== '0') throw new Error(data.error)
        if (this.call_back) this.call_back(data)
      },
      register: function () {
        console.log('connected and register')
        let data = {}
        data.oper = 'register'
        data.key = this.key
        data = JSON.stringify(data)
        this.web_socket.send(data)
      }
    }
  }
</script>
