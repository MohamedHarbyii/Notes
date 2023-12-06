<?php

namespace App\Http\Middleware;

use App\Http\Controllers\StudentCon;
use App\Http\Controllers\TeacherCon;
use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use Symfony\Component\HttpFoundation\Response;

class user_is
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        if(strtoupper($request->type)=="S") {
            return redirect()->to('api/student/register');
            
          
        }
        elseif(strtoupper($request->type)=="T") {
            return redirect()->to('api/teacher/register')->header("header",$request->all());
        }
     return $next($request);
    }
}
