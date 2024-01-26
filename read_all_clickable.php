<?php
$return["data"] = array();
include "connection.php";


$major=$_POST['search2'];
//$major='DATA BASE';


  if(isset($_REQUEST["auth"]))
  {
    $authkey = $_REQUEST["auth"];
    if($authkey == "kjgdkhdfldfguttedfgr")
    {
        $json["data"] = array();
        $sql = "

SELECT * FROM t_students where major='$major' 




        ";
        $res = mysqli_query($connect, $sql);
        $numrows = mysqli_num_rows($res);
        while($array = mysqli_fetch_assoc($res))
        {
          array_push($return["data"], $array);
        }
        mysqli_close($connect);
        header('Content-Type: application/json');
    }
        else
        {
        $return["error"] = true;
        $return["msg"] = "Authentication error.";
        }
    }
    else{
        $return["error"]  = true;
        $return["msg"] = "Send auth key.";
        }
    header('Content-Type: application/json');
    echo json_encode($return);
    ?>
    
