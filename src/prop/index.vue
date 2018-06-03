<template>
    <div>
        <btnBox1
            v-model="form.btn1"
        />
        {{ form.btn1 }}
        <btnBox2
            :text.sync="form.btn2"
        />
        {{ form.btn2 }}
        <btnBox3
            v-model="form.btn3"
        />
        {{ form.btn3 }}
    </div>
</template>

<script>
import btnBox1 from './btnBox1';
import btnBox2 from './btnBox2';
import btnBox3 from './btnBox3';

export default {
    name: 'index',
    components: {
        btnBox1,
        btnBox2,
        btnBox3
    },
    data() {
        return {
           form:{
               btn1: '',
               btn2: '',
               btn3: ''
           }
        }
    }
};
</script>
