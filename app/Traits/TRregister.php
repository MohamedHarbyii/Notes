<?php
namespace App\Traits;

use App\Mail\Registration_Mail;
use App\Models\Student;
use App\Models\Teacher;
use Illuminate\Support\Facades\Mail;

trait TRregister
{
/* 
*check if it's student or teacher or any other job in the school
*
* @param $type 
* pass the user id  to attach the base table (user) with the child table (student or teacher)
* @param $user_id
*/
    public function checkUserType($type,$user_id) {
        if(strtoupper($type)=="S") {
      
            Student::create(["user_id"=>$user_id]);
           }
           elseif(strtoupper($type)=="T") {
            
            Teacher::create(["user_id"=>$user_id]);
           }
    }
    public function CreateCodeConfirmation() {
        return  mt_rand(100000, 999999);
    }
    public function SendRegistrationMail($email,$username,$randomNumber) {
        Mail::to($email)->send(new Registration_Mail($username,$randomNumber));
    }
}