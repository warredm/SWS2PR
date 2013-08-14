<?php

namespace Ikdoeict\Repository;

class PropertiesRepository extends \Knp\Repository {

	public function getTableName() {
		return 'properties';
	}

	public function getAll() {
		return $this->db->fetchAll('SELECT * FROM properties');
	}

	public function getRent() {
		return $this->db->fetchAll('SELECT * FROM properties WHERE buyRent = "rent"');
	}

	public function getBuy() {
		return $this->db->fetchAll('SELECT * FROM properties WHERE buyRent = "buy"');
	}
        
        public function getDetail($id) {
                return $this->db->fetchAssoc('SELECT * FROM properties WHERE properties_id = ?', array($id));
        }
        
        public function getBrokerProperties($id) {
                return $this->db->fetchAll('SELECT * FROM properties WHERE brokers_id = ?', array($id));
        }
        
        public function get4MostRecentProperties() {
                return $this->db->fetchAll('SELECT * FROM properties ORDER BY date DESC LIMIT 4');
        }
        
        public function filter($type, $maxprijs, $buyrent) {
                //return $this->db->fetchAll('SELECT * FROM properties WHERE type = "?" AND buyRent = "?" AND price BETWEEN 0 AND ?', array($type, $buyrent, $maxprijs));
                return $this->db->fetchAll('SELECT * FROM properties WHERE buyRent = ? AND type = ?', array($buyrent, $type));
        }

}