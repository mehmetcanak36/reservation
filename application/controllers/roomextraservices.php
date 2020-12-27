<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Roomextraservices extends CI_Controller
{

	public function __construct()
	{
		parent::__construct();

		$this->load->model("roomextraservices_model");
	}

	public function index()
	{

		$viewData = new stdClass();
		$viewData->rows = $this->roomextraservices_model->get_all(array(),"rank ASC");

		$this->load->view('roomextraservices', $viewData);
	}

	public function newPage(){

		$this->load->view("new_roomextraservices");
	}

	public function editPage($id){

		$viewData = new stdClass();

		$viewData->row = $this->roomextraservices_model->get(array("id" => $id));

		$this->load->view("edit_roomextraservices", $viewData);


	}

	public function add(){

		$data = array(
			"title" 	=> $this->input->post("title"),
			"isActive"	=> 0
		);

		$insert = $this->roomextraservices_model->add($data);

		if($insert){

			redirect(base_url("roomextraservices"));
		}else{
			redirect(base_url("roomextraservices/newPage"));
		}
	}

	public function edit($id){

		$data = array(
			"title" => $this->input->post("title")
		);

		$update = $this->roomextraservices_model->update(
			array("id"	=> $id),
			$data
		);

		if($update){
			redirect(base_url("roomextraservices"));
		}else{
			redirect(base_url("roomextraservices/editPage/$id"));
		}
	}


	public function isActiveSetter(){

		$id 	  = $this->input->post("id");
		$isActive = ($this->input->post("isActive") == "true") ? 1 : 0;

		$update = $this->roomextraservices_model->update(
			array("id" => $id),
			array("isActive" => $isActive)
		);

	}

	public function delete($id){

		$delete = $this->roomextraservices_model->delete(array("id" => $id));

		redirect(base_url("roomextraservices"));

	}

	public function rankUpdate(){

		parse_str($this->input->post("data"), $data);

		$items = $data["sortId"];

		foreach($items as $rank => $id){

			$this->roomextraservices_model->update(
				array(
					"id"      => $id,
					"rank !=" => $rank
				),
				array("rank" => $rank)
			);

		}

	}

}
