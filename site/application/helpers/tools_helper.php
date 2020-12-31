<?php

function get_month($date){
    return date("d", strtotime($date)) . " " . get_month_from_eng(date("M", strtotime($date))) . " " . get_day_from_eng(date("D", strtotime($date)));
}

function get_class_name($str){

    $str = strtolower($str);

    $tr   = array("ş", "ü", "ğ", "ç", "i", "ı", "ö", ".", ",", "?", " ");
    $eng  = array("s", "u", "g", "c", "i", "i", "o", "",  "",  "",  "_");

    $class = str_replace($tr, $eng, $str);

    return $class;
}

function get_room_category()
{

    $CI = &get_instance();
    $CI->load->model("roomcategory_model");
    return $CI->roomcategory_model->get_all();
}

function get_room_properties()
{

    $CI = &get_instance();
    $CI->load->model("roomproperties_model");
    return $CI->roomproperties_model->get_all();
}

function get_room_extra_services($where = array())
{

    $CI = &get_instance();
    $CI->load->model("roomextraservices_model");
    return $CI->roomextraservices_model->get_all($where);
}

function get_day_from_eng($day){

    $days = array(
        "Mon"   => "Pzt",
        "Tue"   => "Sal",
        "Wed"   => "Çar",
        "Thu"   => "Per",
        "Fri"   => "Cum",
        "Sat"   => "Cmt",
        "Sun"   => "Paz",
    );

    return $days[$day];
}

function get_month_from_eng($month){

    $months = array(
        "Jan"   => "Oca",
        "Feb"   => "Şub",
        "Mar"   => "Mar",
        "Apr"   => "Nis",
        "May"   => "May",
        "Jun"   => "Haz",
        "Jul"   => "Tem",
        "Aug"   => "Ağu",
        "Sep"   => "Eyl",
        "Oct"   => "Eki",
        "Nov"   => "Kas",
        "Dec"   => "Ara",
    );

    return $months[$month];
}

function get_folder_list($dir)
{

    $folder = array();
    if (is_dir($dir)) {
        $objects = scandir($dir);
        foreach ($objects as $object) {
            if ($object != "." && $object != "..") {
                if (filetype($dir . "/" . $object) == "dir")
                    array_push($folder, $object);
            }
        }
    }
    return $folder;
}

function get_images($dir = "")
{

    $imageList = array();

    if ($handle = opendir($dir)) {
        while (false !== ($entry = readdir($handle))) {
            if ($entry != "." && $entry != "..") {

                $en1 = @explode("_", $entry);
                $en2 = @explode(".", $en1[1]);

                if (substr($entry, 0, 1) != "." && ($en2[0] != 'thumb')) {
                    array_push($imageList, $entry);
                }
            }
        }
        closedir($handle);
    }

    return $imageList;
}

function get_prices($where=array())
{
    $CI = &get_instance();
    $CI->load->model("roompricing_model");
    $times = $CI->roompricing_model->get_all($where);
    $price = "null";
    foreach($times as $time){
        if($times){
            $price = $time->price;
    }
    }
    return $price;

}


?>