<template>
    <div style="border:1px solid">
        <input type="text" v-model="msg1">
    </div>
</template>

<script>
export default {
  name: 'btnBox1',
  model: {
    prop: 'msg',
    event: 'back'
  },
  props: {
    msg: {
      type: String
    }
  },
  data() {
    return {
      msg1: this.msg
    };
  },
  watch: {
    msg1(vl) {
      this.$emit('back', vl);
    }
  }

};
</script>

<style scoped>

</style>
