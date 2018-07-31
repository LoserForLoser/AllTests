<template>
  <li class="itemColor" @click="tuochDelete">{{content}} {{index}}</li>
</template>

<script>
export default {
  props: ['content', 'index'],
  methods: {
    tuochDelete () {
      alert(this.index + "元素需删除")
      this.$emit('delete', this.index)
    }
  }
}
</script>

<style scoped>
  .itemColor {
    color: chartreuse
  }
</style>
