<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Room extends CI_Controller
{

public function __construct()
	{
		parent::__construct();

		$this->load->model("room_model");
		
    }
    public function index()
	{

		$viewData = new stdClass();
		$viewData->rows = $this->room_model->get_all(array(),"rank ASC");

		$this->load->view('room', $viewData);
	}


    
}