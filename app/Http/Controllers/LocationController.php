<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Location;
use Validator;

class LocationController extends Controller
{
    
    public function create_location(Request $request){
        $rules = array(
            'location'  => 'required',
            'city'      => 'required',
            'longitude' => 'required',
            'latitude'  => 'required'
        );

        $validator = Validator::make($request->all(), $rules);

        if ($validator->fails()) {
            return response()->json([
                'status'    => 'error',
                'message'   => 'Your data not complete'
            ],500);
        }
        $new_location           = new Location;
        $new_location->location = $request->location;
        $new_location->city     = $request->city;
        $new_location->latitude = $request->latitude;
        $new_location->longitude = $request->longitude;
        $new_location->save();
        return response()->json([
            'status'    => 'success',
            'message'   => 'New Location Saved',
            'location'  =>  $new_location
        ],200);
    }

    public function get_location($id_location){
        $location = Location::find($id_location);
        if($location == null){
            return response()->json([
                'status'    => 'error',
                'message'   => 'Event not found'
            ],404);
        }
        return response()->json([
            'status'    => 'success',
            'location'  =>  $location
        ],200); 
    }
}
