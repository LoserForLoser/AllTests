<template>
    <div class="propertyType">
        <div class="myCoupon">
            <img class="myCouponImg" src="../../../assets/d1_coupon.png" alt="">
            我的优惠券
            <!-- <img class="userImg" src="../../../assets/tou_xiang.png" alt=""> -->
        </div>
        <div class="myWallet">
            <img class="myWalletImg" src="../../../assets/d1_wallet.png" alt="">
            我的钱包
            <!-- <img class="userImg" src="../../../assets/tou_xiang.png" alt=""> -->
        </div>
    </div>
</template>

<script>
export default {
  name: 'UserProperty'
}
</script>

<style lang="stylus" scoped>
  .propertyType
    margin-top :10px
    margin-left :15px
    margin-right :15px
    height :100px
    border-radius :4px
    background :yellow
    .myCoupon
      margin-top :0px
      margin-left :0px
      margin-right :0px
      height :50px
      font-size :14px
      color :#545454
      display: flex
      align-items:Center
      .myCouponImg
        width :30px
        height :30px
        margin-left :10px
        margin-right :5px
    .myWallet
      margin-top :0px
      margin-left :0px
      margin-right :0px
      height :50px
      font-size :14px
      color :#545454
      display: flex
      align-items:Center
      .myWalletImg
        width :30px
        height :30px
        margin-left :10px
        margin-right :5px
</style>
