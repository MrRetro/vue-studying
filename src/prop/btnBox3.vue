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
