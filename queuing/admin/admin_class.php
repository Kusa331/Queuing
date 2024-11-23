<?php
session_start();
ini_set('display_errors', 1);
Class Action {
	private $db;

	public function __construct() {
		ob_start();
   	include 'db_connect.php';
    
    $this->db = $conn;
	}
	function __destruct() {
	    $this->db->close();
	    ob_end_flush();
	}

	function login(){
		extract($_POST);
		$qry = $this->db->query("SELECT * FROM users where username = '".$username."' and password = '".md5($password)."' ");
		if($qry->num_rows > 0){
			foreach ($qry->fetch_array() as $key => $value) {
				if($key != 'passwors' && !is_numeric($key))
					$_SESSION['login_'.$key] = $value;
			}
				return 1;
		}else{
			return 3;
		}
	}
	function logout(){
		session_destroy();
		foreach ($_SESSION as $key => $value) {
			unset($_SESSION[$key]);
		}
		header("location:login.php");
	}

	// function save_user(){
	// 	extract($_POST);
	// 	$data = " name = '$name' ";
	// 	$data .= ", username = '$username' ";
	// 	if(!empty($password))
	// 	$data .= ", password = '".md5($password)."' ";
	// 	$data .= ", type = '$type' ";
	// 	$data .= ", window_id = '$window_id' ";
	// 	$chk = $this->db->query("Select * from users where username = '$username' and id !='$id' ")->num_rows;
	// 	if($chk > 0){
	// 		return 2;
	// 		exit;
	// 	}
	// 	if(empty($id)){
	// 		$save = $this->db->query("INSERT INTO users set ".$data);
	// 	}else{
	// 		$save = $this->db->query("UPDATE users set ".$data." where id = ".$id);
	// 	}
	// 	if($save){
	// 		return 1;
	// 	}
	// }

	function save_user() {
        extract($_POST);
        $data = " name = '$name' ";
        $data .= ", username = '$username' ";
        if (!empty($password))
            $data .= ", password = '" . md5($password) . "' ";
        $data .= ", type = '$type' ";
        $data .= ", window_id = '$window_id' ";
        $chk = $this->db->query("SELECT * FROM users WHERE username = '$username' AND id != '$id'")->num_rows;
        if ($chk > 0) {
            return 2;
            exit;
        }
        if (empty($id)) {
            $save = $this->db->query("INSERT INTO users SET $data");
        } else {
            $save = $this->db->query("UPDATE users SET $data WHERE id = $id");
        }
        if ($save) {
            return 1;
        }
    }
	function delete_user(){
		extract($_POST);
		$delete = $this->db->query("DELETE FROM users where id = ".$id);
		if($delete)
			return 1;
	}
	function signup(){
		extract($_POST);
		$data = " name = '$name' ";
		$data .= ", contact = '$contact' ";
		$data .= ", address = '$address' ";
		$data .= ", username = '$email' ";
		$data .= ", password = '".md5($password)."' ";
		$data .= ", type = 3";
		$chk = $this->db->query("SELECT * FROM users where username = '$email' ")->num_rows;
		if($chk > 0){
			return 2;
			exit;
		}
			$save = $this->db->query("INSERT INTO users set ".$data);
		if($save){
			$qry = $this->db->query("SELECT * FROM users where username = '".$email."' and password = '".md5($password)."' ");
			if($qry->num_rows > 0){
				foreach ($qry->fetch_array() as $key => $value) {
					if($key != 'passwors' && !is_numeric($key))
						$_SESSION['login_'.$key] = $value;
				}
			}
			return 1;
		}
	}

	function save_settings(){
		extract($_POST);
		$data = " name = '".str_replace("'","&#x2019;",$name)."' ";
		$data .= ", email = '$email' ";
		$data .= ", contact = '$contact' ";
		$data .= ", about_content = '".htmlentities(str_replace("'","&#x2019;",$about))."' ";
		if($_FILES['img']['tmp_name'] != ''){
						$fname = strtotime(date('y-m-d H:i')).'_'.$_FILES['img']['name'];
						$move = move_uploaded_file($_FILES['img']['tmp_name'],'assets/img/'. $fname);
					$data .= ", cover_img = '$fname' ";

		}
		
		// echo "INSERT INTO system_settings set ".$data;
		$chk = $this->db->query("SELECT * FROM system_settings");
		if($chk->num_rows > 0){
			$save = $this->db->query("UPDATE system_settings set ".$data);
		}else{
			$save = $this->db->query("INSERT INTO system_settings set ".$data);
		}
		if($save){
		$query = $this->db->query("SELECT * FROM system_settings limit 1")->fetch_array();
		foreach ($query as $key => $value) {
			if(!is_numeric($key))
				$_SESSION['setting_'.$key] = $value;
		}

			return 1;
				}
	}

	
	function save_transaction(){
		extract($_POST);
		$data = " name = '$name' ";
		$cwhere ='';
		if(!empty($id)){
			$cwhere = " and id != $id ";
		}
		$chk =  $this->db->query("SELECT * FROM transactions where ".$data.$cwhere)->num_rows;
		if($chk > 0){
			return 2;
			exit;
		}
		if(empty($id)){
			$save = $this->db->query("INSERT INTO transactions set ".$data);
		}else{
			$save = $this->db->query("UPDATE transactions set ".$data." where id=".$id);
		}
		if($save)
			return 1;
	}
	function delete_transaction(){
		extract($_POST);
		$delete = $this->db->query("DELETE FROM transactions where id = ".$id);
		if($delete)
			return 1;
	}
	
	function save_window(){
		extract($_POST);
		$data = " name = '$name' ";
		$data .= ", transaction_id = '$transaction_id' ";
		$cwhere ='';
		if(!empty($id)){
			$cwhere = " and id != $id ";
		}
		$chk =  $this->db->query("SELECT * FROM transaction_windows where name = '$name' and transaction_id = '$transaction_id' ".$cwhere)->num_rows;
		if($chk > 0){
			return 2;
			exit;
		}
		if(empty($id)){
			$save = $this->db->query("INSERT INTO transaction_windows set ".$data);
		}else{
			$save = $this->db->query("UPDATE transaction_windows set ".$data." where id=".$id);
		}
		if($save)
			return 1;
	}
	function delete_window(){
		extract($_POST);
		$delete = $this->db->query("DELETE FROM transaction_windows where id = ".$id);
		if($delete)
			return 1;
	}
	function save_uploads(){
		extract($_POST);
		$ids= array();
		for($i = 0 ; $i< count($img);$i++){
			list($type, $img[$i]) = explode(';', $img[$i]);
			list(, $img[$i])      = explode(',', $img[$i]);
			$img[$i] = str_replace(' ', '+', $img[$i]);
			$img[$i] = base64_decode($img[$i]);
			$fname = strtotime(date('Y-m-d H:i'))."_".$imgName[$i];
			// $upload = move_uploaded_file($fname,$img[$i],"assets/uploads/");
			$upload = file_put_contents("assets/uploads/".$fname,$img[$i]);
			$data = " file_path = '".$fname."' ";
			if($upload)
			$save[] = $this->db->query("INSERT INTO file_uploads set".$data);
			else{
				echo "INSERT INTO file_uploads set".$data;
				exit;
			}
		}
		if(isset($save)){
			return 1;
		}
	}
	function delete_uploads(){
		extract($_POST);
		$path = $this->db->query("SELECT file_path FROM file_uploads where id = ".$id)->fetch_array()['file_path'];
		$delete = $this->db->query("DELETE FROM file_uploads where id = ".$id);
		if($delete)
			unlink('assets/uploads/'.$path);
			return 1;
	}
	function save_queue() {
        extract($_POST);
        $data = " name = '$name' ";
        $data .= ", transaction_id = '$transaction_id' ";
        $queue_no = 1001;

        $chk = $this->db->query("SELECT COUNT(*) AS count FROM queue_list WHERE transaction_id = $transaction_id AND DATE(date_created) = CURDATE()")->fetch_assoc();
        if ($chk['count'] > 0) {
            $queue_no += $chk['count'];
        }
        $data .= ", queue_no = '$queue_no' ";
        $data .= ", status = 0 "; // Default status
        $data .= ", date_created = NOW() ";
        $data .= ", created_timestamp = NOW() ";

        $default_window_id = $this->db->query("SELECT id FROM transaction_windows WHERE transaction_id = $transaction_id LIMIT 1")->fetch_assoc()['id'];
        if ($default_window_id) {
            $data .= ", window_id = '$default_window_id' ";
        }

        $save = $this->db->query("INSERT INTO queue_list SET $data");
        if ($save) {
            return $this->db->insert_id;
        }
        return 0;
    }

    function get_queue() {
		extract($_POST);
		$id = (int)$id; // Ensure it's an integer
		$query = $this->db->query("
			SELECT q.*, t.name AS wname 
			FROM queue_list q 
			INNER JOIN transaction_windows t ON t.id = q.window_id 
			WHERE DATE(q.date_created) = CURDATE() 
			AND q.transaction_id = '$id' 
			AND q.status = 1 
			ORDER BY q.id DESC 
			LIMIT 1
		");
		if ($query->num_rows > 0) {
			foreach ($query->fetch_array() as $key => $value) {
				if (!is_numeric($key))
					$data[$key] = $value;
			}
			return json_encode(['status' => 1, 'data' => $data]);
		} else {
			return json_encode(['status' => 0]);
		}
	}
	
	function update_queue() {
		if (!isset($_SESSION['login_window_id'])) {
			return json_encode(['status' => 0, 'message' => 'Window ID not found in session']);
		}
		$window_id = $_SESSION['login_window_id'];
	
		// Get the transaction ID for the current window
		$tid_query = $this->db->query("SELECT transaction_id FROM transaction_windows WHERE id = $window_id");
		if (!$tid_query || $tid_query->num_rows == 0) {
			return json_encode(['status' => 0, 'message' => 'Transaction ID not found for this window']);
		}
		$transaction_id = $tid_query->fetch_assoc()['transaction_id'];
	
		// Update the queue for the current transaction
		$update_query = $this->db->query("
			UPDATE queue_list 
			SET status = 1, window_id = '$window_id' 
			WHERE transaction_id = '$transaction_id' 
			AND DATE(date_created) = CURDATE() 
			AND status = 0 
			ORDER BY id ASC 
			LIMIT 1
		");
		if (!$update_query) {
			return json_encode(['status' => 0, 'message' => 'Failed to update the queue']);
		}
	
		// Fetch the updated queue for the current transaction and window
		$query = $this->db->query("
			SELECT q.*, t.name AS wname 
			FROM queue_list q 
			INNER JOIN transaction_windows t ON t.id = q.window_id 
			WHERE DATE(q.date_created) = CURDATE() 
			AND q.transaction_id = '$transaction_id' 
			AND q.window_id = '$window_id' 
			AND q.status = 1 
			ORDER BY q.id DESC 
			LIMIT 1
		");
		if (!$query || $query->num_rows == 0) {
			return json_encode(['status' => 0, 'message' => 'No queues to serve']);
		}
	
		$data = [];
		foreach ($query->fetch_assoc() as $key => $value) {
			$data[$key] = $value;
		}
	
		return json_encode(['status' => 1, 'data' => $data]);
	}
	
}
