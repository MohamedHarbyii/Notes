<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Note;
use App\Traits\Messages;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class note_con extends Controller
{   protected 
    $rules =["user_id"=>"required","title"=>"required|max:100","caption"=>"required|max:5000"] ;

    use Messages;
    public function __construct()
    {
        $this->middleware("token");
        $this->middleware("cors");


    }
    public function create(Request $request) {
      $Validator=Validator::make($request->all(),$this->rules);
      if($Validator->fails()){return $this->error($Validator);}
       $note= Note::create(["user_id"=>$request->user_id,"title"=>$request->title,"caption"=>$request->caption]);
       return $this->success("note created successfully",$note);
    }
    public function update(Request $request,$id) {
        $Validator=Validator::make($request->all(),$this->rules);
        if($Validator->fails()){return $this->error($Validator) ;}
        
        $note= Note::find($id);
        if($note==null){return $this->error("note isn't found");}
        
        $note->update(["user_id"=>$request->user_id,"title"=>$request->title,"caption"=>$request->caption]);
        $note->save();
        return $this->success("note updated successfully",$note);
    }
    public function delete($id) {
        $note= Note::find($id);
        if($note==null){return $this->error("note isn't found");}
        $note->delete();  
        return $this->success("note deleted successfully");  
    }
    public function get($id) {
        $note= Note::find($id);
        if($note==null){return $this->error("note isn't found");}
        return $this->success("note is found",$note);
    }
    public function add_to_favorite($id) {
        $note= Note::find($id);
        if($note==null){return $this->error("note isn't found");}
        $note->favourite=1;
        $note->save();
        return $this->success("note updated successfully",$note);
    }
}
