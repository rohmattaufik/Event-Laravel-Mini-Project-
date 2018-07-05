<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Validator;
use App\Ticket;
use App\Transaction;
use App\TransactionTicket;
use App\Event;
use App\User;

class TransactionController extends Controller
{
    
    public function purchase(Request $request){
        
        $rules = array(
            'id_user'       => 'required',
            'id_event'      => 'required',
            'tickets'       => 'required',
        );

        $validator = Validator::make($request->all(), $rules);

        if ($validator->fails()) {
            return response()->json([
                'status'    => 'error',
                'message'   => 'Your data not complete or false'
            ],500);
        }

        $user = User::find($request->id_user);
        if($user == null){
            return response()->json([
                'status'    => 'error',
                'message'   => 'User Not Found'
            ],404);
        }


        foreach($request->tickets as $ticket){
            $get_ticket = Ticket::find($ticket['id']);
            if($get_ticket->id_event != $ticket['id']){
                return response()->json([
                    'status'    => 'error',
                    'message'   => 'You not permit buy ticktes in more than one event'
                ],500);
            }
        }

        $event = Event::find($request->id_event);
        if($event == null){
            return response()->json([
                'status'    => 'error',
                'message'   => 'Event not found'
            ],404);
        }

        $tickets = Ticket::where('id_event',$event->id)->get();
        foreach($tickets as $ticket){
            foreach($request->tickets as $buy_ticket){
                if($ticket->id == $buy_ticket['id']){
                    $ticket->quantity -= $buy_ticket['quantity'];
                    if($ticket->quantity < 0){
                        return response()->json([
                            'status'    => 'error',
                            'message'   => 'Your quantity exceed tickets stock'
                        ],500);
                    }
                }
            }
        }

        foreach($tickets as $ticket){
            $ticket->save();
        }

        $transaction = new Transaction;
        $transaction->id_event = $request->id_event;
        $transaction->id_user  = $request->id_user;
        $transaction->save();

        foreach($request->tickets as $ticket){
            $transaction_ticket = new TransactionTicket;
            $transaction_ticket->id_transaction = $transaction->id;
            $transaction_ticket->id_ticket      = $ticket['id'];
            $transaction_ticket->quantity       = $ticket['quantity'];
            $transaction_ticket->save();
        }
        
        return response()->json([
            'status'    => 'success',
            'message'   => 'Your Transaction Saved',
            'transaction' => $transaction,
            
        ],200);

    }

    public function get_transaction ( $id_transaction ){
        $transaction = Transaction::find($id_transaction);
        if($transaction == null){
            return response()->json([
                'status'    => 'error',
                'message'   => 'Transaction not found'
            ],404);
        }
        $transaction['tickets'] = TransactionTicket::where('id_transaction', $id_transaction)->get();
        foreach($transaction['tickets'] as $ticket){
            $ticket['ticket_detail'] = Ticket::find($ticket->id_ticket);
        }
        return response()->json([
            'status'        => 'success',
            'transaction'   => $transaction
        ],200); 
    }
}
