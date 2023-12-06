<?php
namespace App\Traits;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

trait validation {
    public function validate_request(Request $request,$rules) {
        $validator=Validator::make($request->all(),$rules);
        if($validator->fails()){
            return $validator->errors();
        }
        return true;
    }
}