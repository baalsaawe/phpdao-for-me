<?php

/**
 * Class that operate on table '${table_name}'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: ${date}
 */
class ${dao_clazz_name}DAO implements ${idao_clazz_name}DAO {

	/**
	 * Get Domain object by primary key
	 *
	 * @param String $id - primary key
	 * @return ${domain_clazz_name}
	 */
	public function load($id) {
		$sql = 'SELECT * FROM ${table_name} WHERE ${pk} = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set${pk_number}($id);
		return $this->getRow($sqlQuery);
	}

	/**
	 * Get all records from table
	 *
	 * @return ${domain_clazz_name}[]
	 */
	public function queryAll() {
		$sql = 'SELECT * FROM ${table_name}';
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}

	/**
	 * Get all records from table ordered by field
	 *
	 * @param $orderColumn - column name
	 *
	 * @return ${domain_clazz_name}[]
	 */
	public function queryAllOrderBy($orderColumn) {
		$sql = 'SELECT * FROM ${table_name} ORDER BY ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($orderColumn);
		return $this->getList($sqlQuery);
	}

	/**
	 * Delete record from table
	 *
	 * @param ${var_name} - primary key
	 *
	 * @return int
	 */
	public function delete($${pk}){
		$sql = 'DELETE FROM ${table_name} WHERE ${pk} = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set${pk_number}($${pk});
		return $this->executeUpdate($sqlQuery);
	}

	/**
	 * Insert record to table, id is auto-incremented
	 *
	 * @param ${domain_clazz_name} ${var_name}
	 *
	 * @return String
	 */
	public function insert(${domain_clazz_name} $${var_name}) {
		$sql = 'INSERT INTO ${table_name} (${insert_fields}) VALUES (${question_marks})';
		$sqlQuery = new SqlQuery($sql);
		${parameter_setter}
		$id = $this->executeInsert($sqlQuery);
		$${var_name}->set${pk_php_c}($id);
		return $id;
	}

	/**
	 * Insert record to table with specified id
	 *
	 * @param ${domain_clazz_name} ${var_name}
	 *
	 * @return string
	 */
	public function insertWithId(${domain_clazz_name} $${var_name}) {
		$sql = 'INSERT INTO ${table_name} (${pk}, ${insert_fields}) VALUES (?, ${question_marks})';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($${var_name}->get${pk_php_c}());
		${parameter_setter}
		$id = $this->executeInsert($sqlQuery);
		return $id;
	}

	/**
	 * Update record in table
	 *
	 * @param ${domain_clazz_name} ${var_name}
	 *
	 * @return int
	 */
	public function update(${domain_clazz_name} $${var_name}){
		$sql = 'UPDATE ${table_name} SET ${update_fields} WHERE ${pk} = ?';
		$sqlQuery = new SqlQuery($sql);
		${parameter_setter}
		$sqlQuery->set${pk_number}($${var_name}->get${pk_php_c}());
		return $this->executeUpdate($sqlQuery);
	}

	/**
	 * Delete all rows
	 *
	 * @return int
	 */
	public function clean() {
		$sql = 'DELETE FROM ${table_name}';
		$sqlQuery = new SqlQuery($sql);
		return $this->executeUpdate($sqlQuery);
	}

${queryByFieldFunctions}
${deleteByFieldFunctions}

	/**
	 * Read row
	 *
	 * @return ${domain_clazz_name}
	 */
	protected function readRow($row) {
		$${var_name} = new ${domain_clazz_name}();
		${read_row}
		return $${var_name};
	}

	/**
	 * @param $sqlQuery
	 *
	 * @return ${domain_clazz_name}[]
	 */
	protected function getList($sqlQuery) {
		$tab = QueryExecutor::execute($sqlQuery);
		$ret = array();
		for ($i = 0; $i < count($tab); $i++) {
			$ret[$i] = $this->readRow($tab[$i]);
		}
		return $ret;
	}

	/**
	 * Get row
	 *
	 * @param $sqlQuery
	 * @return ${domain_clazz_name}
	 */
	protected function getRow($sqlQuery) {
		$tab = QueryExecutor::execute($sqlQuery);
		if (count($tab) == 0) {
			return null;
		}
		return $this->readRow($tab[0]);
	}

    	/**
	 * @param $sqlQuery
	 * @return int
	 */
	protected function execute($sqlQuery) {
		return QueryExecutor::execute($sqlQuery);
	}

    	/**
	 * @param $sqlQuery
	 * @return int
	 */
	protected function executeUpdate($sqlQuery) {
		return QueryExecutor::executeUpdate($sqlQuery);
	}

	/**
	 * @param $sqlQuery
	 * @return int
	 */
	protected function querySingleResult($sqlQuery) {
		return QueryExecutor::queryForString($sqlQuery);
	}

	/**
	 * @param $sqlQuery
	 * @return int
	 */
	protected function executeInsert($sqlQuery) {
		return QueryExecutor::executeInsert($sqlQuery);
	}
}
?>
