

<?php



include "connection.php";

if(isset($_REQUEST["auth"]))
  {

    $authkey = $_REQUEST["auth"];
    if($authkey == "kjgdkhdfldfguttedfgr")
    {

  if($connect) {
	  $sql='
          SELECT COUNT(student_id) AS jumlah FROM t_students
	';

$query=mysqli_query($connect, $sql);
$results=array();


while($row=mysqli_fetch_assoc($query)) {
		$results[]=$row;
}

echo json_encode($results);
}
  }
}

?>


