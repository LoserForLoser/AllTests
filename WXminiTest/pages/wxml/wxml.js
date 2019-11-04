// pages/wxml/wxml.js
Page({

  /**
   * 页面的初始数据
   */
  data: {
    title:"hellow world",
    firsts:"china",
    last:"南波万",
    age:28,
    timeNow:new Date().toLocaleString(),
    isChangeCSS:false,
    isShow: false,
    score:0,
    viewHidden:false,
    moives: ["111", "222", "333", "444", "555"],
    numbers: [["111", "222", "333", "444", "555"],
              ["111", "222", "333", "444", "555"],
              ["111", "222", "333", "444", "555"]],
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    setInterval(() => {
      this.setData({
        timeNow: new Date().toLocaleString(),
      })
    }, 1000)
  },

  switchCSS() {
    this.setData({
      isChangeCSS: !this.data.isChangeCSS,
    })
  },

  showView() {
    this.setData({
      isShow: !this.data.isShow,
    })
  },

  hiddenView() {
    this.setData({
      viewHidden: !this.data.viewHidden,
    })
  },

  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function () {

  },

  /**
   * 生命周期函数--监听页面显示
   */
  onShow: function () {

  },

  /**
   * 生命周期函数--监听页面隐藏
   */
  onHide: function () {

  },

  /**
   * 生命周期函数--监听页面卸载
   */
  onUnload: function () {

  },

  /**
   * 页面相关事件处理函数--监听用户下拉动作
   */
  onPullDownRefresh: function () {

  },

  /**
   * 页面上拉触底事件的处理函数
   */
  onReachBottom: function () {

  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function () {

  }
})