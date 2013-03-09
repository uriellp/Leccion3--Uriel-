# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


#Carga las etiquetas

###
Draggable events *
###

###
Un elemento está siendo arrastrado. *
###

###
Un elemento termina de arrastrarse. *
###

###
Eventos Drop *
###

###
Un elemento comienza a ser arrastrado sobre una área válida. *
###

###
Un elemento deja de ser arrastrado. *
###

###
Dragover. *
###

###
Drop. *
###

#$( "#dialog" ).dialog( "open" );

#alert($puntos);

#$( "#dialog2" ).dialog( "open" );

#$( "#dialog" ).dialog( "open" );

#alert($puntos);

#$( "#dialog2" ).dialog( "open" );

#$("#validar").show("slow");
#$("#tarea").show("slow");
#$( "#validar" ).click(function() {
#alert("PUNTOS: "+ $puntos);
#});
#$( "#tarea" ).click(function() {
#   alert("Elige los datos que correspondan en los cuadros");
#});

###
Función para cargar las etiquetas. *
###
fillTheItems = ->
  itemList = []
  i = 0

  while i < 3
    itemList.push "cad" + i
    itemList.push "ent" + i
    itemList.push "car" + i
    itemList.push "float" + i
    
    i++
  itemList.sort (a, b,c,d) ->
    Math.round Math.random()

  
  #//////////////////////////////////////////////////////////
  items = $(".ejercicio #items")
  for item of itemList
    itemId = itemList[item]
    itemType = itemId.substring(0, itemId.length - 1)
    
    # Creates the draggable item HTML tag.
    html = "<img id='" + itemId + "' draggable='true' class='item' alt='" + itemType + "' src='/assets/" + itemId + ".png' />"
    items.append html
handImage = new Image()
handImage.src = "assets/hand.png"
$(document).ready ->
  $("#validar").hide()
  $("#tarea").hide()
  $("#Siguiente").hide()
  alert "INSTRUCCIONES: Elige el dato que le corresponda a cada uno de los cuadros "
  $puntos = 0
  $contador = 0
  fillTheItems()
  $(".ejercicio #items .item").bind "dragstart", (event) ->
    event.originalEvent.dataTransfer.effectAllowed = "move"
    event.originalEvent.dataTransfer.setData "text/plain", event.target.getAttribute("id")
    $(event.target).addClass "itemSelected"

  $(".ejercicio #items .item").bind "drag", (event) ->

  $(".ejercicio #items .item").bind "dragend", (event) ->
    $(event.target).removeClass "itemSelected"

  $(".ejercicio #boxes .box").bind "dragenter", (event) ->
    $(event.target).addClass "itemOnDropArea"
    false

  $(".ejercicio #boxes .box").bind "dragleave", (event) ->
    $(event.target).removeClass "itemOnDropArea"
    false

  $(".ejercicio #boxes .box").bind "dragover", (event) ->
    event.originalEvent.dataTransfer.dropEffect = "move"
    false

  $(".ejercicio #boxes .box").bind "drop", (event) ->
    itemId = event.originalEvent.dataTransfer.getData("text/plain")
    itemType = $("#" + itemId).attr("alt")
    dropboxType = $(event.target).attr("id")
   
   
    if dropboxType is "Caracter"
      $contador = $contador + 1
      if itemType is "car"
        $("#" + itemId).remove()
        $puntos = $puntos + 1
        alert "CORRECTO"
      else
        $("#" + itemId).remove()
        alert "INCORRECTO"
        
        
    
    if dropboxType is "Entero"
      $contador = $contador + 1
      if itemType is "ent"
        $("#" + itemId).remove()
        $puntos = $puntos + 1
        alert "CORRECTO"
      else
        $("#" + itemId).remove()
        alert "INCORRECTO"

        
         
    if dropboxType is "Cadena"
      $contador = $contador + 1
      if itemType is "cad"
        $puntos = $puntos + 1
        alert "CORRECTO"
        $("#" + itemId).remove()
      else
        $("#" + itemId).remove()
        alert "INCORRECTO"
        
     
        
        
    $(event.target).removeClass "itemOnDropArea"
    if $contador is 12
      alert "Los puntos son:" + $puntos
      $("#Siguiente").show "slow"
    false
#Efecto para el cuadro de diálogo
$.fx.speeds._default = 1000
$ ->
  $("#dialog").dialog autoOpen: false


#show: "blind",
#hide: "explode"
$.fx.speeds._default = 1000
$ ->
  $("#dialog2").dialog autoOpen: false
  
  #show: "blind",
  #hide: "explode"
  $("#validar").mouseover ->
    $("audio")[0].play()

  $("#validar").click ->
    $("audio")[1].play()

  $("#tarea").mouseover ->
    $("audio")[0].play()

  $("#tarea").click ->
    $("audio")[1].play()

