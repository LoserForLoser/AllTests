import request from '../../service/network.js'

Page({

  /**
   * 页面的初始数据
   */
  data: {
    name: 'coderwhy',
    age:28,
    students:[
      { id: 1, name: 'q', age:11 }, 
      { id: 2, name: 'w', age:22 }, 
      { id: 3, name: 'e', age:33 }
      ],
    count:0,
    number:0,
    navigationValue: '传值页面传递修改前'
  },

  onLoad: function(options) {
    // 发送请求
    // 原生
    // this.get_request(),

    // 封装
    request({
      url: 'http://httpbin.org/post',
      method: 'post',
      data: {
        type: 'sell',
        page: 1
      }
    }).then(res => {
      console.log(res)
    }).catch(err => {
      console.log(err)
    })
  },

  addone()  {
    this.setData({
      number:this.data.number+1
    })
  },

  touchButton() {
    console.log("已点击")
  },

  btnClick() {
    this.setData({
      count:this.data.count + 1
    })
  },

  btnSub() {
    this.setData({
      count: this.data.count - 1
    })
  },

  getUser(event) {
    console.log(event)
  },

  changeCounter() {
    // 获取组件对象
    const my_sel = this.selectComponent('.sel-class') // 内部可传 class/id
    console.log(my_sel)
    // 通过setData修改数据(不推荐)
    // my_sel.setData({
    //   counter: my_sel.data.counter + 1
    // })

    // 通过方法修改
    my_sel.incrementCounter(5)
  },
  
  get_request() {
    wx.request({
      url: 'http://123.207.32.32:8000/recommend',
      success: function(res) {
        console.log(res)
      }
    }),
    
    wx.request({
      url: 'http://123.207.32.32:8000/home/data',
      method:'get',
      data: {
        type:'sell',
        page:1 
      },
      success: function(res) {
        console.log(res)
      }
    }),
    
    wx.request({
      url: 'http://httpbin.org/post',
      method:'post',
      data: {
        type:'sell',
        page:1 
      },
      success: function(res) {
        console.log(res)
      },
      fail: function(err) {
        console.log(err)
      }
    })
  },

  codeNavigateToPushDetail() {
    wx.navigateTo({
      url: '/pages/detail/detail?message=代码跳转传递参数',
    })
  },

  codeRedirectPushDetail() {
    wx.redirectTo({
      url: '/pages/detail/detail',
    })
  },

  codeSwitchTabPushDetail() {
    wx.switchTab({
      url: '/pages/index/about/about',
    })
  },

  codeReLaunchPushDetail() {
    wx.reLaunch({
      url: '/pages/detail/detail',
    })
  }
})