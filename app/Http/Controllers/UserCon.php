<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Mail\Registration_Mail;
use App\Models\Course;
use App\Models\Note;
use App\Traits\TRregister;

use App\Models\User;
use App\Traits\Messages;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Tymon\JWTAuth\Facades\JWTAuth;
use Tymon\JWTAuth\JWT;

use function Laravel\Prompts\note;

class UserCon extends Controller
{   

  use TRregister;
  use Messages;
  public function __construct()
{
  $this->middleware("token",['except' => ['login', 'register']]);
}

  static protected $rules=[
     "name"=>'required',
     "email"=>'required|email|unique:users',
     "password"=>'required',
];


    protected function register(Request $request) {

  
      $validation=Validator::make($request->all(),self::$rules);
      
      if($validation->fails()) {
        
        return $validation->errors();
      } 
      

      
        $user= User::create(
        [ 
         "name"=>$request->name,
         "email"=>$request->email,
         "password"=>bcrypt($request->password),
         ]
        );
         $token=$this->createNewToken($request);
    
        return $this->success("user added successfully",["user"=>$user,"token"=>$token]);
    }
    
    protected function login(Request $request)
    {
      $validator = Validator::make($request->all(), [
        'email' => 'required|email',
        'password' => 'required|string',
    ]);
    if ($validator->fails()) {
      return response()->json($validator->errors(), 422);
  }

return  $this->createNewToken($request);
   /*  return $this->success("login successfully",); */
    }
        
    protected function createNewToken(Request $request){

    if (! $token = JWTAuth::attempt(["email"=>$request->email,"password"=>$request->password])) {
        return response()->json(['error' => 'Unauthorized'], 401);
    }
      return response()->json([
          'token' => $token,
          "user"=>JWTAuth::user()
        
      ]);

  }
/* eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0L25vdGVzL3B1YmxpYy9hcGkvc2lnbi11cCIsImlhdCI6MTcwMTg4MzAzMywiZXhwIjoxNzAxODg2NjMzLCJuYmYiOjE3MDE4ODMwMzMsImp0aSI6IlVCeTE1M0lqMFBZaEF4V0MiLCJzdWIiOiIxIiwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.4jWldHU02Y94FP_0KteSdEjHXNtt8XeCuTwvY-1FkEM */

  protected function logout(Request $request) {
    JWTAuth::invalidate($request->token);
    return response()->json(['message' => 'User successfully signed out']);
}

public function update(Request $request,$id) {
  $user=User::find($id);
  if($user==null){ return response(["message"=>"user not found","success"=>false]);}
  $user->update
  ([      

    "name"=>$request->name,
    "email"=>$request->email,
    "password"=>bcrypt($request->password),
    "phone_number"=>$request->phone_number,
    "gender"=>$request->gender,

]);
  $user->save();
  return ["message"=>"user updated successfully","success"=>true];
}

public function delete($id) {
  $user=User::find($id);
  if($user==null) { 
    return response(["message"=>"user not found","success"=>false]);
  }

  $user->delete();

  return ["message"=>"user deleted successfully","success"=>true];
}
public function get_notes($user_id) {
  $user=User::find($user_id);
  if($user==null) { 
    return $this->error("user isn't found");
  }
  return Note::join("users","notes.user_id","=","users.id")->select("notes.*")->where("users.id",$user_id)->get();
}

}
/* eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0L3NjaG9vbC9wdWJsaWMvYXBpL2xvZ2luIiwiaWF0IjoxNzAwMDc5ODY1LCJleHAiOjE3MDAwODM0NjUsIm5iZiI6MTcwMDA3OTg2NSwianRpIjoidnlSRVlncDJmM0F5ck5rOCIsInN1YiI6IjExIiwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.geOePPdznJL0FPWuP6G5rszj68BwxGIPoeSBxc-lTvA */
