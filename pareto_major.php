
<?php

include "connection.php";

$major=$_POST['search2'];


if(isset($_REQUEST["auth"]))
  {

    $authkey = $_REQUEST["auth"];
    if($authkey == "kjgdkhdfldfguttedfgr")
    {

  if($connect) {
	  $sql="
	SELECT major, COUNT(major) AS count
	FROM t_students
	GROUP BY major
	";

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
