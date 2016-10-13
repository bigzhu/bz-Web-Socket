<template>
  <div>
    <doc :name="name"
      :desc="desc"
      :parm_desc="parm_desc"
      :parms="parms"
      :code="code"
      >
      <bz v-on:on_message="call_back" path="/web_socket" the_key="shop_id"></bz>
    </doc>
  </div>
</template>

<script>
  import 'bz-semantic-ui-card'
  import 'bz-semantic-ui-grid'
  import Bz from './Bz'
  import Doc from 'bz-doc'
  export default {
    components: {
      Bz,
      Doc
    },
    route: {
    },
    data: function () {
      return {
        datas: [1],
        name: 'bz-web-socket',
        desc: '拉到底部加载',
        parms: [
          {parm: 'el', desc: '使用该组件的el,主要为了把查找last限定在本el中. !注意, fragment的el是无法传递进去的'},
          {parm: 'element_class', desc: '用于定位last的class .hah.jj 的格式'},
          {parm: 'call_back', desc: '滚到底部的回调函数'}
        ],
        parm_desc: ``,
        code: `<bottom-loader :el="$el" element_class=".ui.card" :call_back="call_back"></bottom-loader>`
      }
    },
    methods: {
      call_back: function (data) {
        console.log(data)
      }
    }
  }
</script>

<style>
</style>
