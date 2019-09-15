<template>
  <div id="app">
    <div class="container is-fluid ">
      <nav class="navbar is-light is-danger" role="navigation" aria-label="main navigation">
        <div class="navbar-brand">
          <figure class="image is-64x64">
            <img src="@/assets/logo.jpeg">
          </figure>
          <h2 class="title has-text-light">Easy Food</h2>
          <a role="button" class="navbar-burger" aria-label="menu" aria-expanded="false" @click="isOpen = !isOpen" v-bind:class="{'is-active': isOpen}">
            <span aria-hidden="true"></span>
            <span aria-hidden="true"></span>
            <span aria-hidden="true"></span>
          </a>
        </div>
        <div class="navbar-menu" v-bind:class="{'is-active': isOpen}">
          <div class="navbar-end">
            <router-link to="/" class="navbar-item is-tab">Home</router-link>
            <router-link to="/about" class="navbar-item is-tab">About</router-link>
            <router-link to="/else" class="navbar-item is-tab">Something Else</router-link>
          </div>
        </div>
      </nav>

      <Buscador/>
      <div class="notification is-danger">
        &copy; Easy Food - 2019
      </div>
    </div>

  </div>
</template>

<script>
import Buscador from './components/Buscador.vue'
import './../node_modules/bulma/css/bulma.css';

export default {
  name: 'app',
  components: {
    Buscador
  },
  data: function() {
    return {
      isOpen: false
    }
  }
}
</script>

<style>
#app {
  text-align: center;
}
#app h2 {text-align: center; padding-top: 14px; padding-left: 20px; margin-bottom: 0;}
</style>
