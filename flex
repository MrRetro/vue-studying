<template>
    <div class="container">
        <div class="header">
          <p>左边</p>
          <p>标题</p>
          <p>右边</p>
        </div>
        <div class="content">
          <p>内容1</p>
          <p>内容</p>
          <p>内容</p>
          <p>内容</p>
          <p>内容</p>
          <p>内容</p>
          <p>内容</p>
          <p>内容</p>
          <p>内容</p>
          <p>内容2</p>
        </div>
        <div class="nav-box">
          <ul>
            <li>1</li>
            <li>2</li>
            <li>3</li>
            <li>4</li>
            <li>5</li>
          </ul>
        </div>
    </div>
</template>

<script>
export default {
  name: 'index',
  methods: {
    clickGo() {
      console.log(123);
      this.$navigation.once('back', (to, from) => {
        console.log(to, '<===', from);
      });
    }
  }
};
</script>

<style scoped>
.container{
  position: absolute;
  width: 100%;
  height: 100%;
  display: flex;
  flex: 1;
  flex-direction: column;
}
  .header{
    display: flex;
    flex-direction: row;
    justify-content: space-around;
    align-items: center;
    height: 42px;
    position:absolute;
    top: 0px;
    left: 0px;
    width: 100%;
    background-color: wheat;
  }
  .content{
    flex: 1;
    margin: 42px 0px 60px 0px;
    overflow-y: auto;
  }
  .nav-box ul{
    display: flex;
    justify-content: space-around;
    align-items: center;
    height: 60px;
  }
  .nav-box{
    flex-direction: row;
    justify-content: space-around;
    align-items: center;
    height: 60px;
    position:fixed;
    bottom: 0px;
    left: 0px;
    width: 100%;
    background-color: wheat;
  }
</style>
