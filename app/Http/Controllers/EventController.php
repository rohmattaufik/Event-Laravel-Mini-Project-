<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Event;
use App\Location;
use App\Ticket;
use Validator;
use DateTime;

class EventController extends Controller
{
    
    public function get_info ( $id_event ){
        $event = Event::find($id_event);
        if($event == null){
            // when event not found
            return response()->json([
                'status'    => 'error',
                'message'   => 'Event not found'
            ],404);
        }
        $event['location'] = Location::find($event->id_location);
        if($event['location'] == null){
            // when location not found
            return response()->json([
                'status'    => 'error',
                'message'   => 'Events Location not found'
            ],404);
        }

        $event['tickets'] = Ticket::where('id_event',$event->id)->get();
        return response()->json([
            'status'    => 'success',
            'event'     => $event
        ],200);
    }

    public function create_event(Request $request){
        
        $rules = array(
            'name'          => 'required',
            'description'   => 'required',
            'id_location'   => 'required | numeric',
            'date_start'    => 'required | date_format:Y-m-d',
            'date_close'    => 'required | date_format:Y-m-d',
            'time_start'    => 'required | date_format:H:i:s',
            'time_close'    => 'required | date_format:H:i:s',
            'image'         => 'required | mimes:jpeg,jpg,png'
        );

        $validator = Validator::make($request->all(), $rules);

        if ($validator->fails()) {
            return response()->json([
                'status'    => 'error',
                'message'   => 'Your data not complete or false'
            ],500);
        }

        $startTime = new DateTime($request->date_start ." ". $request->time_start);
        $closeTime = new DateTime($request->date_close ." ". $request->time_close);
        if($closeTime <= $startTime){
            return response()->json([
                'status'    => 'error',
                'message'   => 'Close Time must more than Start Time'
            ],500);
        }

        $location = Location::find($request->id_location);
        if($location == null){
            return response()->json([
                'status'    => 'error',
                'message'   => 'Location not found'
            ],500);
        } 

        $image = $request->file('image');
        $destinationPath = 'images';
        $move = $image->move($destinationPath,$image->getClientOriginalName());
        $url_image = "images/{$image->getClientOriginalName()}";

        $event                 = new Event;
        $event->name           = $request->name;
        $event->description    = $request->description;
        $event->id_location    = $request->id_location;
        $event->date_start     = $request->date_start;
        $event->date_close     = $request->date_close;
        $event->time_start     = $request->time_start;
        $event->time_close     = $request->time_close;
        $event->url_image      = $url_image;
        $event->save();

        return response()->json([
            'status'    => 'success',
            'message'   => 'Your event saved',
            'event'     => $event
        ],200);

    }

    public function create_ticket(Request $request){
        $rules = array(
            'id_event'      => 'required | numeric',
            'name'          => 'required',
            'detail'        => 'required',
            'quantity'      => 'required | numeric',
            'price'         => 'required | numeric',
        );

        $validator = Validator::make($request->all(), $rules);

        if ($validator->fails()) {
            return response()->json([
                'status'    => 'error',
                'message'   => 'Your data not complete or false'
            ],500);
        }

        $event = Event::find($request->id_event);
        if($event == null){
            return response()->json([
                'status'    => 'error',
                'message'   => 'Event not found'
            ],500);
        }

        $ticket             = new Ticket;
        $ticket->id_event   = $request->id_event;
        $ticket->name       = $request->name;
        $ticket->detail     = $request->detail;
        $ticket->quantity   = $request->quantity;
        $ticket->price      = $request->price;
        $ticket->save();

        return response()->json([
            'status'    => 'success',
            'message'   => 'Your ticket saved',
            'event'     => $ticket
        ],200);
    }
}
