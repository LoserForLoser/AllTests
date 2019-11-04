// components/my-slots/my-slots.js
Component({
  /**
   * 组件的属性列表
   */
  properties: {
    // 使用者给组件传入数据
  },

  /**
   * 组件的初始数据
   */
  data: {

  },

  /**
   * 组件的方法列表
   */
  methods: {
    doSomthing() {
      
    }
  },

  options: {
    multipleSlots:true
  },

  /**
   * 引用外部样式
   */
  externalClasses: [""],

  /**
   * 监听 properties/data
   */
  observers: {
    counter: function(newVal) {

    }
  },

  /**
   * 组件所在页面生命周期
   */
  pageLifetimes: {
    show() {
      console.log("展示")
    },

    hide() {
      console.log("隐藏")
    },

    resize() {
      console.log("尺寸改变")
    }
  },

  /**
   * 组件本身生命周期
   */
  lifetimes: {
    created() {
      console.log("组件被创建")
    },
    attached() {
      console.log("组件被添加")
    },
    ready() {
      console.log("组件被渲染出来")
    },
    movied() {
      console.log("组件被移动到节点树另一个位置")
    },
    detached() {
      console.log("组件被移除")
    },
  }
})
