<?php

	class db{

		var $connection;
		var $errorMsg;

		var $countreconect = 0;

		var $maxconuntreconect = 100;

		function __construct(){

			//include_once 'constants.php';
			//echo dbhost.dbuser.dbpass;

			$dbhost='localhost';
			$dbuser='root';
			$dbpass='root';
			$dbname='blog';


			$this->connection=mysqli_connect($dbhost, $dbuser, $dbpass) or die(mysqli_error($this->connection));
			mysqli_set_charset($this->connection, "utf8");
			mysqli_select_db($this->connection, $dbname) or die(mysqli_error($this->connection));

		}


		function sqlQuery($query){

			$result=mysqli_query($this->connection, $query);
			if (!$result){

				$this->sql_reconect($query);

			}

			return $result;
		}


		function getIdInsert(){

			return mysqli_insert_id($this->connection);
		}


		function loadArrayData($query){

			$result=$this->sqlQuery($query);
			$num=mysqli_num_rows($result);

			for($i=0;$i<$num;$i++){
			 	$res[]=mysqli_fetch_array($result,MYSQLI_ASSOC);
			}
			while(mysqli_more_results($this->connection) && mysqli_next_result($this->connection))
				mysqli_store_result($this->connection);
			return $res;
		}

		function sqlQueryAndError($query){
			$result=$this->sqlQuery($query);

			while(mysqli_more_results($this->connection) && mysqli_next_result($this->connection))
				mysqli_store_result($this->connection);

			$res_error=$this->loadOneData('SELECT @errorMsg');

			$this->errorMsg = $res_error['@errorMsg'];


		}

		function loadOneDataAndError($query){
			$res=$this->loadOneData($query);

			$res_error=$this->loadOneData('SELECT @errorMsg');

			$this->errorMsg = $res_error['@errorMsg'];

			return $res;


		}


		function loadArrayDataAndError($query){

			$res=$this->loadArrayData($query);

			$res_error=$this->loadOneData('SELECT @errorMsg');

			$this->errorMsg = $res_error['@errorMsg'];

			return $res;


		}

		function loadOneData($query){

			$result=$this->sqlQuery($query);

			$num=mysqli_num_rows($result);

			if ($num!=0){

				$res=mysqli_fetch_array($result,MYSQLI_ASSOC);

			}

			while(mysqli_more_results($this->connection) && mysqli_next_result($this->connection))
				mysqli_store_result($this->connection);

			return $res;
		}




		function sql_reconect($query){


			if($this->countreconect < $this->maxconuntreconect){




				if (!mysqli_ping($this->connection)) {

					mysqli_close($this->connection);

					$this->connection=mysqli_connect(dbhost, dbuser, dbpass) or die(mysqli_error($this->connection));
					mysqli_set_charset($this->connection, "utf8");
					mysqli_select_db($this->connection, dbname) or die(mysqli_error($this->connection));

				}

				$this->sqlQuery($query);


			}
			else{

				die("Ошибка!");

			}



		}

	}
?>
