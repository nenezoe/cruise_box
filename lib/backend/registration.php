<?php
//Define your Server host name here.
 $HostName = "localhost";

 //Define your MySQL Database Name here.
 $DatabaseName = "flutter_db";

 //Define your Database User Name here.
 $HostUser = "root";

 //Define your Database Password here.
 $HostPass = "";

 // Creating MySQL Connection.
 $conn = mysqli_connect($HostName,$HostUser,$HostPass,$DatabaseName);
//
//   // Getting the received JSON into $json variable.
//   $json = file_get_contents('php://input');
//
//    // Decoding the received JSON and store into $obj variable.
//    $obj = json_decode($json,true);
//
//    // Getting User name from JSON $obj array and store into $email.
//    $username = $obj['username'];
//
//    // Getting Password from JSON $obj array and store into $password.
//      $password = $obj['password'];
//
//     // Getting phone from JSON $obj array and store into $password.
//      $phone = $obj['phone'];
//
//     // Getting address from JSON $obj array and store into $password.
//        $email = $obj['email'];

       //Applying User Login query with email and password.

//        $sql = "INSERT INTO users (username, phone, email,password)
//        VALUES ('John', '0676', 'jhtdfyytd','hghffu')";
//
//        $query =($conn, $sql);



    $username = $_POST["username"];
    $email= $_POST["email"];
    $phone= $_POST["phone"];
    $password = $_POST["password"];

    require_once 'connect.php';
     $findexist="select * from registration where username='$username'";
      $resultsearch=mysqli_query($conn,$findexist);
    if(mysqli_num_rows($resultsearch)>0)
    {
           while($row=mysqli_fetch_array($resultsearch))
          {
              $result["success"] = "3";
              $result["message"] = "user Already exist";
              echo json_encode($result);
              mysqli_close($conn);
          }
  }
else{
    $sql = "INSERT INTO users (username,email,phone,password) VALUES ('$username','$email','$phone','$password');";
    if ( mysqli_query($conn, $sql) ) {
        $result["success"] = "1";
        $result["message"] = "Registration success";
        echo json_encode($result);
        mysqli_close($conn);
    } else {
        $result["success"] = "0";
        $result["message"] = "error in Registration";
        echo json_encode($result);
        mysqli_close($conn);
    }
}
?>