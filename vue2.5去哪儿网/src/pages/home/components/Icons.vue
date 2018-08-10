<template>
    <div class="icons">
        <div class="icon">
            <div class="icon-img">
                <img class="icon-imgcontent" src="https://imgs.qunarzz.com/piao/fusion/1803/95/f3dd6c383aeb3b02.png" alt="">
            </div>
            <p class="icon-desc">热门景点</p>
        </div>

        <div class="icon">
            <div class="icon-img">
                <img class="icon-imgcontent" src="https://imgs.qunarzz.com/piao/fusion/1804/ff/fdf170ee89594b02.png" alt="">
            </div>
            <p class="icon-desc">北京必游</p>
        </div>

        <div class="icon">
            <div class="icon-img">
                <img class="icon-imgcontent" src="https://imgs.qunarzz.com/piao/fusion/1803/6a/45f595250c73d102.png" alt="">
            </div>
            <p class="icon-desc">夏日玩水</p>
        </div>

        <div class="icon">
            <div class="icon-img">
                <img class="icon-imgcontent" src="https://imgs.qunarzz.com/piao/fusion/1803/20/831d62d2e1c7be02.png" alt="">
            </div>
            <p class="icon-desc">文化古迹</p>
        </div>

        <div class="icon">
            <div class="icon-img">
                <img class="icon-imgcontent" src="https://imgs.qunarzz.com/piao/fusion/1803/76/eb88861d78fb9902.png" alt="">
            </div>
            <p class="icon-desc">动植物园</p>
        </div>

        <div class="icon">
            <div class="icon-img">
                <img class="icon-imgcontent" src="https://imgs.qunarzz.com/piao/fusion/1803/6c/9e54a8540fee0102.png" alt="">
            </div>
            <p class="icon-desc">故宫</p>
        </div>

        <div class="icon">
            <div class="icon-img">
                <img class="icon-imgcontent" src="https://imgs.qunarzz.com/piao/fusion/1804/5a/13ceb38dcf262f02.png" alt="">
            </div>
            <p class="icon-desc">一日游</p>
        </div>

        <div class="icon">
            <div class="icon-img">
                <img class="icon-imgcontent" src="https://imgs.qunarzz.com/piao/fusion/1804/95/8d02011d149bdb02.png" alt="">
            </div>
            <p class="icon-desc">汽车票</p>
        </div>
    </div>
</template>

<script>
export default {
  name: 'HomeIcons'
}
</script>

<style lang="stylus" scoped>
    @import '~styles/varibles.styl'
  .icons
    margin-top :.2rem
    overflow: hidden
    height :0
    padding-bottom :50%
    .icon
      position :relative
      overflow :hidden
      float :left
      width :25%
      height :0
      padding-bottom :25%
      .icon-img
        position :absolute
        top :0
        left :0
        right :0
        bottom :.44rem
        box-sizing :border-box
        padding :.1rem
        .icon-imgcontent
          display :block
          margin :0 auto
          height :100%
      .icon-desc
       position :absolute
       left :0
       right :0
       bottom :0
       height :.44rem
       line-height :.44rem
       text-align :center
       color :$darkTextColor
</style>
