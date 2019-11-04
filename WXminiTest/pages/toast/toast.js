// pages/toast/toast.js
Page({

  /**
   * 页面的初始数据
   */
  data: {

  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {

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

  },

  taqpShowToast() {
    wx.showToast({
      title: '提示框',
      icon: 'loading',
      image: '',
      duration: 3000 // 时间/毫秒
    })
  },

  taqpShowModal() {
    wx.showModal({
      title: '标题',
      content: '内容',
      // showCancel: false,
      cancelText: "算了不弄",
      cancelColor: 'red',
      confirmText: "不行必弄",
      success: function(res){
        console.log(res)
        if (res.confirm) {
          console.log("点击确定")
        }
        if (res.cancel) {
          console.log("点击取消")
        }
      }
    })
  },

  taqpShowLoading() {
    wx.showLoading({
      title: 'Loading',
      mask: true
    })

    setTimeout(() => {
      wx.hideLoading()
    }, 3000)
  },

  taqpShowActionSheet() {
    wx.showActionSheet({
      itemList: ['这个', '那个', '都可以'],
      itemColor: 'blue',
      success: function (res) {
        console.log(res)
        console.log(res.tapIndex)
      }
    })
  },

  onShareAppMessage: function (options) {
    console.log(options)
    return {
      title: '需要分享的标题',
      path: '/pages/toast/toast',
      imageUrl: ''// 图片地址：本地/网络，默认当前页截图
    }
  }
})