### vue的prop数据双向绑定

#### 方式一
父组件通过v-model传入值
```js
<template>
    <div>
        <btnBox1
            v-model="form.btn1"
        />
        {{ form.btn1 }}
    </div>
</template>

<script>
import btnBox1 from './btnBox1';
export default {
    name: 'index',
    components: {
        btnBox1
    },
    data() {
        return {
           form:{
               btn1: ''
           }
        }
    }
};
</script>
```
子组件通过prop配置监听父组件传进来的v-model
```js
<template>
    <div style="border:1px solid">
        <input type="text" v-model="msg1">
    </div>
</template>

<script>
export default {
  name: 'btnBox1',
  model: { //关键位置
    prop: 'msg',
    event: 'back'
  },
  props: {
    msg: { //关键位置
      type: String
    }
  },
  data() {
    return {
      msg1: this.msg
    };
  },
  watch: {
    msg1(vl) { //关键位置
      this.$emit('back', vl);
    }
  }

};
</script>
```

#### 方式二
父组件通过属性值.sync传入值
```js
<template>
    <div>
        <btnBox2
            :text.sync="form.btn2"
        />
        {{ form.btn2 }}
    </div>
</template>

<script>
import btnBox1 from './btnBox2';
export default {
    name: 'index',
    components: {
        btnBox2
    },
    data() {
        return {
           form:{
               btn2: ''
           }
        }
    }
};
</script>
```
子组件通过监听watch方法将自己组件的遍历想父组件发通知update:父组件传来的变量
```js
<template>
    <div style="border:1px solid">
        <input type="text" v-model="text2">
    </div>
</template>

<script>
export default {
  name: 'btnBox2',
  props: ['text'],
  data() {
    return {
      text2: this.text
    };
  },
  watch: {
    text2(vl) {
      this.$emit('update:text', vl);
    }
  }
};
</script>
```