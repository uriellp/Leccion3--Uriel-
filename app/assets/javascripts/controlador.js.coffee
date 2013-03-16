# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


#Carga las etiquetas
fillTheItems = ->
  itemList = []
  i = 0
  #Con esto determinamos cuantas imagenes se mostraran de cada tipo de dato
  while i < 3
    itemList.push "cad" + i 
    itemList.push "ent" + i
    itemList.push "car" + i
    itemList.push "float" + i
    
    i++
  #Aqui determinamos cuantos tipos de datos seran 
  itemList.sort (a, b,c,d) ->
    Math.round Math.random()

  
  #//////////////////////////////////////////////////////////
  items = $(".ejercicio #items") #Con esto podemos determinar en que parte apareceran los items o imagenes
  for item of itemList
    itemId = itemList[item]
    itemType = itemId.substring(0, itemId.length - 1)
    
    #Con esta etiquetas de html determinamos los datos de cada imagen 
    html = "<img id='" + itemId + "' draggable='true' class='item' alt='" + itemType + "' src='/assets/" + itemId + ".png' />"
    items.append html
handImage = new Image()
$(document).ready ->      #Cuando la pagina inicia 
  $("#Siguiente").hide()  #Se oculta el boton siguiente 
  alert "INSTRUCCIONES: Elige el dato que le corresponda a cada uno de los cuadros " #manda un mensaje con las instrucciones
  $puntos = 0 #variable que obtendra los puntos
  $contador = 0 # variable contador que hara que determina las veces arrastradas las imagenes
  fillTheItems()   #Se dibujan las 
  $(".ejercicio #items .item").bind "dragstart", (event) ->
    event.originalEvent.dataTransfer.effectAllowed = "move"
    event.originalEvent.dataTransfer.setData "text/plain", event.target.getAttribute("id")
    $(event.target).addClass "itemSelected"
    #eventos de arrastre de las imagenes
  $(".ejercicio #items .item").bind "drag", (event) -> 

  $(".ejercicio #items .item").bind "dragend", (event) ->
    $(event.target).removeClass "itemSelected"
    
  $(".ejercicio #boxes .box").bind "dragenter", (event) ->
    $(event.target).addClass "itemOnDropArea"
    false
#evento de cuando se suelta la imagen arrastrada
  $(".ejercicio #boxes .box").bind "dragleave", (event) ->
    $(event.target).removeClass "itemOnDropArea"
    false

  $(".ejercicio #boxes .box").bind "dragover", (event) ->
    event.originalEvent.dataTransfer.dropEffect = "move"
    false
    #Evento que determina que tipo de imagen fue arrastrada
  $(".ejercicio #boxes .box").bind "drop", (event) ->
    itemId = event.originalEvent.dataTransfer.getData("text/plain")
    itemType = $("#" + itemId).attr("alt")                         #Obtenemos dato alt de la imagen
    dropboxType = $(event.target).attr("id")                       #Obtenemos el ID de la imagen
   
   #Para determinar si la imagen arrastrada es correcta se realiza de la siguiente forma
    if dropboxType is "Caracter" #si dropboxtype es caracter 
      $contador = $contador + 1  #contador se suma
      if itemType is "car"       #itemptype es Car 
        $("#" + itemId).remove() #La etiqueta arrastrada se elimina
        $puntos = $puntos + 1    #Se suma 1 a los puntos
        alert "CORRECTO"         #Muestra un mensaje de que es correcto
      else                       #Si no es correcto el droptype de la imagen
        $("#" + itemId).remove() #La imagen o etiqueta arrastrada se elimna
        alert "INCORRECTO"       #Manda un mensaje que es incorrecto
        
        
    # Mismo codigo que el anterior solo que ahora para entero
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
        
     if dropboxType is "Flotante"
      $contador = $contador + 1
      if itemType is "float"
        $puntos = $puntos + 1
        alert "CORRECTO"
        $("#" + itemId).remove()
      else
        $("#" + itemId).remove()
        alert "INCORRECTO"
        
    #Determinamos si son los 12 imagenes que manda un mensaje con los puntos obtenidos
    $(event.target).removeClass "itemOnDropArea" # Evento para determinar los items removidos o eliminados
    if $contador is 12                           #Si son 12 items o imagenes eliminadas
      alert "Los puntos son:" + $puntos          #manda un mensaje con los puntos 
      $("#Siguiente").show "slow"                #Y automaticamente se muestra el boton de siguiente para ir al prox ejercicio
    false
    
    
