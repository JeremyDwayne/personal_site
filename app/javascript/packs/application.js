// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application
// logic in a relevant structure within app/javascript and only use these pack
// files to reference that code so it'll be compiled.

import "channels"

import * as ActiveStorage from "@rails/activestorage"
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"

import {
  Chart,
  registerables
} from 'chart.js';
Chart.register(...registerables);

Rails.start()
Turbolinks.start()
ActiveStorage.start()

const Trix = require("trix")
require("@rails/actiontext")


import Sortable from 'sortablejs'
import "controllers"
import '../stylesheets/application'

document.addEventListener('turbolinks:load', () => {
  var ctx = document.getElementById('page-views');
  if (ctx) {
    var myChart = new Chart(ctx, {
      type: 'line',
      data: {
        labels: JSON.parse(ctx.dataset.labels),
        datasets: [{
          label: "Page Views",
          data: JSON.parse(ctx.dataset.data),
          borderWidth: 1
        }]
      },
    });
  }

  var ctx = document.getElementById('unique-page-views');
  if (ctx) {
    var myChart = new Chart(ctx, {
      type: 'line',
      data: {
        labels: JSON.parse(ctx.dataset.labels),
        datasets: [{
          label: "Unique Page Views",
          data: JSON.parse(ctx.dataset.data),
          borderWidth: 1
        }]
      },
    });
  }

  document.addEventListener('click', (event) => {
    let element = event.target.closest('.paragraph-content')
    if (!element) return

    element.classList.add('d-none')
    element.nextElementSibling.classList.remove('d-none')
  });

  document.addEventListener('click', (event) => {
    if (!event.target.matches('.cancel')) return

    event.preventDefault()

    let element = event.target.closest('.paragraph-form')
    element.classList.add('d-none')
    element.previousElementSibling.classList.remove('d-none')
  });

  let elements = document.getElementById('elements')
  Sortable.create(elements, {
    animation: 150
  });

})
