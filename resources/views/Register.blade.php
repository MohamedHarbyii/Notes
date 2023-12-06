<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Welcoming</title>
</head>
<body>
  <center>
    <H1>Welcome {{$name}}</H1>
    <H2>Thist is the Confirmation Code {{$confirm}} 	<span style="color: rgb(155, 35, 35)">❤</span></H2>
    <form action="http://localhost/school/public/api/register" method="post">

  <button name="confirm_register" value="true">
   <h3 style="font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif">Confirm</h3>
  </button>
  </form>
</center>  

</body>
</html>
<style>
    body {
        font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif;
        background-color: rgb(133, 163, 163)
    }
    h1 {
   
    }
    button {

        padding: 2%;

        
    }
</style>