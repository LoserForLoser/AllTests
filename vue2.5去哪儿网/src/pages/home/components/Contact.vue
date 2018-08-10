<template>
    <div class="contactPhone">
        <img class="contactImg" src="../../../assets/d1_phone.png" alt="">
        <p class="contactTitle">联系我们</p>
        <p class="contactPhone">400-800-8888</p>
    </div>
</template>

<script>
export default {
  name: 'ContactUs'
}
</script>

<style lang="stylus" scoped>
  .contactPhone
    margin-top :10px
    margin-left :15px
    margin-right :15px
    height :50px
    border-radius :4px
    background :green
    font-size :14px
    color :#333333
    display: flex
    align-items:Center
    .contactImg
      margin-left :10px
      margin-right :5px
      width :30px
      height :30px
    .contactTitle
      float:left
    .contactPhone
      float:left
</style>
