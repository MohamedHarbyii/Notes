<?php

namespace App\Http\Middleware;

use App\Traits\Messages;
use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use Tymon\JWTAuth\Facades\JWTAuth;

class userToken
{use Messages;
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        try{JWTAuth::parseToken()->authenticate() ;} 
        catch (\Exception $e){return $this->error( 'Invalid token'); }
            
       return  $next($request);

    }
}
