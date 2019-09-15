<template>
  <div class="buscador">
    <section class="section">
      <div class="container">
        <div class="field">
          <div class="control">
            <label>Tipo</label>
            <select v-model="category" class="input">
              <option value="" class="input">---Selecione---</option>
              <option value="brasileira" class="input">Brasileira</option>
              <option value="lanche" class="input">Lanche</option>
            </select>
            <br />
            <br />
            <label>Quanto quer pagar?</label>
            <input type="text" name="price" v-model="price" class="input">
            <br />
            <br />
            <label>Uma dica?</label>
            <input type="text" name="q" v-model="q" class="input">
            <br />
            <br />
            <button v-on:click="search" class="button is-primary is-fullwidth">buscar</button>
          </div>
        </div>
      </div>
    </section>


    <div class="box" v-for="item in this.items">
      <article class="media">
        <div class="media-left">
          <figure class="image is-64x64">
            <img :src="item.image" alt="Image">
          </figure>
        </div>
        <div class="media-content">
          <div class="content">
            <p>
              <strong>{{ item.name }}</strong>
              <br/>
              <strong>Tipo: {{ item.category }}</strong>
              <br/>
              <strong>Restaurante: {{ item.restaurant }}</strong>
              <br/>
              <strong>Preço: {{ formatPrice(item.price) }}</strong>
              <br/>
              <span>{{ item.description }}</span>
              <br/>
              <span>{{ item.variationDescription }}</span>
            </p>
          </div>
        </div>
      </article>
    </div>
    <br />
  </div>
</template>

<script>
import axios from 'axios';
export default {
  name: 'Buscador',
  data() {
    return {
      termo: '',
      q:'',
      price:'',
      category: '',
      items: ''
    }
  },
  computed: {
  },
  methods: {
    search() {
      axios.get(this.url()).then(response => (this.items = response.data))
    },
    url() {
      let url = 'http://172.26.0.12/api/search/meal';
      let params = '?';
      if (this.q) {
        params = params + 'q=' + this.q + '&';
      }
      if (this.category) {
        params = params + 'category=' + this.category + '&';
      }
      if (this.price) {
        params = params + 'price=' + this.price;
      }
      return url + params;
    },
    formatPrice(value) {
      let val = (value/1).toFixed(2).replace('.', ',')
      return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".")
    }
  }

}
</script>

<style scoped>

</style>
