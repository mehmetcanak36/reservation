<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Room extends CI_Controller
{

	public function __construct()
	{
		parent::__construct();

		$this->load->model("room_model");
		$this->load->model("roomimage_model");
		$this->load->model("roomavailability_model");
		$this->load->model("roompricing_model");
		
	}

	public function index()
	{

		$viewData = new stdClass();
		$viewData->rows = $this->room_model->get_all(array(),"rank ASC");

		$this->load->view('room', $viewData);
	}

	public function newPage(){

		$this->load->view("new_room");
	}

	public function editPage($id){

		$viewData = new stdClass();

		$viewData->row = $this->room_model->get(array("id" => $id));

		$this->load->view("edit_room", $viewData);


	}

	public function add(){


		$room_properties     = implode(";",$this->input->post("room_properties"));
		$room_extra_services = implode(";",$this->input->post("room_extra_services"));

		$data = array(
			"room_code" 			=> $this->input->post("room_code"),
			"title" 				=> $this->input->post("title"),
			"detail" 				=> $this->input->post("detail"),
			"size" 					=> $this->input->post("size"),
			"default_price" 		=> $this->input->post("default_price"),
			"room_type_id" 			=> $this->input->post("room_type_id"),
			"room_capacity" 		=> $this->input->post("room_capacity"),
			"room_properties" 		=> $room_properties,
			"room_extra_services"	=> $room_extra_services,
			"isActive"				=> 0
		);

		$insert = $this->room_model->add($data);

		if($insert){

			redirect(base_url("room"));
		}else{
			redirect(base_url("room/newPage"));
		}
	}

	public function edit($id){
		$room_properties     = implode(";",$this->input->post("room_properties"));
		$room_extra_services = implode(";",$this->input->post("room_extra_services"));

		$data = array(
			"room_code" 			=> $this->input->post("room_code"),
			"title" 				=> $this->input->post("title"),
			"detail" 				=> $this->input->post("detail"),
			"size" 					=> $this->input->post("size"),
			"default_price" 		=> $this->input->post("default_price"),
			"room_type_id" 			=> $this->input->post("room_type_id"),
			"room_capacity" 		=> $this->input->post("room_capacity"),
			"room_properties" 		=> $room_properties,
			"room_extra_services"	=> $room_extra_services,
			"isActive"				=> 0
		);

		$update = $this->room_model->update(
			array("id"	=> $id),
			$data
		);
		if($update){
			redirect(base_url("room"));
		}else{
			redirect(base_url("room/editPage/$id"));
		}

		

		
	}

	public function isActiveSetter(){

		$id 	  = $this->input->post("id");
		$isActive = ($this->input->post("isActive") == "true") ? 1 : 0;

		$update = $this->room_model->update(
			array("id" => $id),
			array("isActive" => $isActive)
		);

	}

	public function isActiveSetterForImage(){

		$id 	  = $this->input->post("id");
		$isActive = ($this->input->post("isActive") == "true") ? 1 : 0;

		$update = $this->roomimage_model->update(
			array("id" => $id),
			array("isActive" => $isActive)
		);

	}

	public function delete($id){

		$delete = $this->room_model->delete(array("id" => $id));

		redirect(base_url("room"));

	}

	public function rankUpdate(){

		parse_str($this->input->post("data"), $data);

		$items = $data["sortId"];


		foreach($items as $rank => $id){

			$this->room_model->update(
				array(
					"id"      => $id,
					"rank !=" => $rank
				),
				array("rank" => $rank)
			);

		}


	}

	public function roomImageRankUpdate(){

		parse_str($this->input->post("data"), $data);

		$items = $data["sortId"];

		foreach($items as $rank => $id){

			$this->roomimage_model->update(
				array(
					"id"      => $id,
					"rank !=" => $rank
				),
				array("rank" => $rank)
			);

		}

	}

	public function imageUploadPage($room_id){

		$this->session->set_userdata("room_id", $room_id);

		$viewData = new stdClass();
		$viewData->rows = $this->roomimage_model->get_all(
			array(
				"room_id"	=> $room_id,
			),
			"rank ASC"
		);

		$this->load->view("room_image", $viewData);

	}

	public function upload_image(){
 
		$config['upload_path']          = 'uploads/';//dosyayı nereye aktarayım
		$config['allowed_types']        = '*'; //"jpg|gif|png"; böyle tanımlanıyor neyi kaydeğimiz
		$config['encrypt_name']			= true;

		$this->load->library('upload', $config);//upload burda kütüphaneninin ismi
												//bu sınıfa hangi klasore upload edecez
												//hangi dosya türlerine izin verecez
												//bunu için config arrari tanımlıyoruz bunu




		if ( ! $this->upload->do_upload('file'))
		{
			$error = array('error' => $this->upload->display_errors());

			print_r($error);
			print_r($this->upload->do_upload('file'));


		}
		else
		{
			print_r($this->upload->do_upload('file'));
			$data = array('upload_data' => $this->upload->data());
			$img_id = $data["upload_data"]['file_name'];

			$this->roomimage_model->add(array(
					"img_id"	=> $img_id,
					"room_id"	=> $this->session->userdata("room_id"),
					"isActive"	=> 1,
					"isCover"   =>1,
					"rank"		=> 1
				)

			);
			


		}

	}

	public function deleteImage($id){

		$image = $this->roomimage_model->get(array("id" => $id));

		$file_name = FCPATH ."uploads/$image->img_id";

		if(unlink($file_name)){

			$delete = $this->roomimage_model->delete(array("id"	=> $id));

			if($delete){

				redirect("room/imageUploadPage/$image->room_id");

			}
		}


	}



	public function newAvailabilityPage($room_id){



		$viewData =  new stdClass();
		$viewData->room_id = $room_id;

		$viewData->availabilities = $this->roomavailability_model->get_all(
			array(
				"room_id"	    => $room_id,
				"daily_date >=" => date("Y-m-d")
			),"daily_date ASC"
		);

		$this->load->view("new_roomavailability", $viewData);

	}


	public function addNewAvailability($room_id){


		$availability_date = explode("-", $this->input->post("availability_date"));
		$startDateArr  = explode("/", $availability_date[0]);
		$finishDateArr = explode("/",$availability_date[1]);

		$startDateStr  = trim($startDateArr[2]) . "-" . trim($startDateArr[0]) . "-" . trim($startDateArr[1]);
		$finishDateStr = trim($finishDateArr[2]) . "-" . trim($finishDateArr[0]) . "-" . trim($finishDateArr[1]);

		$startDate  = new DateTime($startDateStr);
		$finishDate = new DateTime(date("Y-m-d", strtotime("1 day" ,strtotime($finishDateStr))));

		$interval = DateInterval::createFromDateString("1 day");

		$period = new DatePeriod($startDate, $interval, $finishDate);

		foreach ($period as $date){


			$record_test = $this->roomavailability_model->get(
				array(
					"room_id"	    => $room_id,
					"daily_date"	=> $date->format("Y-m-d")
				)
			);

			if(empty($record_test)) {

				$this->roomavailability_model->add(
					array(
						"daily_date" => $date->format("Y-m-d"),
						"room_id" => $room_id,
						"status" => 1
					)
				);
			}

		}

		redirect(base_url("room/newAvailabilityPage/$room_id"));



	}

	
    public function newPricingPage($room_id){


        $viewData =  new stdClass();
        $viewData->room_id = $room_id;

        $viewData->prices = $this->roompricing_model->get_all(
            array(
                "room_id"	    => $room_id,
                "date >=" => date("Y-m-d")
            ),"date ASC"
        );


        $this->load->view("new_roompricing", $viewData);

    }

    public function addNewPricing($room_id){

        //08/10/2016 - 08/25/2016

        // 2016-08-10
        $price = $this->input->post("price");
        if($price == " "){
            redirect(base_url("room/newPricingPage/$room_id"));
        }

        $pricing_date = explode("-", $this->input->post("pricing_date"));
        $startDateArr  = explode("/", $pricing_date[0]);
        $finishDateArr = explode("/",$pricing_date[1]);

        $startDateStr  = trim($startDateArr[2]) . "-" . trim($startDateArr[0]) . "-" . trim($startDateArr[1]);
        $finishDateStr = trim($finishDateArr[2]) . "-" . trim($finishDateArr[0]) . "-" . trim($finishDateArr[1]);

        if($startDateStr < date("Y-m-d")){
            redirect(base_url("room/newPricingPage/$room_id"));
        }
        $startDate  = new DateTime($startDateStr);
        $finishDate = new DateTime(date("Y-m-d", strtotime("1 day" ,strtotime($finishDateStr))));

        $interval = DateInterval::createFromDateString("1 day");

        $period = new DatePeriod($startDate, $interval, $finishDate);
            foreach ($period as $date) {

            $record_test = $this->roompricing_model->get(
                array(
                    "room_id"	    => $room_id,
                    "date"	        => $date->format("Y-m-d"),
                )
            );


            if(empty($record_test)) {

                $this->roompricing_model->add(
                    array(
                        "date"          => $date->format("Y-m-d"),
                        "room_id"       => $room_id,
                        "price"         => $price,
                        )
                    );
                }else{
                    $this->roompricing_model->update(
                        array(
                            "date"      => $date->format("Y-m-d"),
                            "room_id"   => $room_id
                        ),
                        array(
                            "price"     => $price
                        )

                    );

            }
            }

        redirect(base_url("room/newPricingPage/$room_id"));



    }

    public function roomPricingDelete($id){

        $room_id = $this->roompricing_model->get(array("id" => $id));
        $room_id = $room_id->room_id;

        $delete = $this->roompricing_model->delete(array("id" => $id));

        redirect(base_url("room/newPricingPage/$room_id"));

    }

    public function getPrices($room_id){
        //08/10/2016 - 08/25/2016

        // 2016-08-10

        $pricing_date = explode("-", $this->input->post("pricing_date"));
        $startDateArr  = explode("/", $pricing_date[0]);
        $finishDateArr = explode("/",$pricing_date[1]);

        $startDateStr  = trim($startDateArr[2]) . "-" . trim($startDateArr[0]) . "-" . trim($startDateArr[1]);
        $finishDateStr = trim($finishDateArr[2]) . "-" . trim($finishDateArr[0]) . "-" . trim($finishDateArr[1]);


        $startDate  = new DateTime($startDateStr);
        $finishDate = new DateTime(date("Y-m-d", strtotime("1 day" ,strtotime($finishDateStr))));

        $interval = DateInterval::createFromDateString("1 day");

        $period = new DatePeriod($startDate, $interval, $finishDate);

        $day_price = array();

        $default_price = $this->room_model->get(
            array(
                "id" => $room_id
            )
        );
        foreach ($period as $date){
        $record_test = $this->roompricing_model->get(
            array(
                "room_id"	    => $room_id,
                "date"          => $date->format("Y-m-d")
//                "date >="	    => $startDateStr,
//                "date <="	    => $finishDateStr,
            )
        );
            if($record_test){
                array_push($day_price,$date->format("d-m-Y"),$record_test->price);
            }else{
                array_push($day_price,$date->format("d-m-Y"),$default_price->default_price);
            }

        }
        $viewData = new stdClass();
        $viewData->prices = $day_price;
        $viewData->row_count = count($day_price);
        $this->load->view("pricepage",$viewData);

    }

    public function getPricePage($room_id){

        $viewData = new stdClass();
        $viewData->room_id = $room_id;


        $this->load->view("price",$viewData);


    }

}

