<?php 


function get_room_category(){
    
    $t = &get_instance();

    $t->load->model("roomcategory_model");

    $getRoom = $t->roomcategory_model->get_all();
    return $getRoom;
  

}
function get_room_properties($where = array()){
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

function get_room_category_name($id){
    $t = &get_instance();
    $t->load->model("roomcategory_model");
    $category=$t ->roomcategory_model->get(
        array(
            "id" => $id
        )
    );
    if(empty($category)){
        return "<b style='color:red'>Tanımlı Değil</b>";
    }else{
        return $category->title;

    }
    


    
}
 function get_category($where=array()){

    $row = $this->db->where($where)->get($this->room_category)->row();

    return $row;

}


?>
