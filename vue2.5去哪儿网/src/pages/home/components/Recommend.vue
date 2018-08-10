<template>
    <div>
        <div class="title">热销推荐</div>
        <ul>
            <li class="item border-bottom" v-for="(item, index) of recommendList" :key="index">
                <img  class="item-img" src="item.imageUrl" alt="">
                <div class="item-info">
                    <p class="item-title">{{item.title}}</p>
                    <p class="item-desc">{{item.desc}}</p>
                    <button class="item-button">查看详情</button>
                </div>
            </li>
        </ul>
    </div>
</template>

<script>
export default {
  name: 'HomeRecommend',
  data () {
    return {
      recommendList: [{
        id: '0001',
        imageUrl: 'https://imgs.qunarzz.com/sight/p0/1803/12/126471e0966aca5ba3.img.jpg_200x200_f1286016.jpg',
        title: '北京国际鲜花港',
        desc: '北京国际鲜花港北京国际鲜花港北京国际鲜花港北京国际鲜花港'
      }, {
        id: '0002',
        imageUrl: 'https://imgs.qunarzz.com/sight/p0/1803/12/126471e0966aca5ba3.img.jpg_200x200_f1286016.jpg',
        title: '北京国际鲜花港',
        desc: '北京国际鲜花港北京国际鲜花港北京国际鲜花港北京国际鲜花港'
      }, {
        id: '0003',
        imageUrl: 'https://imgs.qunarzz.com/sight/p0/1803/12/126471e0966aca5ba3.img.jpg_200x200_f1286016.jpg',
        title: '北京国际鲜花港',
        desc: '北京国际鲜花港北京国际鲜花港北京国际鲜花港北京国际鲜花港'
      }]
    }
  }
}
</script>

<style lang="stylus" scoped>
@import '~styles/mixins.styl'
  .title
    margin-top :.2rem
    line-height :.8rem
    background :#eee
    text-text-indent :.2rem
  .item
    overflow :hidden
    display :flex
    height :1.9rem
    .item-img
      width :1.7rem
      height :1.7rem
      padding :.1rem
    .item-info
      flex :1
      padding :.1rem
      min-width :0
      .item-title
        line-height :.54rem
        font-size .32rem
        ellipsis ()
      .item-desc
       line-height :.4rem
       color :#ccc
       ellipsis ()
      .item-button
        line-height :.44rem
        margin-top :.16rem
        background :#ff9300
        padding :0 .21rem
        border-bottom :.06rem
        color :#fff
</style>
