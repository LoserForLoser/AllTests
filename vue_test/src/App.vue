<template>
  <div>
    <div>
      <input v-model="inputValue"/>
      <button @click="touch">提♂交</button>
    </div>
    <ul>
      <todo-item v-for="(item, index) of list" :key="index" :content='item' :index='index' @delete="clickDelete(index)"></todo-item>
    </ul>
  </div>
</template>

<script>
import HelloWorld from './components/HelloWorld'
export default {
  components: {
    'todo-item':HelloWorld
  },
  data: function () {
    return {
      inputValue: '',
      list:[]
    }
  },
  methods: {
    touch: function () {
      // alert('123')
      this.list.push (this.inputValue)
      this.inputValue = ''
    },
    clickDelete: function (index) {
      this.list.splice(index, 1)
      alert(index+"元素删除成功")
    }
  }
}
</script>

<style>
/* #app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
} */
</style>
