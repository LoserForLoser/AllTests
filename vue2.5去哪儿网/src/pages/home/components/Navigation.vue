<template>
    <div class="navigation">
        <button class="closeBtn">
            <img class="closeBtnImg" src="../../../assets/d1_coupon.png" alt="">
        </button>
        淡蓝色空气治理
        <button class="moreBtn">
            <img class="moreBtnImg" src="../../../assets/d1_coupon.png" alt="">
        </button>
    </div>
</template>

<script>
export default {
  name: 'MyNavigation'
}
</script>

<style lang="stylus" scoped>
  .navigation
    margin-left :0px
    margin-right :0px
    margin-top :0px
    height :44px
    background : #F2F2F2
    display: flex
    align-items:Center
    .closeBtn
      margin-left :16px
      width :16px
      height :16px
      .closeBtnImg
        margin-left :0px
        margin-right :0px
        margin-top :0px
        width :16px
        height :16px
    .moreBtn
      margin-right :16px
      width :16px
      height :16px
      .moreBtnImg
        margin-left :0px
        margin-right :0px
        margin-top :0px
        width :16px
        height :16px
</style>
