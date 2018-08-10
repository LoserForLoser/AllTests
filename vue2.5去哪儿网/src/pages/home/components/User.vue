<template>
    <div class="userMsg">
        <img class="userImg" src="../../../assets/tou_xiang.png" alt="">
        {{userMsg.name}}
        <img class="userSex" src="../../../assets/man.png" alt="">
    </div>
</template>

<script>
export default {
  name: 'UserMessage',
  data () {
    return {
      userMsg: {
        icon: '../../../assets/tou_xiang.png',
        name: '头像 昵称 性别',
        sex: '../../../assets/man.png'
      }
    }
  }
}
</script>

<style lang="stylus" scoped>
  .userMsg
    margin-top :15px
    margin-left :15px
    margin-right :15px
    height :100px
    border-radius :4px
    background :blue
    font-size :18px
    color :#333333
    display: flex
    align-items:Center
    .userImg
      margin-left :20px
      margin-right :21px
      width :68px
      height :68px
    .userSex
      margin-left :6px
      width :20px
      height :20px
</style>
