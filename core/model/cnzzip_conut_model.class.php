<?php
/**
 * BY 魏磐 2014/2/26
 **/
defined('IN_PHPCMS') or exit('No permission resources.');
pc_base::load_sys_class('model', '', 0);
class cnzzip_conut_model extends model {
	public function __construct() {
		$this->db_config = pc_base::load_config('database');
		$this->db_setting = 'default';
		$this->table_name = 'cnzzip_conut';
		parent::__construct();
	}
}
?>
