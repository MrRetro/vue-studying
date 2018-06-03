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

<style scoped>

</style>
