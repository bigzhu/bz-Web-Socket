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
      the_key: {
        type: String,
        required: true
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
    mounted () {
      if (_.isEmpty(this.web_socket)) { this.initSocket() }
      this.web_socket.onmessage = this.onMessage
    },
    methods: {
      initSocket: function () {
        console.log('initSocket')
        let url = 'ws://' + window.location.hostname + ':' + window.location.port + this.path
        this.web_socket = new window.WebSocket(url)
        this.web_socket.onopen = this.register
        this.web_socket.onclose = this.onClose
      },
      onClose: function (event) {
        window.setTimeout(this.initSocket(), 5000)
      },
      onMessage: function (event) {
        let data = JSON.parse(event.data)
        if (data.error !== '0') { throw new Error(data.error) }
        this.$emit('on_message', data)
      },
      register: function () {
        console.log('connected and register')
        let data = {}
        data.oper = 'register'
        data.key = this.the_key
        data = JSON.stringify(data)
        this.web_socket.send(data)
      }
    }
  }
</script>
<style>
</style>
