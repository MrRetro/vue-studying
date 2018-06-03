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
子组件通过model设置回调事件，然后监听自己组件变量的变化向model的事件进行通知
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

#### 方式三-- 方式三'其实就是'方式一的默认不设置model方法
父组件通过v-model传入值
```js
<template>
    <div>
        <btnBox3
            v-model="form.btn3"
        />
        {{ form.btn3 }}
    </div>
</template>

<script>
import btnBox3 from './btnBox3';
export default {
    name: 'index',
    components: {
        btnBox3
    },
    data() {
        return {
           form:{
               btn3: ''
           }
        }
    }
};
</script>
```
子组件通过设置props的value值，监听自己组件变量的变化input回调事件发通知
```js
<template>
    <div style="border: 1px solid">
        <input type="text" v-model="currentValue">
    </div>
</template>

<script>
    export default {
        name: 'btnBox3',
        props: {
            // 接收一个由父级组件传递过来的值 注意:这种方式一定是value
            value: {
                type: String,
                default() {
                    return '';
                }
            }
        },
        computed: {
            currentValue: {
                // 动态计算currentValue的值
                get() {
                    return this.value; // 将props中的value赋值给currentValue
                },
                set(val) {
                    this.$emit('input', val); // 通过$emit触发父组件 注意:这种方式一定是input通知事件
                }
            }
        }
    };
</script>
```