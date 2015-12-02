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
//SHOW ADD FORMS
function showAddUserForm() {
    $(".addUserForm").show("fast");
}
//HIDE ADD FORMS
function hideAddUserForm() {
    $(".addUserForm").hide("fast");
}

//SHOW EDIT USER DROPDOWN
function showEditUser() {
    $(".editUser").show("fast");
}

// HIDE EDIT USER DROPDOWN
function hideEditUser() {
    $(".editUser").hide("fast");
}
