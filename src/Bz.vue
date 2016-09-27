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
      }
    },
    components: {
    },
    data: function () {
      return {
        state: 0,
        web_socket: {}
      }
    },
    ready () {
      if (_.isEmpty(this.web_socket)) {
        let url = 'ws://' + window.location.hostname + ':' + window.location.port + this.path
        // url = 'ws://127.0.0.1:9000/web_socket'
        this.web_socket = new window.WebSocket(url)
      }
      this.web_socket.onmessage = this.onMessage
    },
    methods: {
      onMessage: function (event) {
        console.log(event)
      }
    }
  }
</script>
