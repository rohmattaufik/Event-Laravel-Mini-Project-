<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;
use Validator;
use Hash;

class UserController extends Controller
{
    
    public function create_user(Request $request){
        $rules = array(
            'name'          => 'required',
            'email'         => 'required',
            'password'      => 'required',
        );

        $validator = Validator::make($request->all(), $rules);

        if ($validator->fails()) {
            return response()->json([
                'status'    => 'error',
                'message'   => 'Your data not complete or false'
            ],500);
        }

        $password = Hash::make($request->password);
        $user = new User;
        $user->name = $request->name;
        $user->email = $request->email;
        $user->password = $password;   
        $user->save();

        return response()->json([
            'status'    => 'success',
            'message'   => 'User saved',
            'user'     => $user
        ],200);
    }
}
