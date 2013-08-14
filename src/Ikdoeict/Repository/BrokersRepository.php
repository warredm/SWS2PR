<?php

namespace Ikdoeict\Repository;

class BrokersRepository extends \Knp\Repository {

	public function getTableName() {
		return 'brokers';
	}

        public function getBrokers() {
                return $this->db->fetchAll('SELECT * FROM brokers');
        }
        
	public function getBroker($id) {
		return $this->db->fetchAll('SELECT * FROM brokers WHERE brokers_id = ?', array($id));
	}

}