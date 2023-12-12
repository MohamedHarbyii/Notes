<?php
namespace App\Traits;



trait Messages {
public function error($message=null) {
    $response=['message'=>$message,'success'=>false];
       
    return response()->json($response);
}
public function success($message=null,$data=null) {
    return response()->json(['message'=>$message,'success'=>true,'data'=>$data],200);

}}