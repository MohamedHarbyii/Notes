<?php
namespace App\Traits;
trait Messages {
public function error($message=null) {
    return response(["message"=>$message,"success"=>false]);
}
public function success($message=null,$data=null) {
    return response(["message"=>$message,"success"=>true,"data"=>$data]);
}
}