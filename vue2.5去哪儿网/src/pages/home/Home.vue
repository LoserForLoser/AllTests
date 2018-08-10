<template>
    <div class="userView">
        <!-- <home-header></home-header>
        <home-icons></home-icons>
        <home-recommend></home-recommend> -->

        <my-navigation></my-navigation>
        <user-message></user-message>
        <user-property></user-property>
        <contact-us></contact-us>
    </div>
</template>

<script>
import HomeHeader from './components/Header'
import HomeIcons from './components/Icons'
import HomeRecommend from './components/Recommend'

import MyNavigation from './components/Navigation'
import UserMessage from './components/User'
import UserProperty from './components/Property'
import ContactUs from './components/Contact'

export default {
  name: 'Home',
  components: {
    HomeHeader,
    HomeIcons,
    HomeRecommend,
    MyNavigation,
    UserMessage,
    UserProperty,
    ContactUs
  }
}
</script>

<style>
  #userView {
    background: lightgray
  }
</style>
