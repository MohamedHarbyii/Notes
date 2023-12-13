<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\NoteBook;
use App\Traits\Messages;
use Illuminate\Http\Request;

use Illuminate\Support\Facades\Validator;

class notebookCon extends Controller
{  use Messages;
   private $rules=["title"=>"required","user_id"=>"required"];
    public function create(Request $request) {
        $Validator=Validator::make($request->all(),$this->rules);
        if($Validator->fails()) {
          return $this->error($Validator);
        }
        $NoteBook=NoteBook::create(["title"=>$request->title,"user_id"=>$request->user_id]);

      return $this->success("note book created successfully",$NoteBook);
    }
    public function update(Request $request,$id) {
      $NoteBook=NoteBook::find($id);
      if($NoteBook==null) {
        return $this->error("note book wasn't found");
        
      }
      $NoteBook->title=$request->title;
      $NoteBook->save();
      return $this->success("note book updated succeffully",$NoteBook);
    }
    public function delete($id) {
        $NoteBook=NoteBook::find($id);
        if($NoteBook==null) {
          return $this->error("note book wasn't found");
        }
        $NoteBook->delete();
        return $this->success("note book deleted successfully");
    }
}
