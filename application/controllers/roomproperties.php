<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class roomproperties extends CI_Controller
{
    public function __construct()
	{
		parent::__construct();

		$this->load->model("roomproperties_model");
	}

	public function index()
	{

		$viewData = new stdClass();
		$viewData->rows = $this->roomproperties_model->get_all(array(),"rank ASC");

		$this->load->view('roomproperties', $viewData);
	}

}