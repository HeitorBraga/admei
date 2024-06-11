//= require jquery
//= require rails-ujs
//= require activestorage
//= require masks
//= require cocoon
//= require sortable
//= require jquery-sortable

document.addEventListener("turbo:load", () => {
  $('select[data-searchable="true"]').selectize()
})

document.addEventListener("turbo:before-visit", () => {
  $("#main-search").val("")
})
