/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
//CHECKBOXES
$(document).ready(function(){ 
    $("#selectAll").change(function(){
      $(".checkboxes").prop('checked', $(this).prop("checked"));
    });
});
