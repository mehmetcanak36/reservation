<?php 


function get_room_category(){
    
    $t = &get_instance();

    $t->load->model("roomcategory_model");

    $getRoom = $t->roomcategory_model->get_all();
    return $getRoom;
  

}
function get_room_properties(){
    $t = &get_instance();

    $t->load->model("roomproperties_model");

    $getProperties = $t->roomproperties_model->get_all();
    return $getProperties;

}
function get_room_extra_services($where = array())
{

    $t = &get_instance();
    $t->load->model("roomextraservices_model");
    return $t->roomextraservices_model->get_all($where);
}


?>
